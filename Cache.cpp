#include <random>
#include "Memory_Unit.h"

Cache::Cache(StorageLatency _latency,
             CacheConfig _cacheconfig,
             Basic_Memory_Unit* _lower) {
    latency = _latency;
    this->config = _cacheconfig;
    if(config.blcok_size>10) config.blcok_size=10;
    this->lower_memory = _lower;
    max_addr = (1 << (config.size - config.associativity - config.blcok_size)) - 1;
    max_associativity = (1 << config.associativity) - 1;
    hit_count = 0;
    miss_count = 0;
    max_data=(1<<config.blcok_size)-1;
    p_data = new Cache_Line*[max_addr + 1]();
}

Cache::~Cache() {
    uint32_t i = 0, j = 0, k = 0;
    if (p_data == nullptr)
        return;
    for (i = 0; i <= max_addr; ++i) {
        if (p_data[i]!=nullptr) {
            delete[] p_data[i];
            p_data[i] = nullptr;
        }
    }
    delete[] p_data;
    p_data = nullptr;
}

uint32_t Cache::get_cache_addr(const uint32_t& o_addr) {
    return (o_addr >> config.blcok_size) & max_addr;
}

uint32_t Cache::get_cache_label(const uint32_t& origin_addr) {
    return origin_addr >> (config.size - config.associativity);
    // =o_addr>>(6+cache_addr_len)
}

uint32_t Cache::get_data_addr(const uint32_t& origin_addr) {
    return origin_addr & max_data;
}

int8_t Cache::add_cache_page(const uint32_t& cache_addr, uint32_t label) {
    // auto cache_addr=get_cache_addr(origin_addr);
    // auto label=get_cache_label(origin_addr);
    if (!p_data[cache_addr]) {
        p_data[cache_addr] = new Cache_Line[max_associativity + 1];
        p_data[cache_addr][0].label = label;
        return 0;
    } else {
        int8_t n = -1;
        for (uint8_t i = 0; i <= max_associativity; ++i) {
            if (p_data[cache_addr][i].null == true or
                p_data[cache_addr][i].label == label) {
                n = i;
                break;
            }
        }
        if (n == -1)
            n = ReplaceAlgorithm();
        //     delete_line(cache_addr,n);
        // p_data[cache_addr][n].label = label;
        // p_data[cache_addr][n].null = false;
        return n;
    }
}

int Cache::cache_hit(const uint32_t& cache_addr, const uint32_t& label) {
    if (!p_data[cache_addr])
        return -1;
    else {
        for (uint8_t i = 0; i <= max_associativity + 1; ++i) {
            if (p_data[cache_addr][i].label == label and
                p_data[cache_addr][i].null == false)
                return i;
        }
    }
    return -1;
}

int Cache::cache_hit(const uint32_t& origin_addr) {
    auto cache_addr = get_cache_addr(origin_addr);
    auto label = get_cache_label(origin_addr);
    return cache_hit(cache_addr, label);
}

void Cache::store_byte(uint32_t addr, uint8_t val, uint8_t& _latency) {
    auto cache_addr = get_cache_addr(addr);
    auto label = get_cache_label(addr);
    auto label_address = cache_hit(cache_addr, label);
    auto data_addr = get_data_addr(addr);

    // if(p_data[cache_addr][label_address].label!=label and
    // p_data[cache_addr][label_address].null==false){
    //     // p_data[cache_addr][label_address].label=label;
    //     delete_line(cache_addr,label_address,_latency);
    //     p_data[cache_addr][label_address].label=label;
    //     p_data[cache_addr][label_address].null=false;
    // }

    if (label_address != -1) {
        // hit
        ++hit_count;
        p_data[cache_addr][label_address].data[data_addr] = val;
        if (!config.write_through) {
            _latency += (this->latency.hit_latency + this->latency.bus_latency);
            return;
        } else {
            this->lower_memory->store_byte(addr, val, _latency);
            return;
        }
    } else {
        // miss
        ++miss_count;

        // _latency += (this->latency.bus_latency);

        if (config.write_allocate == false) {  // write non allocate
            this->lower_memory->store_byte(addr, val, _latency);
        }

        else {  // write allocate
            label_address = add_cache_page(cache_addr, label);
            if (p_data[cache_addr][label_address].null == false and p_data[cache_addr][label_address].label!=label) {
                // replace
                if (config.write_through == false or
                    config.write_allocate == true) {
                    // _latency+=(this->latency.bus_latency);
                    write_back(cache_addr, label_address);
                }
            }
            {
                p_data[cache_addr][label_address].null = false;
                p_data[cache_addr][label_address].label = label;
                p_data[cache_addr][label_address].data[0] =
                    this->lower_memory->load_byte(addr & (~max_data), _latency);
                uint8_t tmp = 0;
                for (int i = 1; i < max_data+1; ++i) {
                    p_data[cache_addr][label_address].data[i] =
                        this->lower_memory->load_byte(addr & (~max_data) + i, tmp);
                }
                p_data[cache_addr][label_address].data[data_addr] = val;
            }
        }
    }
}

uint8_t Cache::load_byte(uint32_t addr, uint8_t& _latency) {
    auto cache_addr = get_cache_addr(addr);
    auto label = get_cache_label(addr);
    auto label_address = cache_hit(cache_addr, label);
    auto data_addr = get_data_addr(addr);
    if (label_address != -1) {
        ++hit_count;
        _latency += (this->latency.hit_latency + this->latency.bus_latency);
        return p_data[cache_addr][label_address].data[data_addr];
    } else {
        ++miss_count;
        // _latency += (this->latency.bus_latency+this->latency.bus_latency);
        auto val = this->lower_memory->load_byte(addr, _latency);
        uint8_t tmp = 0;
        label_address = add_cache_page(cache_addr, label);
        if(p_data[cache_addr][label_address].null==false)
            write_back(cache_addr, label_address);
        p_data[cache_addr][label_address].null = false;
        p_data[cache_addr][label_address].label = label;
        for (int i = 0; i < max_data+1; ++i) {
            p_data[cache_addr][label_address].data[i] =
                this->lower_memory->load_byte(addr & (~max_data) + i, tmp);
        }
        return val;
    }
}

void Cache::write_back(const uint32_t& cache_addr, const uint8_t& label_addr) {
    if(config.write_through==true and config.write_allocate==false) return;
    if( p_data[cache_addr][label_addr].null==true) return;

    if (config.write_through == false or config.write_allocate == true) {
        uint8_t tmp = 0;
        uint32_t label = p_data[cache_addr][label_addr].label;
        uint32_t lower_addr = (get_origin_addr(cache_addr, label) & (~max_data));
        // this->lower_memory->store_byte(lower_addr,p_data[cache_addr][label_addr].data[0],_latency);
        for (int i = 0; i < max_data+1; ++i) {
            this->lower_memory->store_byte(
                lower_addr + i, p_data[cache_addr][label_addr].data[i], tmp);
        }
        p_data[cache_addr][label_addr].null = true;
    }
}

uint32_t Cache::get_origin_addr(const uint32_t& cache_addr,
                                const uint32_t& label) {
    return (cache_addr << max_addr) | (label << (config.size - config.associativity));
}

uint8_t Cache::ReplaceAlgorithm() {
    default_random_engine e;
    uniform_int_distribution<unsigned> u(0, this->max_associativity);
    return u(e);
}