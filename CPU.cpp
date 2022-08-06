#include "CPU.h"
#include <stdarg.h>
#include <string.h>

void CPU::error(const char* fmt, ...) {
    va_list args;
    va_start(args, fmt);
    vprintf(fmt, args);
    va_end(args);
    exit(-1);
}

CPU::CPU(MemoryMangerUnit* _mmu, uint64_t _pc, uint64_t stack_point) {
    MMU = _mmu;
    PC = _pc;
    reg[REG_NAME::SP] = stack_point;
}

bool CPU::check_lock(REG_NAME r) {
    return (r != ZERO) and (reg_lock[r] != 0);
}

bool CPU::check_lock_ecall() {
    return check_lock(A0) | check_lock(A7);
}

uint64_t CPU::extender(uint32_t imm, uint8_t len, bool signext) {
    // if(len>64){}
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
        // if (exit_flag)
        //     return;
        ++cycle_count;

        IF();
        ID();
        EX();
        MEM();
        WB();

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
    ifid_new.bubble = false;
    ifid_new.pc = PC;
    if (1) {
        PC = PC + 4;
    }
}

void CPU::ID() {
    if (ifid_old.bubble) {
        idex_new.bubble = true;
        return;
    }

    idex_new.pc = ifid_old.pc;

    // idex_new.stop = false;
    uint32_t inst = ifid_old.instruction;
    idex_new.opcode = inst & 0x7f;
    inst >>= 7;
    idex_new.rd = (REG_NAME)((inst & 0x1f));
    inst >>= 5;
    idex_new.funct3 = (inst & 0b111);
    inst >>= 3;
    idex_new.rs1 = (REG_NAME)(inst & 0x1f);
    inst >>= 5;
    idex_new.rs2 = (REG_NAME)(inst & 0x1f);
    inst >>= 5;
    idex_new.funct7 = inst;

    inst = ifid_old.instruction;  // for imm later
    // tmp use
    REG_NAME rs1 = idex_new.rs1;
    REG_NAME rs2 = idex_new.rs2;
    REG_NAME rd = idex_new.rd;
    bool lock = false;
    uint32_t imm = 0;

    switch ((OPCODE)idex_new.opcode) {
        // deal with imm , reg_val , add lock , check lock
        case R:
            // lock = check_lock(rs1) | check_lock(rs2);
            // reg_lock[rd] = ifid_old.pc;
            idex_new.rs1_reg = reg[rs1];
            idex_new.rs2_reg = reg[rs2];
            idex_new.Ctrl_WB=WB_ALU;
            break;
        case I_LB:
        imm = (inst >> 20);
            idex_new.rs1_reg = reg[rs1];
            idex_new.Ctrl_M_MemRead=true;
            idex_new.Ctrl_WB=WB_MEM;
        case I_ADDI:

        case I_ADDIW:
        case I_JALR:
            imm = (inst >> 20);
            idex_new.rs1_reg = reg[rs1];
            // lock = check_lock(rs1);
            // reg_lock[rd] = ifid_old.pc;
            break;
        case I_ECALL:
            lock = check_lock_ecall();
            break;
        case S:
            imm = ((inst >> 7) & 0x1f) | ((inst >> 20) & 0xfe0);
            lock = check_lock(rs1) | check_lock(rs2);
            idex_new.rs1_reg = reg[rs1];
            idex_new.rs2_reg = reg[rs2];
            break;
        case SB:
            lock = check_lock(rs1) | check_lock(rs2);
            idex_new.rs1_reg = reg[rs1];
            idex_new.rs2_reg = reg[rs2];
            imm = ((inst >> 7) & 0x1e) | ((inst >> 20) & 0x7e0) |
                  (((inst >> 7) & 0x1) << 11) | ((inst >> 31) << 12);
            break;
        case U_AUIPC:
        case U_LUI:
            reg_lock[rd] = ifid_old.pc;
            imm = (inst & 0xfffff000);
            break;
        case UJ:
            reg_lock[rd] = ifid_old.pc;
            imm = ((inst >> 31) << 20) | (((inst >> 21) & 0x100) << 1) |
                  ((inst >> 20) & 0x1) << 11 | (inst >> 12 & 0xff) << 12;
            break;
        default:
            error("ID ERROR: opcode %x not found\n", idex_new.opcode);
            break;
    }
    idex_new.bubble = lock;
    reg_lock[0] = 0;
    idex_new.imm = imm;
    if(idex_old.Ctrl_WB==WB_WRITE_REG_FROM::WB_MEM and idex_old.rd!=ZERO and (idex_old.rd==idex_new.rs1 or idex_old.rd==idex_new.rs2)){
        // TODO: pipline stall
    }
    return;
}

void CPU::EX() {
    if (idex_old.bubble) {
        exmem_new.bubble = true;
        return;
    }
    exmem_new.bubble = false;
    exmem_new.pc = idex_old.pc;
    exmem_new.rd=idex_old.rd;

    uint64_t r1 = idex_old.rs1_reg;
    uint64_t r2 = idex_old.rs2_reg;
    // TODO: data hazards flag
    // 数据前递 data forward



    switch ((OPCODE)idex_old.opcode) {
        case R:
            exmem_new.alu_out=ALU_R(r1,r2,idex_old.funct3<<8|idex_old.funct7);
            break;
        case I_03:

            break;
        default:
            break;
    }
}

void CPU::MEM() {}

void CPU::WB() {}