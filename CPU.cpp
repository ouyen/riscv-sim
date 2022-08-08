#include "CPU.h"
#include <stdarg.h>
#include <string.h>

string REG_NAME_CHAR[32] = {
    "zero",  // x0
    "ra",    // x1
    "sp",    // x2
    "gp",    // x3
    "tp",    // x4
    "t0",    // x5
    "t1",    // x6
    "t2",    // x7
    "s0",    // x8
    "s1",    // x9
    "a0",    // x10
    "a1",    // x11
    "a2",    // x12
    "a3",    // x13
    "a4",    // x14
    "a5",    // x15
    "a6",    // x16
    "a7",    // x17
    "s2",    // x18
    "s3",    // x19
    "s4",    // x20
    "s5",    // x21
    "s6",    // x22
    "s7",    // x23
    "s8",    // x24
    "s9",    // x25
    "s10",   // x26
    "s11",   // x27
    "t3",    // x28
    "t4",    // x29
    "t5",    // x30
    "t6",    // x31
};

void CPU::error(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    vprintf(fmt, args);
    va_end(args);
    // exit(-1);
    cpu_exit();
}

CPU::CPU(MemoryMangerUnit* _mmu, uint64_t _pc, uint64_t stack_point) {
    MMU = _mmu;
    PC = _pc;
    reg[REG_NAME::SP] = stack_point;
}

uint64_t CPU::extender(uint32_t imm, uint8_t len, bool signext) {
    if (len >= 64) {
        return imm;
    }
    if (len >= 32) {
        int64_t tmp = imm;
        return tmp;
    }
    uint64_t extern_imm;
    uint64_t mask = (1 << len) - 1;       // mask=0b00...1111
    uint64_t sign_mask = 1 << (len - 1);  // sign_mask=0b00...1...000
    if ((sign_mask & imm) != 0 and signext) {
        //符号位为1且为符号扩展
        extern_imm = (~mask | (uint64_t)imm);
    } else {
        extern_imm = mask & (uint64_t)imm;
    }
    return extern_imm;
}

void CPU::run() {
    while (!exit_flag) {
        ++cycle_count;
        cout << hex;
        if (print_log)
            cout << endl
                 << "---------Cycle: 0x" << cycle_count << "---------" << endl
                 << endl;
        if (PC == 0x101f8) {
            cout << "" << endl;
        }
        IF();
        if (single_step)
            ifid_old = ifid_new;

        ID();
        if (single_step)
            idex_old = idex_new;

        EX();
        if (single_step)
            exmem_old = exmem_new;

        MEM();
        if (single_step)
            memwb_old = memwb_new;

        WB();

        if (print_log) {
            cout << "-------curr REG -------" << endl;
            cout << dec;
            for (int i = 0; i < 32; ++i) {
                cout << "REG " << REG_NAME_CHAR[i] << ": " << (int)reg[i]
                     << "\t";
                if ((i + 1) % 5 == 0)
                    cout << endl;
            }
            cout << hex << endl;
        }

        // new --> old
        ifid_old = ifid_new;
        idex_old = idex_new;
        exmem_old = exmem_new;
        memwb_old = memwb_new;

        memset(&ifid_new, 0, sizeof(ifid_new));
        memset(&idex_new, 0, sizeof(idex_new));
        memset(&exmem_new, 0, sizeof(exmem_new));
        memset(&memwb_new, 0, sizeof(memwb_new));

        reg[0] = 0;
    }
}

void CPU::IF() {  //取指
    if (stop_if_flag) {
        ifid_new = ifid_old;
        return;
    }
    ifid_new.instruction = MMU->load_4byte(PC);
    if (ifid_new.instruction == 0) {
        // ifid_new.bubble = true;
        error("IF ERROR, instruction is 0\n");
        return;
    }
    ifid_new.bubble = false;
    ifid_new.pc = PC;
    if (1) {
        PC = PC + 4;
    }
    if (print_log) {
        cout << hex;
        cout << "-------IF-------" << endl;
        cout << "PC: 0x" << ifid_new.pc << endl;
        cout << "Inst: 0x" << ifid_new.instruction << endl;
        // cout << endl;
    }
}

