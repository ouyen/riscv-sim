#include "Memory_Unit.h"
#include <string.h>
#include <cstdio>
#include <iostream>
#include <tuple>

using namespace std;

INDEX DRAM::split_index(uint32_t origin_index) {
    uint16_t _i=0,_j=0,_k=0;
    _i = (origin_index >> 22) & 0x3ff;
    _j = (origin_index >> 12) & 0x3ff;
    _k = origin_index & 0xfff;
    // return {(origin_index >> 22) & 0x3ff, (origin_index >> 12) & 0x3ff,
    //         origin_index & 0xfff};
    return {_i,_j,_k};
}
DRAM::DRAM(StorageLatency _leng) {
    this->latency=_leng;
    for (uint16_t i = 0; i < 1024; ++i) {
        memory[i] = nullptr;
    }
}
DRAM::~DRAM() {
    for (uint16_t i = 0; i < 1024; ++i) {
        if (memory[i]) {
            for (uint16_t j = 0; j < 1024; ++j) {
                if (memory[i][j]) {
                    delete[] memory[i][j];
                    memory[i][j] = nullptr;
                }
            }
            delete memory[i];
            memory[i] = nullptr;
        }
    }
}


bool DRAM::is_address_exit(INDEX I) {
    // auto I = split_index(addr);
    return (memory[get<0>(I)] and memory[get<0>(I)][get<1>(I)]);
}

void DRAM::add_page(INDEX I) {
    // INDEX I = split_index(addr);
    if (memory[get<0>(I)] == nullptr) {
        memory[get<0>(I)] = new uint8_t*[1024];
        memset(memory[get<0>(I)], 0, sizeof(uint8_t*) * 1024);
    }
    if (memory[get<0>(I)][get<1>(I)] == nullptr) {
        memory[get<0>(I)][get<1>(I)] = new uint8_t[4096];
        memset(memory[get<0>(I)][get<1>(I)], 0, sizeof(uint8_t) * 4096);
    }
}



void DRAM::store_byte(uint32_t addr, uint8_t val, uint8_t& add_latency) {
    add_latency+=(this->latency.hit_latency+this->latency.bus_latency);
    INDEX I = split_index(addr);
    add_page(I);
    memory[get<0>(I)][get<1>(I)][get<2>(I)] = val;
}

uint8_t DRAM::load_byte(uint32_t addr, uint8_t& add_latency) {
    add_latency+=(this->latency.hit_latency+this->latency.bus_latency);
    INDEX I = split_index(addr);
    if (is_address_exit(I)) {
        return memory[get<0>(I)][get<1>(I)][get<2>(I)];
    } else {
        return 0;
    }
}
