# VSD-HDP C12
This GitHub repository is with reference to the VSD Hardware Development Program held from 30th May to 8th August 2024

Yosys

1)	$ sudo apt-get update
2)	$ git clone https://github.com/YosysHQ/yosys.git
3)	$ cd yosys
4)	$ sudo apt install make
5)	$ sudo apt-get install build-essential clang bison flex \
    libreadline-dev gawk tcl-dev libffi-dev git \
   graphviz xdot pkg-config python3 libboost-system-dev \
    libboost-python-dev libboost-filesystem-dev zlib1g-dev
6)	$ make config-gcc
7)	$ make
8)	$ sudo make install
![Screenshot 2024-06-02 164007](https://github.com/siddharthanand3/vsdhdp/assets/171400217/38640060-1f57-4b90-85ce-02d3d8da50b6)

iVerilog

1)   sudo apt-get update
2)   sudo apt-get install iverilog 
![Screenshot 2024-06-04 173325](https://github.com/siddharthanand3/vsdhdp/assets/171400217/0a4109eb-273c-4712-936b-3f2052e3cfb1)

GTK Wave

1)   sudo apt-get update
2)   sudo apt install gtkwave
![Screenshot 2024-06-04 173133](https://github.com/siddharthanand3/vsdhdp/assets/171400217/fe3a3ab1-4a81-4a36-a04c-decf631f9ade)

Day 1

Viewing the output after simulation in GTKWave:


1) Open iVerilog
![ss for opening iverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/bbd88023-3ee5-4547-af92-191251f8c92a)

2) Create a VCD file:

   Steps:
   i) iverilog good_mux.v tb_good_mux.v
   ii) ./a.out
![ss for opening gtkwave after loading the files into iverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/9c023f1a-c651-4cfa-bcf2-e514f69397a1)

4) Open the file in GTKWave to observe output:

   Steps:
   i) gtkwave tb_good_mux.vcd

OUTPUT:

![Screenshot 2024-06-11 003114](https://github.com/siddharthanand3/vsdhdp/assets/171400217/6bbf9384-86a3-4b88-8fc3-092955a237b0)

Viewing the verilog code for both the testbench and the file:

![iverilog testbench and file](https://github.com/siddharthanand3/vsdhdp/assets/171400217/717bfe71-c7a4-4564-86d4-fcebb9355613)


Read liberty command to read both the .lib file and verilog code file:

![read lib 1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/56b46a7a-631e-4660-9619-c3cd602aed9f)

![readverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/d049566f-a9c8-4467-bf9e-f8bda294e001)


Synthesis design:

![synthesisdesign](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4d2b9b0b-49b3-4724-b2da-8b40f6db723c)


   
