#include "CPU.h"
#include "MMU.h"

#include <unistd.h>
#include <elfio/elfio.hpp>
#include <iostream>
#include <string>

using namespace std;

string elf_file = "hi.riscv";
void loadElfToMemory(ELFIO::elfio* reader, MemoryMangerUnit* mmu);
bool check_file_exists(string file_path);

int main(int argc, char* argv[]) {
    bool single = false;
    bool print_log = false;
    bool Step_run = false;
    string divid_line =
        "\n-----------------------------------------------------------\n";

#ifndef DEBUG
    // cin parameter
    if (argc == 2)
        elf_file = argv[1];
    if (argc > 2) {
        string tmp_a = "";
        for (int i = 1; i < argc; ++i) {
            tmp_a = argv[i];
            if (tmp_a == "-s")
                single = true;
            else if (tmp_a == "-S")
                Step_run = true;
            else if (tmp_a == "-p")
                print_log = true;
            else {
                elf_file = tmp_a;
            }
        }
    }
    while (!check_file_exists(elf_file)) {
        cout << "[INFO] file " << elf_file << " not exists" << endl;
        cout << "[INFO] input riscv elf file path: " << endl;
        cin >> elf_file;
    }
    cout << "[INFO] file " << elf_file << " exists, start simulate" << endl
         << divid_line << endl;
#else
    print_log = true;
    step = true;
    elf_file = "riscv-test/elf/helloword.riscv";
#endif
#ifdef SINGLE
    step = true;
#endif

    // prepare hardware
    StorageLatency ml;
    ml.bus_latency = 0;
    ml.hit_latency = 100 - 1;
    //   m.SetLatency(ml);

    StorageLatency ll, l2, l3;
    ll.bus_latency = 0;
    ll.hit_latency = 0;

    l2.hit_latency = 7;
    l2.bus_latency = 0;

    l3.bus_latency = 0;
    l3.hit_latency = 19;
    // MemoryMangerUnit MMU;
    DRAM dram_mem(ml);

    CacheConfig cfg, cfg2, cfg3;
    cfg.size = (5 + 10);    // 32KB
    cfg.associativity = 3;  // 2**3=8
    cfg.blcok_size = 6;     // 2**6=64
    cfg.write_through = 0;
    cfg.write_allocate = 1;

    cfg2.associativity = 3;
    cfg2.blcok_size = 6;
    cfg2.size = 18;  // 2**8=256
    cfg2.write_through = 0;
    cfg2.write_allocate = 1;

    cfg3.associativity = 3;
    cfg3.blcok_size = 6;
    cfg3.size = 23;  // 2**3=8
    cfg3.write_through = 0;
    cfg3.write_allocate = 1;

    Cache L3(l3, cfg3, &dram_mem);
    Cache L2(l2, cfg2, &L3);
    Cache L1(ll, cfg, &L2);
    MemoryMangerUnit mmu(&L1, &dram_mem);

    // load elf
    ELFIO::elfio reader;
    reader.load(elf_file);
    auto pc = reader.get_entry();
    uint32_t sp = 0x80000000;
    mmu.load_byte(pc, 1, 0);
    mmu.load_byte(sp, 1, 0);
    CPU cpu(&mmu, pc, sp);
    cpu.single_cycle = single;
    cpu.print_log = print_log;
    cpu.step_run=Step_run;
    // std::cout<<std::hex<<reader.get_entry()<<std::endl;
    loadElfToMemory(&reader, &mmu);
    cpu.run();
    cout << divid_line << endl << "[INFO] program exit ." << endl;
    cout << dec << "Inst count " << cpu.inst_count << endl;
    cout << "Cycle count " << cpu.cycle_count << endl;
    cout << "CPI: " << (double)cpu.cycle_count / cpu.inst_count << endl;
    cout << "Hazards by data: " << cpu.hazards_by_data_count << endl;
    cout << "Hazards by ctrl: " << cpu.hazards_by_ctrl_count << endl;
    cout << "Cycles (" << cpu.cycle_count << ") = 2+ Insts (" << cpu.inst_count
         << ") + 2*Ctrl_hazard (" << cpu.hazards_by_ctrl_count
         << ") + Data_hazards (" << cpu.hazards_by_data_count << ")" << endl;
    cout << "Predict " << cpu.predict_count << " times, failed "
         << cpu.hazards_by_ctrl_count << " times, success "
         << cpu.predict_count - cpu.hazards_by_ctrl_count << " times" << endl;
    cout << mmu.total_latency_count << " " << L1.miss_count << ' '
         << L1.hit_count << endl;
    cout << L2.miss_count << ' ' << L2.hit_count << endl;
    cout << L3.miss_count << ' ' << L3.hit_count << endl;
    return 0;
}

bool check_file_exists(string file_path) {
    return (access(file_path.c_str(), F_OK) != -1);
}

void loadElfToMemory(ELFIO::elfio* reader, MemoryMangerUnit* mmu) {
    ELFIO::Elf_Half seg_num = reader->segments.size();
    for (int i = 0; i < seg_num; ++i) {
        const ELFIO::segment* pseg = reader->segments[i];

        uint64_t fullmemsz = pseg->get_memory_size();
        uint64_t fulladdr = pseg->get_virtual_address();
        // Our 32bit simulator cannot handle this
        if (fulladdr + fullmemsz > 0xFFFFFFFF) {
            printf(
                "ELF address space larger than 32bit! Seg %d has max addr of "
                "0x%lx\n",
                i, fulladdr + fullmemsz);
            exit(-1);
        }
        uint32_t filesz = pseg->get_file_size();
        uint32_t memsz = pseg->get_memory_size();
        uint32_t addr = (uint32_t)pseg->get_virtual_address();
        for (uint32_t p = addr; p < addr + memsz; ++p) {
            if (p < addr + filesz) {
                mmu->store_byte(p, pseg->get_data()[p - addr], true, false);
            } else {
                mmu->store_byte(p, 0, true, false);
            }
        }
    }
}