void CPU::ID() {
    idex_new.pc = ifid_old.pc;
    if (ifid_old.bubble) {
        idex_new.bubble = true;
        if (print_log) {
            cout << hex;
            cout << "-------ID-------" << endl;
            cout << "PC: 0x" << ifid_old.pc << endl << "bubble" << endl;
        }
        return;
    }

    idex_new.bubble = false;

    uint32_t inst = ifid_old.instruction;
    idex_new.opcode = (OPCODE)(inst & 0x7f);
    inst >>= 7;
    REG_NAME rd = (REG_NAME)((inst & 0x1f));
    inst >>= 5;
    idex_new.funct3 = (inst & 0b111);
    inst >>= 3;
    REG_NAME rs1 = (REG_NAME)(inst & 0x1f);
    inst >>= 5;
    REG_NAME rs2 = (REG_NAME)(inst & 0x1f);
    inst >>= 5;
    idex_new.funct7 = inst;

    inst = ifid_old.instruction;  // for imm later
    // tmp use
    uint32_t imm = 0;

    idex_new.Ctrl_M_MemRead = false;
    idex_new.Ctrl_M_MemWrite = false;
    idex_new.Ctrl_WB = NOT_WRITE;

    uint8_t imm_len = 12;  // default for I-type

    switch ((OPCODE)idex_new.opcode) {
        // deal with imm
        // set (rs1,rs2,rd) to ZERO if dont use
        //  idex_new.Ctrl_M_MemRead = ?;
        //  idex_new.Ctrl_M_MemWrite = ?;
        //  idex_new.Ctrl_WB = ?;
        case R:
        case I_ADDW:
            idex_new.Ctrl_WB = WB_ALU;
            break;
        case I_LB:
            imm = (inst >> 20);
            rs2 = ZERO;
            idex_new.Ctrl_WB = WB_MEM;
            idex_new.Ctrl_M_MemRead = 1 + idex_new.funct3;
            break;
        case I_ADDI:
        case I_ADDIW:
        case I_JALR:
            imm = (inst >> 20);
            rs2 = ZERO;
            idex_new.Ctrl_WB = WB_ALU;
            break;
        case I_ECALL:
            rs1 = A0;
            rs2 = A7;
            rd = A0;
            idex_new.Ctrl_WB = WB_ALU;
            break;
        case S:
            imm = ((inst >> 7) & 0x1f) | ((inst >> 20) & 0xfe0);
            rd = ZERO;
            idex_new.Ctrl_M_MemWrite = 1 + idex_new.funct3;
            break;
        case SB:
            imm = ((inst >> 7) & 0x1e) | ((inst >> 20) & 0x7e0) |
                  (((inst >> 7) & 0x1) << 11) | ((inst >> 31) << 12);
            imm_len = 13;
            rd = ZERO;
            break;
        case U_AUIPC:
        case U_LUI:
            rs1 = ZERO;
            rs2 = ZERO;
            imm = (inst & 0xfffff000);
            imm_len = 32;
            idex_new.Ctrl_WB = WB_WRITE_REG_FROM::WB_ALU;
            break;
        case UJ:
            // fix this imm bug
            imm = ((inst >> 31) << 20) | (((inst >> 21) & 0x3ff) << 1) |
                  ((inst >> 20) & 0x1) << 11 | (inst >> 12 & 0xff) << 12;
            imm &= (~0x1);
            rs1 = ZERO;
            rs2 = ZERO;
            imm_len = 21;
            idex_new.Ctrl_WB = WB_WRITE_REG_FROM::WB_ALU;
            break;
        default:
            error("ID ERROR: opcode %x not found\n", idex_new.opcode);
            break;
    }
    // idex_new.bubble = lock;
    // reg_lock[0] = 0;
    idex_new.imm = extender(imm, imm_len, true);
    idex_new.rs1 = rs1;
    idex_new.rs2 = rs2;
    idex_new.rd = rd;
    idex_new.rs1_reg = this->reg[rs1];
    idex_new.rs2_reg = this->reg[rs2];

    if (print_log) {
        cout << hex;
        cout << "-------ID-------" << endl;
        cout << "PC: 0x" << ifid_old.pc << endl;
        cout << "OPCODE: 0x" << idex_new.opcode << endl;
        cout << "func3: 0x" << (uint16_t)idex_new.funct3 << endl;
        cout << "func7: 0x" << (uint16_t)idex_new.funct7 << endl;
        cout << "imm: " << dec << (int64_t)idex_new.imm << hex << endl;
        cout << "rs1 " << REG_NAME_CHAR[rs1] << " rs2 " << REG_NAME_CHAR[rs2]
             << " rd " << REG_NAME_CHAR[rd] << endl;
        // cout << endl;
    }

    if (not single_step) {  // data hazards (1/2)
        if (idex_old.Ctrl_WB == WB_WRITE_REG_FROM::WB_MEM and
            idex_old.rd != ZERO and
            (idex_old.rd == idex_new.rs1 or idex_old.rd == idex_new.rs2)) {
            // pipline stall
            // which means keep fetch (let pc=ifid_old.pc), ex NOP
            // reset IF:
            this->PC = ifid_old.pc;
            ifid_new = ifid_old;
            idex_new.bubble = true;
            ++hazards_by_data_count;
        }
    }
    return;
}

