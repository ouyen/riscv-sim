#ifndef _DRAM_H
#define _DRAM_H
#include <tuple>

using namespace std;

typedef tuple<uint16_t, uint16_t, uint16_t> INDEX;

class DRAM {
   private:
    // 1024*1024*4096
    uint8_t** memory[1024];
    // uint16_t _i=0,_j=0,_k=0;

   public:
    INDEX split_index(uint32_t origin_index);
    DRAM();
    ~DRAM();
    bool is_address_exit(INDEX addr);

    void add_page(INDEX addr);

    void store_byte(uint32_t addr, uint8_t val);

    uint8_t load_byte(uint32_t addr);
};
#endif
