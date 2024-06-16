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
   
   i) iverilog (name of the verilog file).v (tb_(name of verilog file)).v
   
   ii) ./a.out
   
![ss for opening gtkwave after loading the files into iverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/9c023f1a-c651-4cfa-bcf2-e514f69397a1)

3) Open the file in GTKWave to observe output:

   Steps:
   
   gtkwave (tb_(name of the verilog file)).vcd

OUTPUT:

![Screenshot 2024-06-11 003114](https://github.com/siddharthanand3/vsdhdp/assets/171400217/6bbf9384-86a3-4b88-8fc3-092955a237b0)

Viewing the verilog code for both the testbench and the file:

![iverilog testbench and file](https://github.com/siddharthanand3/vsdhdp/assets/171400217/717bfe71-c7a4-4564-86d4-fcebb9355613)


Read liberty command to read both the .lib file and verilog code file:

![read lib 1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/56b46a7a-631e-4660-9619-c3cd602aed9f)

![readverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/d049566f-a9c8-4467-bf9e-f8bda294e001)


Synthesis design:

Yosys is the synthesizer used to convert the RTL Design into a netlist for viewing purposes.

Code:

1) read_liberty -lib (.lib file location)
2) read_verilog (name of the verilog file).v
3) synth -top (module name in the verilog file)
4) abc -liberty (.lib file location)

![synthesisdesign](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4d2b9b0b-49b3-4724-b2da-8b40f6db723c)


Realise the exact .lib file and obtain parameters for verification:

![realisesky130_cd](https://github.com/siddharthanand3/vsdhdp/assets/171400217/3b53b11f-aed1-4861-9bda-9d96e9c0c53c)


Netlist viewing:
1) show

![netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/b55cb99e-59a1-4503-ab0e-295d2aa938a9) 

Writing the verilog netlist file:

1) write_verilog good_mux_netlist.v
2) !gvim good_mux_netlist.v

![netlist representation](https://github.com/siddharthanand3/vsdhdp/assets/171400217/d73a9989-b0a8-40e5-8da8-13f942f19803)


Day 2

Accessing the .lib file:

![lib ss](https://github.com/siddharthanand3/vsdhdp/assets/171400217/70ad16b6-d6ef-4d75-a96d-5c1ec3e603b3)


An example for how cells are stored:

![and gate specifications](https://github.com/siddharthanand3/vsdhdp/assets/171400217/c3c1af4f-98fe-413f-afb6-94e4c11484dc)

Different AND gates have different sizes and power consumed. For example, in the below figure although the AND4 gate occupies more area, the delay is lesser as compared to AND2 and AND0.

![andgatesdifferent flavors](https://github.com/siddharthanand3/vsdhdp/assets/171400217/ad8e0ced-1908-4de6-9611-ede56eaa930f)

Synthesis of Multiple modules:

When a single module is used multiple times in a file, it is created only once and replicated to fit the requirement. This saves time and power.

Code:

read_liberty -lib (path to the .lib file)

read_verilog (name of the Verilog file)

synth_top (name of the module)

abc -liberty (path to the .lib file)

show

![multi code](https://github.com/siddharthanand3/vsdhdp/assets/171400217/18d34fc2-97a0-4bf9-86ac-a7eb8815d4c8)

![Multiple modules](https://github.com/siddharthanand3/vsdhdp/assets/171400217/bbdb9291-cf46-4a79-9b2e-fc8c14e0af55)


Design output for each submodule:

![modules design output](https://github.com/siddharthanand3/vsdhdp/assets/171400217/f3e49ebb-87d2-4428-b1f4-94b56407fc3c)


Hierarchical design:

The design is constituted of many submodules, and it is preserved.

![hierarchical design](https://github.com/siddharthanand3/vsdhdp/assets/171400217/418c90a1-3456-4ae4-ab94-c1ea064635ed)

![hierarchy is preserved](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1ab9c081-60cc-4645-ad25-dc90a65bcc7c)


Flattened file:

On using the 'flatten' command in yosys you can breakdown the sub modules.

![flatten comparision](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1e0cf6cb-1774-4803-822e-6bebfa6ac6f9)

![flattened netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/91ed3a28-ec7f-4065-8f38-928a740bc226)


Synthesising the submodules separately:

Doing so helps efficiency and reduces delay.

![synthesising on submodule1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/9e6e37fc-a678-4b4e-af03-b206d3ac4d4b)

Netlist of submodule1:

![netlist submodule1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4f60bb8c-f38f-4ec9-ae56-eb46b78f4791)


Flop synthesis simulations:

Code:

To view in GTKWave:

1) iverilog (name of the verilog file).v tb_(name of the verilog file).v
2) gtkwave tb_(name of the verilog file).v

For viewing netlist in Yosys:

1) yosys
2) read_liberty -lib (path to the .lib file)
3) read_verilog (name of the verilog file).v

Since we are using a D flip flop, we use a keyword called 'dfflibmap':

4) dfflibmap -liberty (path to the .lib file)

This allows us to access only the dff files in the library.

5) abc -liberty (path to the .lib file)

6) show

   
Asynchronous reset: 

![asyncres](https://github.com/siddharthanand3/vsdhdp/assets/171400217/87a3f977-9398-4950-a24b-ef3cf3877201)

![dff asyncreset netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/a200e916-f8ce-4675-b058-7fb515ab7934)


Asynchronous set:

![async set](https://github.com/siddharthanand3/vsdhdp/assets/171400217/b1caee83-d554-4f2c-b9e9-eb34c6693631)

![asynset flop netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/2903222e-2593-448f-84c5-ae5268412577)


Synchronous set:

![syncres](https://github.com/siddharthanand3/vsdhdp/assets/171400217/41b5ed2f-f264-4e66-9ad8-81f489941bf2)



Day 3

Logic Optimizations


![syncres netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/304ea5a9-6cc9-4ef2-b263-fb7dc11a191f)





