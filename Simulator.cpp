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
    bool step=false;
    bool print_log=false;

    #ifndef DEBUG
    // cin parameter
    if (argc == 2)
        elf_file = argv[1];
    if(argc>2){
        string tmp_a="";
        for(int i=1;i<argc;++i){
            tmp_a=argv[i];
            if(tmp_a=="-s") step=true;
            else{
                if(tmp_a=="-p") print_log=true;
                else{
                    elf_file=tmp_a;
                }
            }
        }
    }
    while (!check_file_exists(elf_file)) {
        cout << "file " << elf_file << " not exists" << endl;
        cout << "input riscv elf file path: " << endl;
        cin >> elf_file;
    }
    cout << "file " << elf_file << " exists, start simulate" << endl;
    #else
    print_log=true;
    elf_file="test.riscv";
    #endif
    #ifdef SINGLE
    step=true;
    #endif

    // prepare hardware
    MemoryMangerUnit mmu;
    // load elf
    ELFIO::elfio reader;
    reader.load(elf_file);
    auto pc = reader.get_entry();
    uint32_t sp = 0x80000000;
    CPU cpu(&mmu, pc, sp);
    cpu.single_step=step;
    cpu.print_log=print_log;
    // std::cout<<std::hex<<reader.get_entry()<<std::endl;
    loadElfToMemory(&reader, &mmu);
    cpu.run();
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
                mmu->store_byte(p, pseg->get_data()[p - addr], false);
            } else {
                mmu->store_byte(p, 0, false);
            }
        }
    }
}