void CPU::EX() {
    exmem_new.pc = idex_old.pc;

    if (idex_old.bubble) {
        exmem_new.bubble = true;
        if (print_log) {
            cout << hex;
            cout << "-------EX-------" << endl;
            cout << "PC: 0x" << idex_old.pc << endl << "bubble" << endl;
        }
        return;
    }
    exmem_new.bubble = false;

    exmem_new.rd = idex_old.rd;

    exmem_new.Ctrl_M_MemWrite = idex_old.Ctrl_M_MemWrite;
    exmem_new.Ctrl_M_MemRead = idex_old.Ctrl_M_MemRead;
    exmem_new.Ctrl_WB = idex_old.Ctrl_WB;

    uint64_t r1 = idex_old.rs1_reg;
    uint64_t r2 = idex_old.rs2_reg;
    uint64_t imm = idex_old.imm;

    if (not single_step) {  // data hazards (2/2)
        // 数据前递 data forward
        // 1.mem冒险
        if ((memwb_old.Ctrl_WB != WB_WRITE_REG_FROM::NOT_WRITE) and
            memwb_old.rd != ZERO) {
            uint64_t val = memwb_old.mem_out;
            if (memwb_old.Ctrl_WB == WB_WRITE_REG_FROM::WB_ALU)
                val = memwb_old.alu_out;
            if (memwb_old.rd == idex_old.rs1)
                r1 = val;
            if (memwb_old.rd == idex_old.rs2)
                r2 = val;
        }
        // 2. ex冒险
        if (exmem_old.Ctrl_WB != WB_WRITE_REG_FROM::NOT_WRITE and
            exmem_old.rd != ZERO) {
            if (exmem_old.Ctrl_WB == WB_WRITE_REG_FROM::WB_MEM and
                (exmem_old.rd == idex_old.rs1 or
                 exmem_old.rd == idex_old.rs2)) {
                // this should not appear, shoul be bubbled in ID()
                this->error(
                    "EX ERROR: EX hazards error which should not "
                    "appear!\n");
            }
            if (exmem_old.rd == idex_old.rs1)
                r1 = exmem_old.alu_out;
            if (exmem_old.rd == idex_old.rs2)
                r2 = exmem_old.alu_out;
        }
    }

    // calculate: address
    //            alu_out
    //            PC ,if change PC, do something about ctrl hazards
    //
    exmem_new.address = 0;
    exmem_new.alu_out = 0;

    switch ((OPCODE)idex_old.opcode) {
        case R:
            exmem_new.alu_out = ALU_R(r1, r2, idex_old.funct3, idex_old.funct7);
            break;
        case I_ADDW:
            exmem_new.alu_out =
                ALU_I_ADDW(r1, r2, idex_old.funct3, idex_old.funct7);
            break;
        case I_03:
            exmem_new.address = r1 + imm;
            break;
        case I_13:
            exmem_new.alu_out =
                ALU_I_ADDI(r1, imm, idex_old.funct3, idex_old.funct7);
            break;
        case I_ADDIW:
            // addiw
            exmem_new.alu_out =
                ALU_I_ADDIW(r1, r2, idex_old.funct3, idex_old.funct7);
            break;
        case I_JALR: {
            uint64_t new_pc = (r1 + imm) & (~1);
            exmem_new.alu_out = idex_old.pc + 4;
            EX_compare_pc_decide_clear_pipeline(new_pc);
            break;
        }
        case I_ECALL:
            exmem_new.alu_out = EX_ecall(r1, r2);
            break;
        case S:
            exmem_new.address = r1 + imm;
            exmem_new.alu_out = r2;
            break;
        case SB: {
            uint64_t new_pc = idex_old.pc + imm;
            bool judge = EX_SB_judge(r1, r2, idex_old.funct3);
            if (!judge)
                new_pc = idex_old.pc + 4;
            EX_compare_pc_decide_clear_pipeline(new_pc);
            break;
        }
        case U_17:
            exmem_new.alu_out = idex_old.pc + imm;
            break;
        case U_37:
            exmem_new.alu_out = imm;
            break;
        case UJ: {
            exmem_new.alu_out = idex_old.pc + 4;
            uint64_t new_pc = idex_old.pc + imm;
            EX_compare_pc_decide_clear_pipeline(new_pc);
            break;
        }
        default:
            error("EX ERROR OPCODE %x NOT FOUND\n", idex_old.opcode);
            break;
    }
    if (print_log) {
        cout << "-------EX-------" << endl;
        cout << "PC: 0x" << idex_old.pc << endl;
        cout << "addr: " << exmem_new.address << endl;
        cout << "alu_out: " << exmem_new.alu_out << endl;
    }
}

