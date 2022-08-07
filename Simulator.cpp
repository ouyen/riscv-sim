#ifndef _SIM_CPP
#define _SIM_CPP
#include "CPU.h"
#include "MMU.h"

#include <iostream>
#include <elfio/elfio.hpp>

using namespace std;

string elf_file= "hi.riscv";
void loadElfToMemory(ELFIO::elfio *reader,MemoryMangerUnit *mmu);

int main(){
    // prepare hardware
    MemoryMangerUnit mmu;
    //load elf
    ELFIO::elfio reader;
    reader.load(elf_file);
    auto pc=reader.get_entry();
    uint32_t sp=0x80000000;
    CPU cpu(&mmu,pc,sp);
    // std::cout<<std::hex<<reader.get_entry()<<std::endl;
    loadElfToMemory(&reader,&mmu);
    cpu.run();
    return 0;
}


void loadElfToMemory(ELFIO::elfio *reader,MemoryMangerUnit *mmu){
  ELFIO::Elf_Half seg_num = reader->segments.size();
  for (int i = 0; i < seg_num; ++i) {
    const ELFIO::segment *pseg = reader->segments[i];

    uint64_t fullmemsz = pseg->get_memory_size();
    uint64_t fulladdr = pseg->get_virtual_address();
    // Our 32bit simulator cannot handle this
    if (fulladdr + fullmemsz > 0xFFFFFFFF) {
      printf(
          "ELF address space larger than 32bit! Seg %d has max addr of 0x%lx\n",
          i, fulladdr + fullmemsz);
      exit(-1);
    }
    uint32_t filesz = pseg->get_file_size();
    uint32_t memsz = pseg->get_memory_size();
    uint32_t addr = (uint32_t)pseg->get_virtual_address();
    for (uint32_t p = addr; p < addr + memsz; ++p) {
    //   std::cout<<p<<' '<<std::hex<<pseg->get_data()[p - addr]+(uint)0<<std::endl;
      // if (!memory->isPageExist(p)) {
      //   memory->addPage(p);
      // }

      if (p < addr + filesz) {
        mmu->store_byte(p,pseg->get_data()[p - addr],false);
      } else {
        mmu->store_byte(0,false);
        // memory->setByteNoCache(p, 0);
      }
    }
  }
}

#endif