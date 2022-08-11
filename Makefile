CC=g++

#  g++ Simulator.cpp ALU.cpp CPU.cpp DRAM.cpp ECALL.cpp MMU.cpp -I ./ -O2 -Wall -o Sim
cpu_src=ALU.cpp CPU.cpp  ECALL.cpp 
mem_src=DRAM.cpp MMU.cpp Cache.cpp
sim_main_src=Simulator.cpp $(cpu_src) $(mem_src)
cache_main_src=test_cache.cpp $(mem_src)
OPTION=-O2 
NO_WARN=-w
riscv_code_path=riscv-test

build: $(src)
	$(CC) $(sim_main_src) $(OPTION) -I ./ -o Simulator

test_cache:
	$(CC) $(cache_main_src) $(OPTION) -I ./ -o Cache_test
clean:
	rm *.riscv *.yml