void CPU::MEM() {
    memwb_new.pc = exmem_old.pc;

    if (exmem_old.bubble) {
        memwb_new.bubble = true;
        if (print_log) {
            cout << hex;
            cout << "-------MEM-------" << endl;
            cout << "PC: 0x" << exmem_old.pc << endl << "bubble" << endl;
        }
        return;
    }
    memwb_new.bubble = false;

    memwb_new.alu_out = exmem_old.alu_out;
    memwb_new.rd = exmem_old.rd;
    memwb_new.Ctrl_WB = exmem_old.Ctrl_WB;

    uint64_t mem_out = 0;
    uint64_t addr = exmem_old.address;

    // uint8_t read=exmem_old.Ctrl_M_MemRead;
    // uint8_t write=exmem_old.Ctrl_M_MemWrite;

    // memory read
    if (exmem_old.Ctrl_M_MemRead != 0) {
        switch (exmem_old.Ctrl_M_MemRead - 1) {
            case 0b000:
                mem_out = (int8_t)MMU->load_byte(addr);
                break;
            case 0b100:
                mem_out = MMU->load_byte(addr);
                break;
            case 0b001:
                mem_out = (int16_t)MMU->load_2byte(addr);
                break;
            case 0b101:
                mem_out = MMU->load_2byte(addr);
                break;
            case 0b010:
                mem_out = (int32_t)MMU->load_4byte(addr);
                break;
            case 0b110:
                mem_out = MMU->load_4byte(addr);
                break;
            case 0b011:
                mem_out = MMU->load_8byte(addr);
                break;
            default:
                error("MEM ERROR READ(0x03), F3: %x NOT FOUND\n",
                      exmem_old.Ctrl_M_MemRead - 1);
                break;
        }
    }

    memwb_new.mem_out = mem_out;

    // memory write
    uint64_t val = exmem_old.alu_out;
    switch (exmem_old.Ctrl_M_MemWrite - 1) {
        case -1:
            /* code */
            break;
        case 0:
            MMU->store_byte(addr, val);
            break;
        case 1:
            MMU->store_2byte(addr, val);
            break;
        case 2:
            MMU->store_4byte(addr, val);
            break;
        case 3:
            MMU->store_8byte(addr, val);
            break;
        default:
            error("MEM ERROR WRITE(0x23), F3: %x NOT FOUND\n",
                  exmem_old.Ctrl_M_MemWrite - 1);
            break;
    }
    if (print_log) {
        cout << "-------MEM-------" << endl;
        cout << "PC: 0x" << exmem_old.pc << endl;
        cout << "memwrite: " << (int)exmem_old.Ctrl_M_MemWrite
             << " memread: " << (int)exmem_old.Ctrl_M_MemRead << endl
             << "address: " << exmem_old.address << endl;
    }
}

void CPU::WB() {
    if (memwb_old.bubble or memwb_old.rd == ZERO or
        memwb_old.Ctrl_WB == NOT_WRITE) {
        if (print_log) {
            cout << hex;
            cout << "-------WB-------" << endl;
            cout << "PC: 0x" << memwb_old.pc << endl << "bubble" << endl;
        }
        return;
    }
    uint64_t val = 0;
    switch (memwb_old.Ctrl_WB) {
        case WB_WRITE_REG_FROM::WB_MEM:
            val = memwb_old.mem_out;
            break;
        case WB_WRITE_REG_FROM::WB_ALU:
            val = memwb_old.alu_out;
            break;
        default:
            break;
    }
    this->reg[memwb_old.rd] = val;
    if (print_log) {
        cout << "-------WB-------" << endl;
        cout << "PC: 0x" << memwb_old.pc << endl;
        cout << "write to REG " << REG_NAME_CHAR[memwb_old.rd] << endl;
        cout << "val " << val << endl;
    }
    return;
}

void CPU::EX_compare_pc_decide_clear_pipeline(uint64_t new_pc) {
    if (single_step) {
        if (print_log)
            cout << "from pc 0x" << this->PC << " to 0x" << new_pc << endl;
        this->PC = new_pc;
        return;
    }
    uint64_t curr_pc = this->idex_new.pc;
    if (new_pc == curr_pc)
        return;
    else {
        this->PC = new_pc;
        idex_new.bubble = true;
        ifid_new.bubble = true;
    }
}

void CPU::cpu_exit() {
    this->exit_flag = true;
}