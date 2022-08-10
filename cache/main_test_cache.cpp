#include "MMU.h"
#include "Memory_Unit.h"

#include <iostream>

using namespace std;

int main() {
    // DRAM dram_mem;
    StorageLatency ml;
    ml.bus_latency = 6;
    ml.hit_latency = 100;
    //   m.SetLatency(ml);

    StorageLatency ll;
    ll.bus_latency = 3;
    ll.hit_latency = 10;
    // MemoryMangerUnit MMU;
    DRAM dram_mem(ml);

    CacheConfig cfg;
    cfg.size=(5+10);//32KB
    cfg.associativity=3;//2**3=8
    // cfg.set_num
    cfg.write_through=0;
    cfg.write_allocate=1;

    Cache L1(ll,cfg,&dram_mem);
    MemoryMangerUnit MMU(&L1,&dram_mem);
    
// r	8740864 
// w	9527296 
    // MMU.store_4byte(0x1234,0x12345678);
    MMU.store_8byte(0x12345,0x1ffe3456);
    auto x=MMU.load_8byte(0x12345);
    auto y=MMU.load_8byte(0x21345);
    cout<<hex<<uint64_t(x)<<' '<<y<<endl;
    cout<<"test"<<endl;
    cout<<dec<<MMU.total_latency_count<<endl;
    cout<<L1.hit_count<<' '<<L1.miss_count<<endl;

//     typedef struct CacheConfig {
//     int size;
//     int associativity;
//     int set_num;         // Number of cache sets
//     int write_through;   // 0|1 for back|through
//     int write_allocate;  // 0|1 for no-alc|alc
// } CacheConfig;
}