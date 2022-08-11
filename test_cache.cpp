#include <string>
#include <vector>
#include "MMU.h"
#include "Memory_Unit.h"

using namespace std;

StorageLatency dram_latency;
StorageLatency L1_latency;

CacheConfig L1_config;

string file_path = "trace/01-mcf-gem5-xcg.trace";

typedef struct Operate {
    char type;
    uint32_t addr;
} Operate;

vector<Operate> operate_list;

// freopen("input/25", "r", stdin);
// freopen("outtest/25", "w", stdout);
// freopen("data.in", "r", stdin);
// freopen("data.test", "w", stdout);?

void load_operate_list() {
    freopen(file_path.c_str(), "r", stdin);
    char w_or_r = 0;
    uint32_t address;
    Operate operate;
    while (1) {
        scanf("%c 0x%x\t", &w_or_r, &address);
        if (w_or_r == 'q') {
            break;
        } else {
            operate.type = w_or_r;
            operate.addr = address;
            operate_list.push_back(operate);
        }
    }
    fclose(stdin);
}

double test() {
    cout << "Cache size: " << (1 << (L1_config.size)) << "B" << endl;
    cout << "Cache associativity: " << (1 << (L1_config.associativity)) << endl;
    cout << "Cache block size: " << (1 << (L1_config.blcok_size)) << "B"
         << endl;
    DRAM dram_mem(dram_latency);
    Cache L1(L1_latency, L1_config, &dram_mem);
    MemoryMangerUnit MMU(&L1, &dram_mem);

    char w_or_r = 0;
    uint32_t address;
    uint32_t result;

    for (int _i = 0; _i < operate_list.size(); _i++) {
        if (operate_list[_i].type == 'w') {
            MMU.store_byte(operate_list[_i].addr, 1, 1, 1);
        } else if (operate_list[_i].type == 'r') {
            result = MMU.load_byte(operate_list[_i].addr, 1, 1);
        } else {
            break;
        }
    }

    double miss_rate = (double)L1.miss_count / (L1.miss_count + L1.hit_count);

    cout << "L1 miss count: " << L1.miss_count << endl;
    cout << "L1 hit count: " << L1.hit_count << endl;
    cout << "L1 miss rate: " << miss_rate << endl<<endl;

    return miss_rate;
}

void test_1() {
    double res[11][11]={0};
    for (int i = 15; i <= 25; ++i) {
        L1_config.size = i;
        L1_config.associativity = 3;
        for (int j = 0; j <= 10; ++j) {
            L1_config.blcok_size = j;
            // test();
            res[i][j] = test();
        }
    }

    freopen("cache_test_result/test_1.csv", "w", stdout);
    
    printf("Size,Block Size,Miss Rate\n");
    for(int i=15;i<=25;++i){
        for(int j=0;j<=10;++j){
            printf("%d,%d,%f\n",i,j,res[i][j]);
        }
    }
    fclose(stdout);
}

int main() {
    load_operate_list();
    L1_config.write_through = 0;
    L1_config.write_allocate = 0;
    L1_config.size = 15;
    L1_config.associativity = 3;
    L1_config.blcok_size = 6;

    dram_latency.bus_latency = 6;
    dram_latency.hit_latency = 100;

    L1_latency.bus_latency = 3;
    L1_latency.hit_latency = 10;
    // test();
    test_1();
    return 0;
}