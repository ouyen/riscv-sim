GPP=g++

#  g++ Simulator.cpp ALU.cpp CPU.cpp DRAM.cpp ECALL.cpp MMU.cpp -I ./ -O2 -Wall -o Sim
src=Simulator.cpp ALU.cpp CPU.cpp DRAM.cpp ECALL.cpp MMU.cpp 
OPTION=-O2 
NO_WARN=-w
riscv_code_path=riscv-test

build: $(src)
	$(GPP) $(src) $(OPTION) -I ./ -o Simulator


