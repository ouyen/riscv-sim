#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import os

RISCV_GCC="$HOME/riscv64i/bin/riscv64-unknown-elf-gcc -march=rv64i"
RISCV_LIB="riscv-test/lib.h riscv-test/lib.c"
RISCV_PATH="riscv-test/"
simulator="Simulator"
#  ~/riscv64i/bin/riscv64-unknown-elf-objdump riscv-test/elf/helloword.riscv  -D > riscv-test/asm/helloworld.asm
OBJDUMP="$HOME/riscv64i/bin/riscv64-unknown-elf-objdump"

if(not os.path.exists(simulator)):
    print("build the simluator")
    os.system("make")

if(len(sys.argv)==3):
    option=sys.argv[1]
    filename=sys.argv[2]
    if(os.path.exists(f"{RISCV_PATH}{filename}.c")):
        if(option=="build"):
            cmd=f"{RISCV_GCC} {RISCV_LIB} {RISCV_PATH}{filename}.c -o {RISCV_PATH}elf/{filename}.riscv"
            print(cmd)
            os.system(cmd)
        elif(option=="run"):
            cmd=f"./{simulator} {RISCV_PATH}elf/{filename}.riscv"
            print(cmd)
            os.system(cmd)
        elif(option=="asm"):
            cmd=f"{OBJDUMP} {RISCV_PATH}elf/{filename}.riscv -D >{RISCV_PATH}asm/{filename}.asm"
            print(cmd)
            os.system(cmd)


