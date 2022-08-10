#include "MMU.h"
#include <iostream>

using namespace std;

void MemoryMangerUnit::store_byte(uint32_t addr, uint8_t val, bool use_cache,bool count_latency) {
    uint8_t add_latency=0;
    top_and_bottom[use_cache]->store_byte(addr,val,add_latency);
    if(count_latency){
        total_latency_count+=add_latency;
    }
    return;
};
uint8_t MemoryMangerUnit::load_byte(uint32_t addr, bool use_cache,bool count_latency) {
    uint8_t add_latency=0;
    auto result=top_and_bottom[use_cache]->load_byte(addr,add_latency);
    if(count_latency){
        total_latency_count+=add_latency;
    }
    return result;
};

void MemoryMangerUnit::store_2byte(uint32_t addr,
                                   uint16_t val,
                                   bool use_cache,bool count_latency) {
    store_byte(addr, (uint8_t)val & 0xff, use_cache,count_latency);
    store_byte(addr + 1, (uint8_t)(val >> 8) & 0xff, use_cache,false);
};

uint16_t MemoryMangerUnit::load_2byte(uint32_t addr, bool use_cache,bool count_latency) {
    uint8_t v1 = load_byte(addr, use_cache,count_latency);
    uint8_t v2 = load_byte(addr + 1, use_cache,false);
    return v1 | (v2 << 8);
};

void MemoryMangerUnit::store_4byte(uint32_t addr,
                                   uint32_t val,
                                   bool use_cache,bool count_latency) {
    store_2byte(addr, (uint16_t)val & 0xffff, use_cache,count_latency);
    store_2byte(addr + 2, (uint16_t)(val >> 16) & 0xffff, use_cache,false);
};

uint32_t MemoryMangerUnit::load_4byte(uint32_t addr, bool use_cache,bool count_latency) {
    uint16_t v1 = load_2byte(addr, use_cache,count_latency);
    uint16_t v2 = load_2byte(addr + 2, use_cache,false);
    return v1 | (v2 << 16);
};

void MemoryMangerUnit::store_8byte(uint32_t addr,
                                   uint64_t val,
                                   bool use_cache,bool count_latency) {
    store_4byte(addr, val & 0xffffffff, use_cache,count_latency);
    store_4byte(addr+4, ((val >> 30)>>2) & 0xffffffff, use_cache,false);
};
uint64_t MemoryMangerUnit::load_8byte(uint32_t addr, bool use_cache,bool count_latency) {
    uint32_t v1 = load_4byte(addr, use_cache,count_latency);
    uint64_t v2 = load_4byte(addr + 4, use_cache,false);
    return v1 | ((v2 << 30) << 2);
};

MemoryMangerUnit::MemoryMangerUnit(Basic_Memory_Unit* _top,Basic_Memory_Unit* _bottom){
    top_memory=_top;
    bottom_memory=_bottom;
    top_and_bottom[1]=_top;
    top_and_bottom[0]=_bottom;
}

MemoryMangerUnit::~MemoryMangerUnit(){}