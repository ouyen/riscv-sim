
#  RISC-V CPU模拟器设计与实现

## 开发环境

### 操作系统

此项目在`Ubuntu-20.04 (WSL)`下开发, `gcc version 9.4.0`, 编译选项为`-O2`, 开发工具为vscode

### RISC-V环境

在编译`riscv-gnu-toolchain`时, 为了设置编译器编译时只使用RV64I指令集, 必须指定`-march=rv64i`参数, 否则编译器会报错.

```bash
./configure  --with-arch=rv64i --prefix=$HOME/riscv64i 
```

在编译的时候也添加此选项生成RV64I指令集的ELF程序

```bash
~/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i riscv-test/helloworld.c -o helloworld.riscv
```

## 设计概述

此项目的目标是实现一个5级流水, 使用RV64I指令集的RISCV CPU.

项目大致可以分成两大部分: CPU 和 MMU, 其中CPU是一个简单的RV64I指令集的RISC-V CPU, 在CPU.cpp中实现; MMU (Memory Management Unit)是一个简单的内存系统, 外界提供了读写操作的接口, 屏蔽了下层存储结构的复杂实现. 

整个项目的入口为`Simulator.cpp`, 在此文件中首先处理输入参数, 之后实例化内存相关的模块, 之后引用第三方库`<elfio/elfio.hpp>`, 实现了ELF文件的读取和写入, 同时实现了ELF文件的加载和运行.
之后实例化CPU, 传入内存管理模块的指针, PC入口和栈的地址, 之后调用CPU的`run()`函数, 开始运行.

`CPU.h`为CPU的一些变量和函数的定义,具体由`CPU.cpp, ALU.cpp, ECALL.cpp`实现, 包含IF, ID, EX, MEM, WB五级流水, 其中IF是指令Fetch, ID是指令Decode, EX是指令Execute, MEM是指令Memory, WB是指令Writeback. 内置了RISC-V所需的32个寄存器, IFID, IDEX, EXMEM, MEMWB四个流水线寄存器的类, 一些控制信号, 一些辅助函数, 和运行函数`run()`. 而CPU中几个特殊的函数(ALU, ECALL) 则单独在`ALU.cpp, ECALL.cpp`中实现.其中ECALL的功能为自行设计, 用于方便输入输出, 需要和自己编写的`lib.h`配合使用.

`MMU.h`为MMU的一些变量和函数的定义, 具体由`MMU.cpp`实现, 实现了内存系统的操作. MMU向外界提供了对于1Byte, 2Byte, 4Byte, 8Byte的读写操作的接口, 屏蔽了下层存储结构的复杂实现. 其中在Lab2中没有加入Cache, 只使用DRAM作为内存系统. DRAM由`DRAM.cpp`实现, 包含了DRAM的读写操作, 和一些辅助函数, 可以支持0~2^32-1的地址访问. 由于此地址较大, 直接实例化一个这么大的数组会出现错误, 故使用了三级列表嵌套指针的形式存放, 根据需要再实例化相应的数组. 

## 具体设计和实现

### 指令语义的解析和控制信号的处理

cpu.run()中为一个大循环, 依次执行IF,ID,EX,MEM,WB. 每一部分根据旧的上一阶段流水线寄存器生成新的下一阶段寄存器, 如果是流水线, 则在WB之后执行:

```c
// new --> old
ifid_old = ifid_new;
idex_old = idex_new;
exmem_old = exmem_new;
memwb_old = memwb_new;

memset(&ifid_new, 0, sizeof(ifid_new));
memset(&idex_new, 0, sizeof(idex_new));
memset(&exmem_new, 0, sizeof(exmem_new));
memset(&memwb_new, 0, sizeof(memwb_new));

reg[0] = 0;
```

1. 在IF阶段会根据PC地址进行取指, 在此模拟器中采用的转移预测为始终不跳转, PC始终+4.

