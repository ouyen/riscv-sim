#include "CPU.h"
#include "MMU.h"

#include <elfio/elfio.hpp>
#include <iostream>

using namespace std;

// int tmp_pc=0;

// string elf_file = "add.riscv";
string elf_file="hi.riscv";
void loadElfToMemory(ELFIO::elfio* reader, MemoryMangerUnit* mmu);

int main() {
    // prepare hardware
    MemoryMangerUnit mmu;
    // load elf
    ELFIO::elfio reader;
    reader.load(elf_file);
    auto pc = reader.get_entry();
    // tmp_pc=pc;
    uint32_t sp = 0x80000000;
    CPU cpu(&mmu, pc, sp);
    // std::cout<<std::hex<<reader.get_entry()<<std::endl;
    loadElfToMemory(&reader, &mmu);
    cpu.run();
    return 0;
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
            //   std::cout<<p<<' '<<std::hex<<pseg->get_data()[p -
            //   addr]+(uint)0<<std::endl;
            // if (!memory->isPageExist(p)) {
            //   memory->addPage(p);
            // }
            // if(p==tmp_pc){
            //     cout<<"!!!"<<endl;
            // }
            if (p < addr + filesz) {
                mmu->store_byte(p, pseg->get_data()[p - addr], false);
            } else {
                mmu->store_byte(p, 0, false);
                // memory->setByteNoCache(p, 0);
            }
        }
    }
}



// int main(){
//     MemoryMangerUnit mmu;
//     // mmu.store_8byte(65840,0x1234567887654321);
//     // cout<<mmu.load_8byte(65840)<<endl;
//     uint32_t addr=65840;
//     mmu.store_8byte(100,0x1234567887654321);
//     int x1=mmu.load_byte(100);
//     int x2=mmu.load_byte(101);
//     auto x=mmu.load_8byte(100);
//     // cout<<x<<endl;
//     printf("%llx\n",x);
// }

// int main() {
//     // prepare hardware
//     MemoryMangerUnit mmu;
//     // load elf
//     // ELFIO::elfio reader;
//     // reader.load(elf_file);
//     auto pc = 0;
//     // tmp_pc=pc;
//     uint32_t sp = 0x80000000;
//     CPU cpu(&mmu, pc, sp);
//     // std::cout<<std::hex<<reader.get_entry()<<std::endl;
//     // loadElfToMemory(&reader, &mmu);
//     mmu.store_4byte(0,0x00500513);
    
//     mmu.store_4byte(4,0x00200893);
//     mmu.store_4byte(8,0x00000073);
//     cpu.run();
//     return 0;
// }
