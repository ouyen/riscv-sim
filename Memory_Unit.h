#ifndef _BASIC_MEMORY_UNIT_H
#define _BASIC_MEMORY_UNIT_H

#include <iostream>
#include <tuple>
#include <vector>
using namespace std;

typedef tuple<uint16_t, uint16_t, uint16_t> INDEX;

typedef struct StorageLatency {
    int hit_latency = 0; 
    int bus_latency = 0;  
} StorageLatency;



class Basic_Memory_Unit {
   private:
    /* data */
   public:
//    Basic_Memory_Unit(){}
//    ~Basic_Memory_Unit(){}
    virtual void store_byte(uint32_t addr, uint8_t val, uint8_t& latency)=0;
    virtual uint8_t load_byte(uint32_t addr, uint8_t& latency)=0;
};

class DRAM : public Basic_Memory_Unit {
   private:
    uint8_t** memory[1024];
    StorageLatency latency;

   public:
    DRAM(StorageLatency _latency);
    ~DRAM();

    void store_byte(uint32_t addr, uint8_t val, uint8_t& latency);
    uint8_t load_byte(uint32_t addr, uint8_t& latency);

    INDEX split_index(uint32_t origin_index);
    bool is_address_exit(INDEX addr);
    void add_page(INDEX addr);
};

typedef struct CacheConfig {
    int size=15;//2**15=32K;
    int associativity=3;//2**3=8
    int blcok_size=6;//2**6=64    
    int write_through;   // 0|1 for back|through
    int write_allocate;  // 0|1 for no-alc|alc
} CacheConfig;

typedef struct Cache_Line {
    bool null = true;
    uint32_t label = 0;
    uint8_t data[1024] = {0};
} Cache_Line;

class Cache : public Basic_Memory_Unit {
   private:
    Cache_Line** p_data = nullptr;
    StorageLatency latency;
    CacheConfig config;
    Basic_Memory_Unit* lower_memory = nullptr;

   public:
    Cache(StorageLatency _latency,
          CacheConfig _cachefig,
          Basic_Memory_Unit* _lower);
    ~Cache();

    uint8_t max_associativity = 0;  // 2**asso-1
    uint64_t hit_count = 0;
    uint64_t miss_count = 0;
    uint32_t max_addr = 0;
    uint32_t max_data=0;

    uint32_t get_cache_addr(const uint32_t& origin_addr);
    uint32_t get_cache_label(const uint32_t& origin_addr);
    uint32_t get_data_addr(const uint32_t& origin_addr);

    void store_byte(uint32_t addr, uint8_t val, uint8_t& latency);
    uint8_t load_byte(uint32_t addr, uint8_t& latency);

    int ReplaceDecision();
    uint8_t ReplaceAlgorithm();

    int8_t add_cache_page(const uint32_t& cache_addr,
                           uint32_t label);  // return label_address

    int cache_hit(
        const uint32_t& cache_addr,
        const uint32_t& label_addr);  // return label_address, -1 means none

    int cache_hit(const uint32_t& origin_addr);

    void write_back(const uint32_t& cache_addr, const uint8_t& label_addr);

    uint32_t get_origin_addr(const uint32_t& cache_addr, const uint32_t& label);
};

#endif