2. 在ID阶段会解析指令语义, 并将控制信号传递给EX, MEM, WB阶段: 

	1. 首先根据简单的位操作提取出opcode, rs1,rs2,rd,funct3,funct7对应的数字. 之后根据OPCODE的不同, 决定:
	1. 这条指令对应的立即数imm为多少, 并根据指令将此立即数扩展为64位
	2. rs1, rs2, rd是否置零(即这条指令没有用到相应寄存器); 
	3. Ctrl_M_MemRead 和Ctrl_M_MemWrite决定是否进行内存的读写操作以及相应的操作信息;
	4. Ctrl_WB决定是否进行寄存器的写操作以及相应的操作信息.

	2. 之后对寄存器进行访问, 取出`r1=R[rs1]; r2=R[rs2]`, 此时需要处理数据冒险的处理:
		1. 如果上一条指令为`l{b|h|w|d} rd, symbol`, 即将内存中的数据写入rd寄存器, 并且此rd寄存器为rs1或者rs2, 则需要进行停顿, 将idex_new.bubble设置为true, 插入一个bubble, 并重置IF, 使下一个循环中IF和这个循环相同 (只插入一个bubble的原因是在EX阶段会进行数据前递)
		2. 如果再上一条指令中WB阶段要写回rd且rd为rs1或者rs2, 则由于此模拟器在具体实现上并不是并发进行, 所以需要手动进行写回操作.

3. 在EX阶段中会根据控制信号对r1,r2,imm,pc四个数进行操作, 生成传给MEM的address和alu_out, 操作的控制由opcode, funct3, funct7决定. (由于不涉及具体的电路, 并没有进一步细分控制信号):

	1. 首先进行数据前递, 减少数据冒险的影响: 将之前应该写入rs1或rs2, 但因为流水线的结构此时未写入的数据前递至此, 手动写入.
	2. 再进行操作, 将r1,r2,imm,pc进行操作, 生成alu_out和address.(如果此时为ECALL指令, 调用EX_ecall()函数进行操作)
	3. 控制冒险: 如果指令为跳转指令, 进行跳转: 若之前PC预测不正确, 则重置PC, 清理流水线.

4. 在MEM阶段中会根据控制信号 Ctrl_M_MemRead 和Ctrl_M_MemWrite对address和alu_out进行操作, 如果写, 则将alu_out写入address指向的内存中, 如果读, 则将address指向的内存中的数据读入mem_out.

5. 在WB阶段中会根据控制信号Ctrl_WB决定是否进行写回操作, 并将alu_out或者mem_out写入rd寄存器.

### 系统调用等外围接口的处理

系统调用`ecall`指令根据Reg[a7]的控制对Reg[a0]进行处理:

| Reg[a7] | 操作           |
|---------|--------------|
| 1       | 以%c的格式打印a0   |
| 2       | 以%d的格式打印a0   |
| 3 or 93 | exit() 程序退出  |
| 4       | 读取一个char存入a0 |
| 5       | 读取一个int存入a0  |

(其中93是兼容默认的exit指令)

在`riscv-test/lib.h`中将汇编语言包装, 给出了以下函数:

```c
void print_num(int num);
void print_string(const char *str);
void print_char(char ch);

void exit_proc();

char read_char();
int read_num();
```

### 性能计数相关模块的处理

CPU内部有5个计数器: 
| 名称 | 功能           | 执行时间 |
|---------|--------------|--------------|
| cycle_count |总的周期计数 | 在run()的每次循环中加1 |
| inst_count | 指令计数     | 在EX的每次非空执行时加1 |
|  hazards_by_data_count | 数据冒险导致的停顿计数 | 在ID阶段每次判断出需要因数据冒险而停顿时加1 |
|  hazards_by_ctrl_count | 控制冒险导致的停顿计数 | 在EX阶段每次判断出需要因控制冒险而重置流水线时加1 |
|  predict_count | 跳转指令计数 | 在每次EX阶段遇到跳转指令时加1 |

应有:

```c
cycle_count=2+inst_count+hazards_by_data_count+hazards_by_ctrl_count*2
```

### 调试接口和其它接口等

CPU内部有三个bool类的控制信号: single_cycle, print_log, step_run (均默认为false), 可以在Simulator中通过程序输入控制:

