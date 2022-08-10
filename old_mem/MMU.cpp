#include "MMU.h"
#include <iostream>
#include "DRAM.h"

using namespace std;

void MemoryMangerUnit::store_byte(uint32_t addr, uint8_t val, bool use_cache) {
    if (use_cache == false or 1) {
        dram_memory.store_byte(addr, val);
    }
};
uint8_t MemoryMangerUnit::load_byte(uint32_t addr, bool use_cache) {
    if (use_cache == false or 1) {
        return dram_memory.load_byte(addr);
    }
};

void MemoryMangerUnit::store_2byte(uint32_t addr,
                                   uint16_t val,
                                   bool use_cache) {
    store_byte(addr, (uint8_t)val & 0xff, use_cache);
    store_byte(addr + 1, (uint8_t)(val >> 8) & 0xff, use_cache);
};

uint16_t MemoryMangerUnit::load_2byte(uint32_t addr, bool use_cache) {
    uint8_t v1 = load_byte(addr, use_cache);
    uint8_t v2 = load_byte(addr + 1, use_cache);
    return v1 | (v2 << 8);
};

void MemoryMangerUnit::store_4byte(uint32_t addr,
                                   uint32_t val,
                                   bool use_cache) {
    store_2byte(addr, (uint16_t)val & 0xffff, use_cache);
    store_2byte(addr + 2, (uint16_t)(val >> 16) & 0xffff, use_cache);
};

uint32_t MemoryMangerUnit::load_4byte(uint32_t addr, bool use_cache) {
    uint16_t v1 = load_2byte(addr, use_cache);
    uint16_t v2 = load_2byte(addr + 2, use_cache);
    return v1 | (v2 << 16);
};

void MemoryMangerUnit::store_8byte(uint32_t addr,
                                   uint64_t val,
                                   bool use_cache) {
    store_4byte(addr, val & 0xffffffff, use_cache);
    store_4byte(addr+4, ((val >> 30)>>2) & 0xffffffff, use_cache);
};
uint64_t MemoryMangerUnit::load_8byte(uint32_t addr, bool use_cache) {
    uint32_t v1 = load_4byte(addr, use_cache);
    uint64_t v2 = load_4byte(addr + 4, use_cache);
    return v1 | ((v2 << 30) << 2);
};

MemoryMangerUnit::MemoryMangerUnit(){}

MemoryMangerUnit::~MemoryMangerUnit(){}