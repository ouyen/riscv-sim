#ifndef _MMU_H
#define _MMU_H

#include <iostream>
#include "DRAM.h"

using namespace std;

typedef uint8_t MemoryFrom;

// MemoryFrom Dram=0;
// MemoryFrom L1=1;
// MemoryFrom L2=2;

class MemoryMangerUnit {
   public:
    MemoryMangerUnit();
    ~MemoryMangerUnit();
    void store_byte(uint32_t addr, uint8_t val, bool use_cache = true);
    uint8_t load_byte(uint32_t addr, bool use_cache = true);

    void store_2byte(uint32_t addr, uint16_t val, bool use_cache = true);
    uint16_t load_2byte(uint32_t addr, bool use_cache = true);

    void store_4byte(uint32_t addr, uint32_t val, bool use_cache = true);
    uint32_t load_4byte(uint32_t addr, bool use_cache = true);

    void stroe_8byte(uint32_t addr, uint64_t val, bool use_cache = true);
    uint64_t load_8byte(uint32_t addr, bool use_cache = true);

    DRAM dram_memory;
};
#endif