| 名称         | 开启参数 | 为真功能         |
| ------------ | -------- | ---------------- |
| single_cycle | -s   | 变为单周期处理器 |
| print_log    | -p        | 打印日志 |
| step_run     | -S        | 单步运行         |

例如想以单周期处理器, 单步运行并打印日志, 可以输入:

```bash
./Simulator helloworld.riscv -s -p -S
```

## 功能测试和性能评测


在程序目录下使用`make`命令生成可执行文件Simulator, 使用方法为

```bash
./Simulator riscv-elf-file-name [-s] [-p] [-S] [-h]
Options: 
		[-s] : single_cycle
		[-p] : print_log
        [-S] : single step
		[-h] : help
```

项目中的`riscv-test`文件夹中有为测试程序，可以用来测试流水线处理器。
`riscv-test/elf`目录下为编译生成的程序, `riscv-test/asm`目录下为objdump生成的汇编代码。

项目中的`riscv.py`脚本可以自动化测试的流程, 例如命令:

```bash
./riscv.py run test_sort
```
意思为先编译`riscv-test/test_sort.c`为`riscv-test/elf/test_sort.riscv`, 之后运行`./Simulator riscv-test/elf/test_sort.riscv`

测试项目如下:

| 程序名称       | 程序功能                      |
| -------------- | ----------------------------- |
| test_cal       | 测试一些基本的算数运算        |
| test_LCM       | 计算12和63的最小公倍数        |
| test_Fibonacci | 计算Fibonacci数列的第19项     |
| test_sort      | 冒泡排序一个大小为20的int数组 |
| test_qort      | 快速排序一个大小为20的int数组 |

功能测试结果如下:

| 程序名称           | 指令数   | 周期数   | CPI     | 数据冒险导致的停顿 | 控制冒险导致的停顿 |
|----------------|-------|-------|---------|-----------|-----------|
| test_cal       | 864   | 1177  | 1.36227 | 13        | 298       |
| test_LCM       | 491   | 695   | 1.41548 | 22        | 180       |
| test_Fibonacci | 50451 | 66290 | 1.31395 | 3947      | 11890     |
| test_sort      | 7892  | 10936 | 1.38571 | 1842      | 1200      |
| test_qort      | 5305  | 7293  | 1.37474 | 1002      | 984       |

运行log如下:

