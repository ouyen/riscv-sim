#include <string>
#include <vector>
#include "MMU.h"
#include "Memory_Unit.h"

using namespace std;

StorageLatency dram_latency;
StorageLatency L1_latency, L2_latency;

CacheConfig L1_config, L2_config;
bool use_L2 = false;

string file_path = "trace/01-mcf-gem5-xcg.trace";

uint64_t _langencty_count = 0;

#define N 100

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
    // if(!use_L2)
    Cache L1(L1_latency, L1_config, &dram_mem);
    Cache L2(L2_latency, L2_config, &dram_mem);
    if (use_L2) {
        L1.lower_memory=&L2;
    }
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
    cout << "L1 miss rate: " << miss_rate << endl;
    if (use_L2) {
        cout << "L2 miss count: " << L2.miss_count << endl;
        cout << "L2 hit count: " << L2.hit_count << endl;
        cout << "L2 miss rate: "
             << (double)L2.miss_count / (L2.miss_count + L2.hit_count) << endl;
    }
    cout << "Latency: " << MMU.total_latency_count << endl << endl;
    _langencty_count = MMU.total_latency_count;
    return miss_rate;
}

void test_1() {
    double res[N][N] = {0};
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
    for (int i = 15; i <= 25; ++i) {
        for (int j = 0; j <= 10; ++j) {
            printf("%d,%d,%f\n", i, j, res[i][j]);
        }
    }
    fclose(stdout);
}

void test_2() {
    double res[N][N] = {0};
    for (int i = 15; i <= 25; ++i) {
        L1_config.size = i;
        L1_config.blcok_size = 6;
        for (int j = 0; j <= 5; ++j) {
            L1_config.associativity = j;
            // test();
            res[i][j] = test();
        }
    }

    freopen("cache_test_result/test_2.csv", "w", stdout);

    printf("Size,Associativity,Miss Rate\n");
    for (int i = 15; i <= 25; ++i) {
        for (int j = 0; j <= 5; ++j) {
            printf("%d,%d,%f\n", i, j, res[i][j]);
        }
    }
    fclose(stdout);
}

void test_3() {
    L1_config.write_through = 0;
    L1_config.write_allocate = 0;
    L1_config.size = 15;
    L1_config.associativity = 3;
    L1_config.blcok_size = 6;

    dram_latency.bus_latency = 6;
    dram_latency.hit_latency = 100;

    L1_latency.bus_latency = 3;
    L1_latency.hit_latency = 10;
    uint64_t res[N][N] = {0};
    for (int i = 15; i <= 25; ++i) {
        L1_config.size = i;
        for (int j = 0; j <= 3; ++j) {
            L1_config.write_through = j & 0b1;
            L1_config.write_allocate = (j & 0b10) >> 1;
            _langencty_count = 0;
            test();
            res[i][j] = _langencty_count;
        }
    }
    freopen("cache_test_result/test_3.csv", "w", stdout);
    printf("Size,Write Through,Write Allocate,Latency\n");
    for (int i = 15; i <= 25; ++i) {
        for (int j = 0; j <= 3; ++j) {
            printf("%d,%d,%d,%d\n", i, j & 0b1, (j & 0b10) >> 1, res[i][j]);
        }
    }
    return;
}

void test_4() {
    CacheConfig L2;
    use_L2 = 1;
    test();
}

int main() {
    load_operate_list();
    L1_config.write_through = 0;
    L1_config.write_allocate = 1;
    L1_config.size = 15;
    L1_config.associativity = 3;
    L1_config.blcok_size = 6;

    L2_config.write_through = 0;
    L2_config.write_allocate = 1;
    L2_config.size = 18;//256K
    L2_config.associativity = 3;
    L2_config.blcok_size = 6;

    dram_latency.bus_latency = 0;
    dram_latency.hit_latency = 100;

    L1_latency.bus_latency = 0;
    L1_latency.hit_latency = 4;

    L2_latency.bus_latency = 0;
    L2_latency.hit_latency = 5;
    // test();
    test_4();
    return 0;
}