```bash
$ ./riscv.py run test_cal
$HOME/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i  riscv-test/test_cal.c -o riscv-test/elf/test_cal.riscv
./Simulator riscv-test/elf/test_cal.riscv
[INFO] file riscv-test/elf/test_cal.riscv exists, start simulate

-----------------------------------------------------------

30
-10
-600
4
3
-12
5

-----------------------------------------------------------

[INFO] program exit .
Inst count 864
Cycle count 1177
CPI: 1.36227
Hazards by data: 13
Hazards by ctrl: 149
Cycles (1177) = 2+ Insts (864) + 2*Ctrl_hazard (149) + Data_hazards (13)
Predict 244 times, failed 149 times, success 95 times

$ ./riscv.py run test_LCM
$HOME/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i  riscv-test/test_LCM.c -o riscv-test/elf/test_LCM.riscv
./Simulator riscv-test/elf/test_LCM.riscv
[INFO] file riscv-test/elf/test_LCM.riscv exists, start simulate

-----------------------------------------------------------

252
-----------------------------------------------------------

[INFO] program exit .
Inst count 491
Cycle count 695
CPI: 1.41548
Hazards by data: 22
Hazards by ctrl: 90
Cycles (695) = 2+ Insts (491) + 2*Ctrl_hazard (90) + Data_hazards (22)
Predict 161 times, failed 90 times, success 71 times

$ ./riscv.py run test_Fibonacci
$HOME/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i  riscv-test/test_Fibonacci.c -o riscv-test/elf/test_Fibonacci.riscv
./Simulator riscv-test/elf/test_Fibonacci.riscv
[INFO] file riscv-test/elf/test_Fibonacci.riscv exists, start simulate

-----------------------------------------------------------

987
-----------------------------------------------------------

[INFO] program exit .
Inst count 50451
Cycle count 66290
CPI: 1.31395
Hazards by data: 3947
Hazards by ctrl: 5945
Cycles (66290) = 2+ Insts (50451) + 2*Ctrl_hazard (5945) + Data_hazards (3947)
Predict 6940 times, failed 5945 times, success 995 times

$ ./riscv.py run test_sort
$HOME/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i  riscv-test/test_sort.c -o riscv-test/elf/test_sort.riscv
./Simulator riscv-test/elf/test_sort.riscv
[INFO] file riscv-test/elf/test_sort.riscv exists, start simulate

-----------------------------------------------------------

prev: 8 12 3 5 2 45 0 14 2 9 1 7 6 4 19 11 17 15 -1 -18
after: -18 -1 0 1 2 2 3 4 5 6 7 8 9 11 12 14 15 17 19 45

-----------------------------------------------------------

[INFO] program exit .
Inst count 7892
Cycle count 10936
CPI: 1.38571
Hazards by data: 1842
Hazards by ctrl: 600
Cycles (10936) = 2+ Insts (7892) + 2*Ctrl_hazard (600) + Data_hazards (1842)
Predict 729 times, failed 600 times, success 129 times

$ ./riscv.py run test_qsort
$HOME/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i  riscv-test/test_qsort.c -o riscv-test/elf/test_qsort.riscv
./Simulator riscv-test/elf/test_qsort.riscv
[INFO] file riscv-test/elf/test_qsort.riscv exists, start simulate

-----------------------------------------------------------

prev: 8 12 3 5 2 45 0 14 2 9 1 7 6 4 19 11 17 15 -1 -18
after: -18 -1 0 1 2 2 3 4 5 6 7 8 9 11 12 14 15 17 19 45

-----------------------------------------------------------

[INFO] program exit .
Inst count 5305
Cycle count 7293
CPI: 1.37474
Hazards by data: 1002
Hazards by ctrl: 492
Cycles (7293) = 2+ Insts (5305) + 2*Ctrl_hazard (492) + Data_hazards (1002)
Predict 661 times, failed 492 times, success 169 times

```



## 其它需要说明的内容
### 额外的功能或性能特性，更优化的设计等

本项目实现了数据前递, 减少了由于数据冒险而造成的停顿, 降低了CPI.

### 意见和建议

给出的 `RISCV-simple-greencard.pdf`文件有错误, 并且指令不全, 比如addiw在这里就没有, 我最开始是按照这个表格做的, 结果运行时报错, 经过与`riscv-spec-v2.2.pdf`中的RV32/64G Instruction Set Listings 比对才发现. 



# cache

与Lab 2中的流水线模拟器联调，运行测试程序。该测试中cache的配置如下：

| Level | Capacity | Associativity | Block Size | Write Policy | Hit Latency  |
| ----- | -------- | ------------- | ---------- | ------------ | ------------ |
| L1    | 32KB     | 8 ways        | 64         | Write Back   | 1 CPU Cycle  |
| L2    | 256KB    | 8 ways        | 64         | Write Back   | 8 CPU Cycle  |
| LLC   | 8MB      | 8 ways        | 64         | Write Back   | 20 CPU Cycle |

测试结果如下:

| 程序名称       | 指令数 | 周期数 | CPI     | 访存延时 | 数据冒险导致的停顿 | 控制冒险导致的停顿 |
| -------------- | ------ | ------ | ------- | -------- | ------------------ | ------------------ |
| test_cal       | 864    | 1276   | 1.47685 | 99       | 13                 | 298                |
| test_LCM       | 491    | 893    | 1.81874 | 198      | 22                 | 180                |
| test_Fibonacci | 50451  | 67478  | 1.33750 | 1188     | 3947               | 11890              |
| test_sort      | 7892   | 11233  | 1.42334 | 297      | 1842               | 1200               |
| test_qort      | 5305   | 7986   | 1.50537 | 693      | 1002               | 984                |


由于Lab2没有计算访存带来的延时, 所以这里的CPI会因为延时而变高.