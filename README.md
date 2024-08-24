# VSDHDP

## Table of Contents
- [Week 0](#week-0)
- [Week 1](#week-1)
- [Week 2](#week-2)
- [Week 3](#week-3)
- [Week 4](#week-4)
- [Week 5](#week-5)
- [Week 6](#week-6)
- [Week 7](#week-7)
- [Week 8](#week-8)
  

<h2 id = 'week-0'>Week 0</h2>


<p>
  
  ## **Yosys Installation**

  1. Update package list and install dependencies:
      ```sh
      sudo apt-get update
      sudo apt-get install build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev make
      ```

  2. Clone the Yosys repository and install:
      ```sh
      git clone https://github.com/YosysHQ/yosys.git
      cd yosys
      make config-gcc
      make
      sudo make install
      ```

  ![Yosys Installation Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/38640060-1f57-4b90-85ce-02d3d8da50b6)

  ## **iVerilog Installation**

  1. Update package list and install iVerilog:
      ```sh
      sudo apt-get update
      sudo apt-get install iverilog
      ```

  ![iVerilog Installation Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/0a4109eb-273c-4712-936b-3f2052e3cfb1)

  ## **GTKWave Installation**

  1. Update package list and install GTK Wave:
      ```sh
      sudo apt-get update
      sudo apt install gtkwave
      ```

  ![GTK Wave Installation Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/fe3a3ab1-4a81-4a36-a04c-decf631f9ade)

</p>



<h2 id = 'week-1'>Week 1</h2>

Introduction to Verilog RTL Design

### ***Viewing the Output After Simulation in GTKWave***

1. **Open iVerilog:**
    - ![ss for opening iverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/bbd88023-3ee5-4547-af92-191251f8c92a)

2. **Create a VCD file:**
    - Steps:
    ```sh
    iverilog (name of the verilog file).v (tb_(name of verilog file)).v
    ./a.out
    ```
    - ![ss for opening gtkwave after loading the files into iverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/9c023f1a-c651-4cfa-bcf2-e514f69397a1)

3. **Open the file in GTKWave to observe output:**
    - Steps:
    ```sh
    gtkwave (tb_(name of the verilog file)).vcd
    ```
    - OUTPUT:
    - ![Screenshot 2024-06-11 003114](https://github.com/siddharthanand3/vsdhdp/assets/171400217/6bbf9384-86a3-4b88-8fc3-092955a237b0)

#### **Viewing the Verilog Code for Both the Testbench and the File**

- ![iverilog testbench and file](https://github.com/siddharthanand3/vsdhdp/assets/171400217/717bfe71-c7a4-4564-86d4-fcebb9355613)

#### **Read Liberty Command to Read Both the .lib File and Verilog Code File**

- ![read lib 1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/56b46a7a-631e-4660-9619-c3cd602aed9f)
- ![readverilog](https://github.com/siddharthanand3/vsdhdp/assets/171400217/d049566f-a9c8-4467-bf9e-f8bda294e001)

#### **Synthesis Design**

- Yosys is the synthesizer used to convert the RTL Design into a netlist for viewing purposes.
- Code:
    ```sh
    read_liberty -lib (.lib file location)
    read_verilog (name of the verilog file).v
    synth -top (module name in the verilog file)
    abc -liberty (.lib file location)
    ```
- ![synthesisdesign](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4d2b9b0b-49b3-4724-b2da-8b40f6db723c)

#### Realize the Exact .lib File and Obtain Parameters for Verification

- ![realisesky130_cd](https://github.com/siddharthanand3/vsdhdp/assets/171400217/3b53b11f-aed1-4861-9bda-9d96e9c0c53c)

#### Netlist Viewing

- Code:
    ```sh
    show
    ```
- ![netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/b55cb99e-59a1-4503-ab0e-295d2aa938a9)

#### Writing the Verilog Netlist File

- Code:
    ```sh
    write_verilog good_mux_netlist.v
    !gvim good_mux_netlist.v
    ```
- ![netlist representation](https://github.com/siddharthanand3/vsdhdp/assets/171400217/d73a9989-b0a8-40e5-8da8-13f942f19803)

</details>

<details>
  <summary>Timing libs, hierarchical vs flat synthesis</summary>

#### Accessing the .lib File

- ![lib ss](https://github.com/siddharthanand3/vsdhdp/assets/171400217/70ad16b6-d6ef-4d75-a96d-5c1ec3e603b3)

#### An Example for How Cells Are Stored

- ![and gate specifications](https://github.com/siddharthanand3/vsdhdp/assets/171400217/c3c1af4f-98fe-413f-afb6-94e4c11484dc)
- Different AND gates have different sizes and power consumed. For example, in the below figure although the AND4 gate occupies more area, the delay is lesser as compared to AND2 and AND0.
- ![andgatesdifferent flavors](https://github.com/siddharthanand3/vsdhdp/assets/171400217/ad8e0ced-1908-4de6-9611-ede56eaa930f)

#### Synthesis of Multiple Modules

- When a single module is used multiple times in a file, it is created only once and replicated to fit the requirement. This saves time and power.
- Code:
    ```sh
    read_liberty -lib (path to the .lib file)
    read_verilog (name of the Verilog file)
    synth_top (name of the module)
    abc -liberty (path to the .lib file)
    show
    ```
- ![multi code](https://github.com/siddharthanand3/vsdhdp/assets/171400217/18d34fc2-97a0-4bf9-86ac-a7eb8815d4c8)
- ![Multiple modules](https://github.com/siddharthanand3/vsdhdp/assets/171400217/bbdb9291-cf46-4a79-9b2e-fc8c14e0af55)

#### Design Output for Each Submodule

- ![modules design output](https://github.com/siddharthanand3/vsdhdp/assets/171400217/f3e49ebb-87d2-4428-b1f4-94b56407fc3c)

#### Hierarchical Design

- The design is constituted of many submodules, and it is preserved.
- Code:
    ```sh
    read_liberty -lib <path to the .lib file>
    read_verilog (name of the Verilog file)
    synth_top (name)
    abc -liberty (path to the .lib file)
    show (name given)
    ```
- ![hierarchical design](https://github.com/siddharthanand3/vsdhdp/assets/171400217/418c90a1-3456-4ae4-ab94-c1ea064635ed)
- ![hierarchy is preserved](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1ab9c081-60cc-4645-ad25-dc90a65bcc7c)
- Code:
    ```sh
    write_verilog -noattr (name)
    !gvim (name)
    ```

#### Flattened File

- On using the 'flatten' command in Yosys you can break down the submodules.
- Code:
    ```sh
    flatten
    write_verilog (name of the module)_flat
    !gvim (name of the module)_flat
    ```
- ![flatten comparision](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1e0cf6cb-1774-4803-822e-6bebfa6ac6f9)
- ![flattened netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/91ed3a28-ec7f-4065-8f38-928a740bc226)

#### Synthesizing the Submodules Separately

- Doing so helps efficiency and reduces delay.
- ![synthesising on submodule1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/9e6e37fc-a678-4b4e-af03-b206d3ac4d4b)

#### Netlist of Submodule1

- ![netlist submodule1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4f60bb8c-f38f-4ec9-ae56-eb46b78f4791)

#### Flop Synthesis Simulations

- Code:
    - To view in GTKWave:
        ```sh
        iverilog (name of the verilog file).v tb_(name of the verilog file).v
        ./a.out
        gtkwave tb_(name of the verilog file).v
        ```
    - For viewing netlist in Yosys:
        ```sh
        yosys
        read_liberty -lib (path to the .lib file)
        read_verilog (name of the verilog file).v
        dfflibmap -liberty (path to the .lib file)
        abc -liberty (path to the .lib file)
        show
        ```

#### Asynchronous Reset

- ![asyncres](https://github.com/siddharthanand3/vsdhdp/assets/171400217/87a3f977-9398-4950-a24b-ef3cf3877201)
- ![dff asyncreset netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/a200e916-f8ce-4675-b058-7fb515ab7934)

#### Asynchronous Set

- ![async set](https://github.com/siddharthanand3/vsdhdp/assets/171400217/b1caee83-d554-4f2c-b9e9-eb34c6693631)
- ![asynset flop netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/2903222e-2593-448f-84c5-ae5268412577)

#### Synchronous Set

- ![syncres](https://github.com/siddharthanand3/vsdhdp/assets/171400217/41b5ed2f-f264-4e66-9ad8-81f489941bf2)
- ![syncres netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/304ea5a9-6cc9-4ef2-b263-fb7dc11a191f)

<h2 id = 'week-2'>Week 2</h2>
Logic Optimization
    
#### Logic Optimization

Logic optimization is a process of finding an equivalent representation of the specified logic circuit under one or more specified constraints. This process is a part of logic synthesis applied in digital electronics and integrated circuit design.

#### Combinational Logic Optimization

**Steps:**
 In the Verilog files folder, open Yosys.
1. `read_liberty -lib (path to the .lib file)`
2. `read_verilog opt_check.v`
3. `synth -top opt_check`
4. `opt_clean -purge`
5. `abc -liberty (path to the .lib file)`
6. `show`

**Opt_check file:**

![Opt_check Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/ed137704-a63e-427a-ab6d-01b974ac73f9)

![Opt_check Verilog Code](https://github.com/siddharthanand3/vsdhdp/assets/171400217/157083a9-8d98-4263-b849-bb45faca0a36)

**Opt_check2 file:**

![Opt_check2 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/ea231afd-bd5e-4fa4-ad05-bf6e7aac3892)

![Opt_check2 Verilog Code](https://github.com/siddharthanand3/vsdhdp/assets/171400217/32b06234-f2a1-4261-b4a3-386bc211c161)

**Opt_check3 file:**

![Opt_check3 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/e82c3999-5ce4-4c5c-a248-1896cf69f660)

![Opt_check3 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/60dc3739-13e7-4a87-9115-b58b6bdf2a65)

**Opt_check4 file:**

![Opt_check4 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/b73f7e05-67bc-4a09-aafa-15fe2b0083c8)

![Opt_check4 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/f4da383e-fc5f-44cb-b11c-4ed2ac2a95b6)

#### Optimization of Multiple Modules

**Steps:**
1. `yosys`
2. `read_liberty -lib (path to .lib file)`
3. `read_verilog (name of the file).v`
4. `synth -top (name of the module)`
5. `flatten`
6. `write_verilog (name of the file)_flat.v`
7. `opt_clean -purge`
8. `abc -liberty (path to the .lib file)`
9. `show`

**Multiple_module_opt.v:**

![Multiple Module Opt Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1bc28c90-2bd4-4997-ba8b-002571f07fbd)

![Multiple Module Opt Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/5ac68ad1-f45f-4abd-b7d3-b55247224f37)

#### Sequential Logic Optimization

**GTKWave:**
1. Open the Verilog files folder.
2. `iverilog (name of the verilog file).v tb_(name of the verilog file).v`
3. `./a.out`
4. `gtkwave tb_(name of the verilog file).v`

**Yosys netlist:**
1. `yosys`
2. `read_liberty -lib (path to the .lib file)`
3. `read_verilog (name of the verilog file).v`
4. `dfflibmap -liberty (path to the .lib file)`  # Since using a D flip flop
5. `abc -liberty (path to the .lib file)`
6. `show`

**Dff_const1.v:**

![Dff_const1 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/d3ba78a9-f06c-4e63-ae34-1f8861d23912)

![Dff_const1 GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/547008c0-eba6-4650-9858-b6e269184e98)

![Dff_const1 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/31547a10-e59a-4112-ae4b-d0680373dd8a)

**Dff_const2.v:**

![Dff_const2 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/549e0cae-bdc7-4788-befe-0c28ae431e0d)

![Dff_const2 GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/47e1d220-fa27-4e11-b911-4969644b2f6a)

![Dff_const2 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/19621b92-7790-4195-bbb9-e98b4f58e7aa)

**Dff_const3.v:**

![Dff_const3 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/37c15e31-f4bf-42f8-8878-bbce8382933e)

![Dff_const3 GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/575ac287-7b79-42ae-82cf-9f29eccb8a71)

![Dff_const3 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/7593754d-f778-4ebc-8b8f-cf1433e12449)

**Dff_const4.v:**

![Dff_const4 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/7f49bdec-cd01-4fe6-8da3-52bcb511ef6b)

![Dff_const4 GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/029d50b0-1a2f-4a64-ac15-29d43f53cd32)

![Dff_const4 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/51796e6a-0c52-4ec8-b664-b63fdd8c5230)

**Dff_const5.v:**

![Dff_const5 Screenshot](https://github.com/siddharthanand3/vsdhdp/assets/171400217/97c85158-cb06-4fad-be5b-89260485def1)

![Dff_const5 GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/3955d1cc-3d1f-4ec1-a085-8274cf9aa10f)

![Dff_const5 Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/fa6d846c-8a42-4a08-b011-e2ad86870dfe)

 </details>

 <details>
    <summary>Gate Level Simulation (GLS)</summary>

#### Gate Level Simulation (GLS)

**Synthesis Simulation Mismatch:**

**Steps:**
1. GTKWave simulation
2. Yosys synthesis of netlist
3. Gate level simulation to compare the two simulations and confirm

**Code:**

**GTKWave simulation:**
1. `iverilog (name of the verilog file).v tb_(name of the verilog file).v`
2. `./a.out`
3. `gtkwave tb_(name of the verilog file).v`

**Yosys synthesis of netlist:**
1. `read_liberty -lib (path to the .lib file)`
2. `read_verilog (name of the verilog file).v`
3. `synth -top (name of the module)`
4. `abc -liberty (path to the .lib file)`
5. `write_verilog (name of the verilog file)_net.v`
6. `show`

**Gate level simulation:**
1. `iverilog (path to the primitives.v file) (path to the sky130_fd_sc_hd.v file) (name of the verilog file)_net.v (testbench of the verilog file)`
2. `./a.out`
3. `gtkwave (testbench of the verilog file).vcd`

**Ternary_mux_operator.v:**

**File:**

![Ternary_mux File](https://github.com/siddharthanand3/vsdhdp/assets/171400217/e3a704ac-9b72-47c8-89b0-be29492823c5)

**GTKWave simulation:**

![Ternary_mux GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/22b26915-2e98-4f00-8707-5bb375750505)

**Netlist:**

![Ternary_mux Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/882805fb-8763-49a5-91fe-dba2548dd597)

**Confirmed GLS output:**

![Ternary_mux GLS Output](https://github.com/siddharthanand3/vsdhdp/assets/171400217/7e832ae8-a720-4181-80dc-3aa6d88677f3)

**Bad_mux.v:**

**File:**

![Bad_mux File](https://github.com/siddharthanand3/vsdhdp/assets/171400217/11de45ac-99d6-4798-9e68-0e2cd1d7ad3a)

**GTKWave simulation:**

![Bad_mux GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4a4116cf-b540-4800-90b6-4798d8b56096)

**Netlist:**

![Bad_mux Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/f59a16cf-5fd8-45ad-a280-67ff30b1071d)

**Confirmed GLS output:**

![Bad_mux GLS Output](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1d1a7da5-ac43-4a1a-8460-c3a05080d0df)

**Blocking_caveat.v:**

**File:**

![Blocking_caveat File](https://github.com/siddharthanand3/vsdhdp/assets/171400217/59ce738b-d7ef-4cbf-ad11-920aafc23f49)

**GTKWave simulation:**

![Blocking_caveat GTKWave](https://github.com/siddharthanand3/vsdhdp/assets/171400217/25cf96a8-6956-48c6-93b9-bcd72315d68e)

**Netlist:**

![Blocking_caveat Netlist](https://github.com/siddharthanand3/vsdhdp/assets/171400217/362f6518-6409-41b2-bf9a-834f71717220)

**Confirmed GLS output:**

![Blocking_caveat GLS Output](https://github.com/siddharthanand3/vsdhdp/assets/171400217/14045d2f-88ae-4cf4-970d-18ec67712e25)

In the above example, the Gate Level Simulation failed. This is due to a synthesis simulation mismatch caused by a blocking statement. Hence, it is important to note that we need to avoid using blocking statements as much as possible. And when we do use them, we need to have the utmost clarity so as to prevent such errors.
 </details>
</details>

<details>
  <summary>
    <h2 id = 'week-3'>Week 3</h2>
  </summary>
  <details>
    <summary>RISC-V: An overview</summary>

#### **RISC-V architecture:** 

  The RISC-V architecture is built upon a set of key design principles that contribute to its performance, efficiency, and adaptability. These principles include the use of a reduced instruction set, modularity, and extensibility. By adhering to these principles, RISC-V enables the development of processors that can be tailored to specific applications and use cases, providing a high degree of customization and optimization.

  ![image](https://github.com/siddharthanand3/vsdhdp/assets/171400217/80d84c9f-7e37-4212-bb5a-b837e920e08b)

#### **Instruction set:**

 The RISC-V instruction set architecture (ISA) is a set of instructions for a computer processor. It supports a wide range of applications, including embedded systems, application processors, and microcontrollers. The RISC-V instructions are designed to improve code density and performance while ensuring that code is compact and easy to debug. The instruction set includes integer and floating-point computing, as well as memory and control instructions. The instruction set is extensible, allowing for custom instructions to be added to the architecture.

![image](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4096d8c2-7a49-41f9-83b5-cb7694b47eab)

![image](https://github.com/siddharthanand3/vsdhdp/assets/171400217/2d850c99-8130-4be8-9d9b-d1ba481ff846)

</details>
  <details>
    <summary>Compilation of the C Code</summary>

#### **Installation of the leafpad editor:**

```bash
sudo apt install leafpad
```

#### **Open the leafpad editor:**

```bash
leafpad (name of the file).c
```

#### **C code:**

![Screenshot 2024-06-26 223602](https://github.com/siddharthanand3/vsdhdp/assets/171400217/4c3e3837-f8e0-4730-abf1-2a88e947d800)


#### **Output of the code:**

```bash
gcc (name of the file).c
ls -ltr
./a.out
```

![Screenshot 2024-06-25 180104](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1296a5cf-bf2f-4662-8d56-9af62cb1de26)

 </details>
 
 <details>
    <summary>RISC-V Based Lab</summary>


#### **Code:**

#### **Display the C code on terminal:**

```bash
cat (name of the file).c
```

![cat c code](https://github.com/siddharthanand3/vsdhdp/assets/171400217/a5ef253a-eb1e-4260-95fa-c02c78c7bfbd)


#### **Utilizing the RISC-V compiler:**

```bash
riscv64-unknown-elf-gcc -o1 -mabi=lp64 -march=rv64i -o (name of the file).o (name of the file).c
```

#### **Check if the file has been created:**

```bash
ls -ltr (name of the file).o
```

![Screenshot 2024-06-25 185502](https://github.com/siddharthanand3/vsdhdp/assets/171400217/7fc1a23f-a8fa-47a2-9d5a-60415d9b0f85)

#### **In order to view the Assembly level breakdown:**

```bash
riscv64-unknown-elf-objdump -d (name of the file).o
riscv64-unknown-elf-objdump -d (name of the file).o | less
/main
```

![O1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/1df9dccb-6faf-4f8e-b70d-e364e8761eca)


#### **In order to reduce the number of instructions so that speed is increased:**

```bash
riscv64-unknown-elf-gcc -ofast -mabi=lp64 -march=rv64i -o (name of the file).o (name of the file).c
```


#### **Reduced instruction set:**

![ofast instruction](https://github.com/siddharthanand3/vsdhdp/assets/171400217/abf48a44-b595-48c9-9447-5dffda7f23cd)


| Optimization flags | Details |
|-|-|
| `-O0` | Default optimization for compilation time. | 
| `-O1` | It optimizes minimally. |
| `-O2` | It optimizes slightly more than O1. |
| `-O3` | It optimizes even more. |
| `-Ofast` | It optimizes very aggressively to the point of breaking standard compliance. |
| `-Og` | Optimize debugging experience. -Og enables optimizations that do not interfere with debugging. It should be the optimization level of choice for the standard edit-compile-debug cycle, offering a reasonable level of optimization while maintaining fast compilation and a good debugging experience. |
| `-Os` | Optimize for size. `Os` enables all `O2` optimizations that do not typically increase code size. It also performs further optimizations designed to reduce code size. `Os` disables the following optimization flags: `-falign-functions -falign-jumps -falign-loops -falign-labels -freorder-blocks -freorder-blocks-and-partition -fprefetch-loop-arrays -ftree-vect-loop-version`. |

  </details>
<details>
  <summary>RISC-V rv32i</summary>
 
<details>
    <summary>
    <h4 id='RISC-V Simulation using GTKWave'>  RISC-V Simulation using GTKWave </h4>
    </summary>


#### In order to clone the files and download the netlist files for simulation and synthesis:

```bash
git clone https://github.com/siddharthanand3/vsdhdp
cd rv32i
```

#### **GTKWave simulation**:

```bash
iverilog rv32i.v tb_rv32i.v
./a.out
gtkwave tb_rv32i.vcd
```

| **S. No.** |  **Operation**  |  **Hardcoded ISA**  |  
|  :----:  |  :----:  |  :----:  |  
|  1.  |  ADD R6, R2, R1  |  32'h02208300  |  
|  2.  |  SUB R7, R1, R2  |  32'h02209380  |  
|  3.  |  AND R8, R1, R3  |  32'h0230a400  |  
|  4.  |  OR R9, R2, R5  |  32'h02513480  |  
|  5.  |  XOR R10, R1, R4  |  32'h0240c500  |  
|  6.  |  SLT R1, R2, R4  |  32'h02415580  |  
|  7.  |  ADDI R12, R4, 5  |  32'h00520600  |  
|  8.  |  BEQ R0, R0, 15  |  32'h00f00002  |  
|  9.  |  SW R3, R1, 2  |  32'h00209181  |  
|  10.  |  LW R13, R1, 2  |  32'h00208681  |  
|  11.  |  SRL R16, R14, R2  |  32'h00271803  |
|  12.  |  SLL R15, R1, R2  |  32'h00208783  |

#### **Analysing the obtained waveform pertaining to each of the above instruction:**

`clk` - clock
`ID_EX_A` - Input stored in register 1
`ID_EX_B` - Input stored in register 2
`EX_MEM_ALUOUT` - Obtained output
`EX_MEM_IR` - 32 bit ISA for each instruction

**`Instruction 1: ADD R6, R2, R1`**  

Output of ADD: 1+2 = 3
Hardcoded ISA: 32'h02208300

![instruction 1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/ec6b814b-93ae-4978-84d1-deba37bbbf97)

**`Instruction 2: SUB R7, R1, R2`**

Output of SUB: 1-2 = -1 = FFFFFF...
Hardcoded ISA: 32'h02209380

![instruction 2](https://github.com/siddharthanand3/vsdhdp/assets/171400217/7ea4a566-d8ec-45ba-9ee8-252bb913ea7f)

**`Instruction 3: AND R8, R1, R3`**

Output of AND: 3(0011) & 1(0001) = 1(0001)
Hardcoded ISA: 32'h0230a400

![instruction3](https://github.com/siddharthanand3/vsdhdp/assets/171400217/e87a951a-1ca2-4178-abe2-b082310d476b)

**`Instruction 4: OR R9, R2, R5`**

Output of OR: 2(0010) | 5(0101) = 7(0111)
Hardcoded ISA: 32'h02513480

![instruction4](https://github.com/siddharthanand3/vsdhdp/assets/171400217/0ee70de0-788c-489a-a0d6-9b254ac32fd5)

**`Instruction 5: XOR R10, R1, R4`**

Output of XOR: 1(0001) ^ 4(0100) = 5(0101)
Hardcoded ISA: 32'h0240c500

![instruction5](https://github.com/siddharthanand3/vsdhdp/assets/171400217/5f4a8849-6c79-4f14-afe1-a2d85428e38b)

**`Instruction 6: SLT R1, R2, R4`**

Output of SLT: It compares the first input with the second input. If the first input is lesser than the second, then 1. Else 0.
2<4, hence 1.
Hardcoded ISA: 32'h02415580

![instruction6](https://github.com/siddharthanand3/vsdhdp/assets/171400217/9ffac6ae-651c-45e5-8dfa-735d31638857)

**`Instruction 7: ADDI R12, R4, 5`**

Output of ADDI: It adds the first input with an immediate value.
Hardcoded ISA: 32'h00520600

![instruction7](https://github.com/siddharthanand3/vsdhdp/assets/171400217/2671bad3-0e20-4694-8762-9c6e6579b9f2)

**`Instruction 8: BEQ R0, R0, 15`**

Output of BEQ: BEQ is a branching instruction which increments the program counter(PC) by the provided number(in this case, 15) if both inputs are equal.
Here since both inputs are equal, we can see the increase in the program counter.
Hardcoded ISA: 32'h00f00002

![instruction 8](https://github.com/siddharthanand3/vsdhdp/assets/171400217/0d27a9a3-c089-4804-bce2-4998963fdf16)

**`Instruction 9: SW R3, R1, 2`**

Output of SW: The store word `(SW)` instruction reads the lower 4 bytes of your source register and stores them into memory at the address given in the destination operand.
Memory in [ Source register 1 + offset ] is transferred to Destination register.
Hardcoded ISA: 32'h00209181

![instruction 9](https://github.com/siddharthanand3/vsdhdp/assets/171400217/71b933a4-29cd-4f70-93d7-c6e164b59fdf)


  </details>

<details>
    <summary>
      <h4 id='RISC-V Synthesis using Yosys'>RISC-V Synthesis using Yosys</h4>
      </summary>


#### **Synthesis to convert the RTL design code to netlist**:

```bash
read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog rv32i.v
synth -top rv32i
dfflibmap -liberty ..lib/sky130_fd_sc_hd__tt_025C_1v80.lib
proc ; opt	
abc -liberty ..lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten 
write_verilog -noattr rv32i_synth.v
```

The netlist file `rv32i_synth.v` is created in the home directory.

![presence of netlist file](https://github.com/siddharthanand3/vsdhdp/assets/171400217/0a719fb2-d99d-4747-ab44-dd3ba7ca2380)

  </details>

<details>
    <summary>
      <h4 id='Gate level simulation of RISC-V'>Gate level simulation of RISC-V</h4>
      </summary>

#### **Gate level simulation**:

```bash
iverilog (path to the primitives.v file) (path to the sky130_fd_sc_hd__tt_025C_1v80.lib file) rv32i_synt.v tb_rv32i.v
./a.out
gtkwave rv32i.vcd
```


**`Instruction 1: ADD R6, R2, R1`**  

![instruction 1](https://github.com/siddharthanand3/vsdhdp/assets/171400217/24bd4132-60a0-4a18-bd50-59784c272977)

**`Instruction 2: SUB R7, R1, R2`**

![instruction 2](https://github.com/siddharthanand3/vsdhdp/assets/171400217/3dbac635-133f-4dd3-a383-3421fd3e4c63)

**`Instruction 3: AND R8, R1, R3`**

![instruction3](https://github.com/siddharthanand3/vsdhdp/assets/171400217/6c7ee19c-d8e3-4e94-a08b-f1f2ab14d327)

**`Instruction 4: OR R9, R2, R5`**

![instruction4](https://github.com/siddharthanand3/vsdhdp/assets/171400217/148a0bd9-7e66-4b3d-aac4-01491035e7cd)

**`Instruction 5: XOR R10, R1, R4`**

![instruction5](https://github.com/siddharthanand3/vsdhdp/assets/171400217/27877b3d-a0a2-4bc0-88b2-807ed6b46ccb)

**`Instruction 6: SLT R1, R2, R4`**

![instruction6](https://github.com/siddharthanand3/vsdhdp/assets/171400217/14f69da4-98c0-41fb-9b23-cb8fe503d0fb)

**`Instruction 7: ADDI R12, R4, 5`**

![instruction7](https://github.com/siddharthanand3/vsdhdp/assets/171400217/c0bb5064-cf83-4bef-86b7-1b994f0ba66b)

**`Instruction 8: BEQ R0, R0, 15`**

![instruction 8](https://github.com/siddharthanand3/vsdhdp/assets/171400217/8ba2831f-a632-41b8-bb72-6427e6744f0f)

**`Instruction 9: SW R3, R1, 2`**

![instruction 9](https://github.com/siddharthanand3/vsdhdp/assets/171400217/debff06c-1b90-4460-86a3-0a9725c4dd9f)


The above screenshots are proof of the confirmed Gate Level Simulation (GLS), as there is no mismatch post synthesis.



</details>
</details>
  
</details>

<details>
  <summary>
     <h2 id = 'week-4'>Week 4</h2>
  </summary>
<details>  
<summary> Static timing Analysis (STA)</summary>  
<h3>What is Static Timing Analysis?</h3>  

* Static timing analysis (STA) is a method of validating the timing performance of a design by checking all possible paths for timing violations. 
STA breaks a design down into timing paths, calculates the signal propagation delay along each path, and checks for violations of timing constraints inside the design and at the input/output interface.
* In comparision to circuit simulation, static timing analysis is:
  * Faster - It doesn't simulate multiple test vectors
  * More thorough - It is more thorough in the sense that it checks the worst-case timing for all possible logic conditions, not just those sensitized by a particular set.


<h3>OpenSTA</h3>

OpenSTA is a gate level static timing verifier. As a stand-alone executable it can be used to verify the timing of a design using standard file formats.

Steps to install OpenSTA:
```
git clone https://github.com/parallaxsw/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
make
```

STA of RISC-V CPU core using OpenSTA:

1. Open a new folder which contains all the required files.
2. `sta`
3. `read_liberty ./sky130_fd_sc_hd__tt_025C_1v80.lib`
4. `read_verilog ./rv32i_synth.v`
5. `link_design rv32i`
6. `current_design`
7. `read_sdc riscv_core_synthesis.sdc`
8. `check_setup -verbose -unconstrained_endpoints`
9. `report_checks -path_delay min_max -fields {nets cap slew input_pins fanout} -digits {4}`

Min path:

![minpath](https://github.com/user-attachments/assets/383ced60-c91c-4d7e-83ed-c5bf17b68225)

Max path:

![maxpath](https://github.com/user-attachments/assets/9f924f08-63fa-4fe9-9352-0ef42fd6866d)

</details>
  
</details>

<details>
<summary>
  <h2 id = 'week-5'> Week 5 </h2>
</summary>  

Configuration of the .tcl file:

![Screenshot 2024-07-20 053448](https://github.com/user-attachments/assets/9189bd37-86ea-4cb5-98ff-41077899dbba)

Some basic commands for setting design constraints:

1. `get_*` - querying commands
   i) `get_ports`: It is used to query the ports in the design.
   ii) `get_clocks`: It is used to query the clocks in the design.
   iii) `get_attribute`: It is used to view properties of the cells or ports.

Note: `-filter` is used to input conditions while using `get_*` commands.

2. `report_*` - used to obtain details regarding any specific ports or pins

Configuring the Design constraints:

1. `create_clock -name <name_of_clock:'my_clk'> -per ,period:'5(in ns)'> [clock definition point]`: command to generate a clock
2. `set_clock_latency <delay> <name of the clock>`: In order to model clock delay in the network.
3. `set_clock_uncertainty <delay = skew + jitter> <name of the clock>`: This is for setting the clock network (skew + jitter).

Important note: It is imperative that after performing the CLock Tree Synthesis (CTS), we take only jitter into account. This is because the skew will be calculated from the clock network.

`set_clock_uncertainty <delay = jitter> <name of the clock>`: post CTS.

The period given in the `create_clock` command is actually the time period between two rising edges in the clock cycle.

`-wave {<first rising edge> <first falling edge>}`: this is used to signify that the starting phase (i.e. 0 is a falling edge).


TCL file defining the corners:

Process corners in VLSI refer to the variations in transistor and circuit behavior due to manufacturing tolerances. These variations can significantly impact the timing and performance of a circuit during static timing analysis (STA).

![image](https://github.com/user-attachments/assets/6ddcec89-1a36-442a-9115-10b604d8e8c7)

STA of slow, typical and fast libraries:

Slow library:

![Screenshot 2024-07-26 194838](https://github.com/user-attachments/assets/43ffa531-d36a-4b7c-aa8d-7d144bdf1e37)


Typical library:

![Screenshot 2024-07-26 194848](https://github.com/user-attachments/assets/9e4fcf72-1504-44f4-9438-8e704a346836)


Fast library:

![Screenshot 2024-07-26 194811](https://github.com/user-attachments/assets/50710848-0d16-4fd5-94fc-3e240e83792e)

TCL file for output generation:

![image](https://github.com/user-attachments/assets/4ba69a9b-fcf3-40be-a3b3-00a47144a5e8)


WNS:

Worst negative slack (WNS) is the setup slack of the critical path in your design.

![image](https://github.com/user-attachments/assets/10d98ccb-c591-403a-8bd0-87bf3b3fdca0)


TNS:

The "Total Negative Slack (TNS)" is the sum of the (real) negative slack in your design.

![image](https://github.com/user-attachments/assets/27b30f62-d7fc-4e2a-acad-59abf5e181d6)

</details>

<details>
<summary>
  <h2 id = 'week-6'> Week 6 </h2>
</summary>

There are 3 major elements that are required to execute the design flow of ASIC:

* Hardware Development Language
* EDA tools
* Process Design kits (PDKs)

The flow from RTL to GDSII:

![image](https://github.com/user-attachments/assets/3c685192-624a-48a0-a594-599c392e204e)


Interactive mode of OpenLANE:

1. `prep -design <design_name>`
2. `run_synthesis`
3.  `run_floorplan`
4.  `run_placement`
5.  `run_cts`
6.  `run_routing`
7.  `run_magic`
8.  `run_magic_spice_export`
9.  `run_magic_drc`
10.  `run_netgen`
11.  `run_magic_antenna_check`

Labs were performed with regard to design <`design name: picorv32a`>.

<details>
<summary> 
<h3>Synthesis and Flop ratio</h3>
</summary>

`run_synthesis` command to execute synthesis of picorv32a:

![image](https://github.com/user-attachments/assets/f4e385f5-e06c-4e15-95bc-880423f175b0)

  
Flop ratio of picorv32a:

![picorv32a](https://github.com/user-attachments/assets/fb231790-39b9-4f00-92be-2ac702d3f1b2)

Number of D- flip dlops is indicated by file name ending with 'dfxtp'. It's 1613.
```math
Total\ number\ of\ cells = 14876\

1613\ / 14876\ = 0.1084\ or\ 10.84\%.
```
</details>
<details>
<summary> 
<h3>Floorplan and placement post synthesis</h3>
</summary>
Floorplan:

1. `./flow.tcl -interactive`
2. `prep -design picorv32a`
3. `run_synthesis`
4. `run_floorplan`

![floorplan](https://github.com/user-attachments/assets/27d0d613-dd02-4ac6-8cbd-e9b96e4c6c37)


Pre-placement:

Contents of floorplan.def:

![floorplan def](https://github.com/user-attachments/assets/8bfd6103-c432-4004-8942-81fa57ae15b4)

Commands to load floorplan def in magic:

1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/17-03_12-06/results/floorplan/`
2. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.floorplan.def &`

![ss in floorplan def](https://github.com/user-attachments/assets/4b439e72-ff90-42a0-9925-eca88d955f21)

Equidistant ports:

![equidistant ports](https://github.com/user-attachments/assets/ee51a002-73d9-4594-9dc2-53f12b876b56)

Port placement:

![metal3layer](https://github.com/user-attachments/assets/781b45a1-53ef-4f24-9f35-a6d89df9c195)

![metal2layer](https://github.com/user-attachments/assets/b53d9c71-55b0-4482-b974-1aadc187a229)

Decap and tap cells:

![decap and tap cells](https://github.com/user-attachments/assets/ef0d0af6-f9bc-4f20-a990-3e827f89fa53)

Standard cells at the origin:

![subcell](https://github.com/user-attachments/assets/8366fb44-c690-4ad7-9ab7-a6a3c318867c)

Post-placement:

1. `run_placement`

Commands to load placement def in magic:

1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/17-03_12-06/results/placement/`
2. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &`

![placement def](https://github.com/user-attachments/assets/a2a29434-1947-4e07-8d54-ff2fa6dc3aef)

We previously saw in the floorplan about unplaced standard cells.

Standard cells legally placed:

![Unplacedstandardcellslegallyplace](https://github.com/user-attachments/assets/1ddb96fd-fad1-43cd-b5ca-85ebb7417504)
</details>

<details>
<summary> 
<h3>Designing library cells using magic and ngspice</h3>
</summary>

SPICE simulations:

The order of description of the MOS transistors is `drain gate source substrate`.

```
*** Model Descriptions ***
*** Netlist Descriptions ***
M1 out in vdd vdd PMOS W=0.375u L=0.25u
M2 out in 0 0 NMOS W=0.375u L=0.25u

cload out 0 10f

Vdd vdd 0 2.5
Vin in 0 2.5

*** Simulation Commands***
.op
.dc Vin 0 2.5 0.05

*** .include tech parameters file ***
.LIB "<name of tech parameters file>" CMOS_MODELS
.end
```

Cloning the design of the custom inverter layout from the referenced repository:

1. `cd /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane`
2. `git clone https://github.com/nickson-jose/vsdstdcelldesign`

Copy the magic tech file `sky130A.tech` to the same folder in order to not write the entire path repeatedly.

3. `cp /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech`

Open the custom inverter design on magic:

4. `magic -T sky130A.tech sky130_inv.mag &` 

![inverterlayout](https://github.com/user-attachments/assets/b0e00f7c-90fb-4c5b-a140-aee3d48aecb7)


Identifying PMOS and NMOS on the custom inverter layout:

![pmos identified](https://github.com/user-attachments/assets/7a6fa8e1-250d-436e-b3db-3c69db9ff937)

![nmosidentified](https://github.com/user-attachments/assets/b32f424d-5554-4aec-95f7-94404a725ac7)

Verification that the output (labelled Y) is in fact connected to the drain of both PMOS and NMOS:

![yconnectedtopmosandn](https://github.com/user-attachments/assets/ba5f4c0e-9db0-4c75-abe9-37382971b330)

Verification that Vss is connected to the source of NMOS:

![vgndconnectedtosourceofnmos](https://github.com/user-attachments/assets/a2641752-0634-4984-bd6d-4027cd3f6fe5)

Verification that Vdd is connected to the source of PMOS:

![vddconnectedtosourceofpmos](https://github.com/user-attachments/assets/c0a27e37-60fe-488c-bc3a-4c17df84b60a)

Spice extraction of the inverter:

In the tkcon window:

1. `extract all`

`.ext` file has been created.

2. `ext2spice cthresh 0 rthresh 0`
3. `ext2spice`

![sky130_inv spice](https://github.com/user-attachments/assets/7525b98b-182f-498d-95b5-e74334a0dfa2)

The `.spice` file has successfully been created.

Edited `sky130_inv.spice` file:

![spicefile](https://github.com/user-attachments/assets/aedd0ebe-b3ce-4540-b46b-78ac3bef224d)

Ngspice installation:

`sudo apt install ngspice`

Ngspice simulation:

1. `ngspice sky130_inv.spice`
2. `plot y vs time a`

![image](https://github.com/user-attachments/assets/c35a2938-bb64-4965-b0a8-7544f4fd19ca)

![graph](https://github.com/user-attachments/assets/7b1f3583-ba26-4e34-bd6b-587c93570c4d)

Rise transition time calculation:

```math
Rise\ transition\ time = X\ axis\ value\ for\ output\ at\ 80\% - X\ axis\ value\ for\ output\ at\ 20\%
```
```math
20\%\ of\ output = 660\ mV
```
```math
80\%\ of\ output = 2.64\ V
```

Output at 20%:

![code 20%](https://github.com/user-attachments/assets/84ab70aa-58a6-49b4-b126-d6df1edc3f83)

![20% img](https://github.com/user-attachments/assets/b13ae857-6d3e-4fe4-b2b0-f4148d0d865f)

Output at 80%:

![code 80%](https://github.com/user-attachments/assets/7541551d-2715-4c8c-9006-89f76f9ba3b5)

![80% img](https://github.com/user-attachments/assets/5a7e3dcb-d084-46be-9f07-f62b6741be6c)

```math
Rise\ transition\ time = 2.2465\ - 2.1823\ = 0.0642\ ns\ = 64.2\ ps
```

Cell rise delay calculation:

```math
Rise\ cell\ delay\ = X\ axis\ value\ for\ output\ at\ 50\% - X\ axis\ value\ for\ input\ at\ 50\%
```
```math
50\%\ of\ 3.3V\ = 1.65\ V
```

Cell rise delay at 50% of output:

![cellrisedelay](https://github.com/user-attachments/assets/d39d7d13-82bd-44a6-a3de-1e584dd5cdc4)

![50%cellrise](https://github.com/user-attachments/assets/ed55b631-847d-46d7-91ae-59a41b59c34f)


```math
Rise\ transition\ time = 2.2114\ - 2.1498\ = 0.0616\ ns\ = 61.6\ ps
```
</details>


<details>
<summary> 
<h3>Problems in the old magic tech file and DRC rules</h3>
</summary>

Corrupt skywater process magic tech file and performing DRC corrections:

1. Download `drc_tests.tgz` from [`https://opencircuitdesign.com/open_pdks/archive`](https://opencircuitdesign.com/open_pdks/archive).
2. `tar xfz drc_tests.tgz`

Now that the folder `drc_tests` has been successfully extracted in the `home` folder go ahead and see its contents.

3. `cd drc_tests`
4. `ls -al`

Screenshot of the command window and the contents:

![drc_tests](https://github.com/user-attachments/assets/43d45a12-b21a-490d-a6a8-5420562d6306)

.magicrc file:

![magicrc](https://github.com/user-attachments/assets/ce4d6885-b7f0-4bf1-a694-31ba1515b722)

Incorrectly implemented simple rule correction:

`met3.mag`:

![met3](https://github.com/user-attachments/assets/9231da4e-93f5-4f9e-91b4-3ae536d39b40)

Use `drc why` to identify errors:

![drc why](https://github.com/user-attachments/assets/8696c26e-cdd0-4166-8cbe-39c9ddb71842)

Loading poly:

`load poly`

![poly](https://github.com/user-attachments/assets/a5164c6c-7564-4885-b677-4280faa600a2)

![poly mag](https://github.com/user-attachments/assets/d8d9a4e3-1417-4684-8fab-6a08edeb210d)

Screenshot of `poly` rules:

![peripheryrules](https://github.com/user-attachments/assets/23677d8c-4559-433f-85cc-0b628cef093d)

In the below ss we can clearly notice the violation of `poly.9`

![poly 9violation](https://github.com/user-attachments/assets/013a3ec8-035e-4e23-8b27-90b71e75a82d)

DRC correction made:

![correction](https://github.com/user-attachments/assets/c34652f0-96e8-4765-89b1-fe62921b91f2)

![correction2](https://github.com/user-attachments/assets/1f333e6b-8ac0-4147-88a2-2364ee3420ac)

Let's update the `sky130A.tech` file in magic and check drc:

1. `tech load sky130A.tech`
2. `drc check`
3. `drc why`

![drccheck](https://github.com/user-attachments/assets/7849ca1e-080b-4aef-b150-1272eaa8039e)

Screenshot of `difftap` rules:

![difftap](https://github.com/user-attachments/assets/4db091ca-0305-47d1-9a58-bfd6de42aa6d)

Incorrectly implemented `difftap.2` rule:

![incorrectly implementeddifftap](https://github.com/user-attachments/assets/4b98bfab-be40-4425-93c8-b0e43f888eeb)


</details>

<details>
<summary> 
<h3>Timing modelling using delay tables</h3>
</summary>
Let's revisit the custom inverter layout:

1. `cd Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign`
2. `magic -T sky130A.tech sky130_inv.mag &`

![custominverterlay](https://github.com/user-attachments/assets/98b17110-902e-4a41-80bf-8aceaf37eefb)

`tracks.info` of sky130_fd_sc_hd:

1. `cd Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/openlane/sky130_fd_sc_hd/`
2. `less tracks.info`

![tracks info](https://github.com/user-attachments/assets/667b69ba-067d-47c6-a0b8-d43f7de1d007)

`tkcon` grid command window:

![tkcon grid](https://github.com/user-attachments/assets/801ea11d-e930-43a0-8707-1bc8af4b8d2d)

Condition 1 verified:

![condition1](https://github.com/user-attachments/assets/a1e3a86b-058a-4478-ae71-20a5833b1ba5)

Both the input and the output ports are at the intersection of the vertical and horizontal tracks. This ensures interconnectivity in both x and y direction for the ports.

Condition 2 verified:

![image](https://github.com/user-attachments/assets/c5f1fee9-28f6-4344-97e5-6e2dd5165a6b)

The second condition states that the width of the cell must be an odd multiple of the X pitch.

``` math
0.5\ + 1\ + 1\ + 0.5\ = 3\ which\ is\ odd.
```

``` math
Width\ of\ the\ standard\ cell\ = 0.46\ * 3\ = 1.38\ um.
```

Condition 3 verified:

![height and width of the cell](https://github.com/user-attachments/assets/3170adcf-0d3b-47b7-be7a-fcf25bf7bbdf)

The third condition states that the height of the cell must be an even multiple of the Y pitch.

``` math
0.5\ + 1\ + 1\ + 1\ + 1\ + 1\ + 1\ + 1\ + 0.5\ = 8\ which\ is\ even.
```

``` math
Height\ of\ the\ standard\ cell\ = 0.34\ * 8\ = 2.72\ um.
```

Save the file as `sky130_vsdinv.mag`:

![commandtosavevsdinv](https://github.com/user-attachments/assets/6496325f-5398-49a9-acff-5c951520e0a1)

Location of the saved file in parent directory:

![commandwindow](https://github.com/user-attachments/assets/2906d20d-0300-4c34-8f7a-9a554f776ad0)

Screenshot of newly created lef file:

![vsdinv lef](https://github.com/user-attachments/assets/6cbe24b3-14f1-4048-8819-f3682dbbbd4f)

Copy the newly generated lef and associated required lib files to the `src` directory located in `picorv32a` design:

1. `cp sky130_vsdinv.lef /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src`
2. `cp sky130_fd_sc_hd__* /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src`

![copywindow](https://github.com/user-attachments/assets/6bbc9e7b-1dff-4fdd-a258-6361068a92d3)

![srcwindow](https://github.com/user-attachments/assets/f53bfe37-46d2-4078-85dc-00219eeccd32)

Editing the `config.tcl` to change the lib files and add the extra lef into OpenLANE lef:

Commands to be added:

```
set ::env(LIB_SYNTH) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__typical.lib"
set ::env(LIB_FASTEST) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__fast.lib"
set ::env(LIB_SLOWEST) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__slow.lib"
set ::env(LIB_TYPICAL) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__typical.lib"

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/*.lef]
```

Screenshot of the edited `config.tcl`:

![updatedconfig tcl](https://github.com/user-attachments/assets/bcd8d7d5-68c3-4958-9536-1806e543ed05)

Run the OpenLANE flow with the new custom inverter file:

1. `cd Desktop/work/tools/openlane_working_dir/openlane`
2. `docker`
3. `./flow.tcl -interactive`
4. `package require openlane 0.9`
5. `prep -design picorv32a`
6. `set lefs [glob $::env(DESIGN_DIR)/src/*.lef]`
7. `add_lefs -src $lefs`
8. `run_synthesis`

Command window ss:

![synthesis_was_successful](https://github.com/user-attachments/assets/fa58b9ab-b3f0-466e-9069-02fa643f8314)


The current design values before modifying them to improve timing:

![design_values 2](https://github.com/user-attachments/assets/9c7f39be-d300-4152-a4bc-063ca65e7057)

![design_values 1](https://github.com/user-attachments/assets/0d10a057-de93-46ad-9a80-15ecb6bee9f3)

We can see below that the custom inverter file is saved as a macro in the `merged.lef`.

Screenshot of `merged.lef` in `tmp` directory:

![custominverterasmacro](https://github.com/user-attachments/assets/64d0005f-5a6d-4bc1-9dfc-7c02d06ec820)

```
prep -design picorv32a -tag 05-08_16-23 -overwrite

set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs

echo $::env(SYNTH_STRATEGY)
set ::env(SYNTH_STRATEGY) "DELAY 3"
echo $::env(SYNTH_BUFFERING)
echo $::env(SYNTH_SIZING)
set ::env(SYNTH_SIZING) 1
echo $::env(SYNTH_DRIVING_CELL)

run_synthesis
```

Screenshots from the command window:

![synthesissuccessful](https://github.com/user-attachments/assets/de7174f1-3080-42d1-9995-78d82089b1c5)

![area](https://github.com/user-attachments/assets/b618f819-7037-49a4-83f2-07dca472d295)

![slack](https://github.com/user-attachments/assets/2617b5d3-34f9-4218-93c3-80cbece9c72b)


Floorplan initiation:

Using `run_floorplan` throws an unexplainable error, therefore we can use the following commands which are already sourced in the `run_floorplan` command:

```
init_floorplan
place_io
tap_decap_or
```
Screenshots of the commands:

![init_floorplan](https://github.com/user-attachments/assets/a95386cb-132d-465a-830b-7508687988e7)

![place_io](https://github.com/user-attachments/assets/3377dec1-b051-4204-ace9-d19ca605445d)

![tap_decap_or](https://github.com/user-attachments/assets/ed9d2954-e174-4e7d-b352-7e4d43dad006)

Placement after the finishing of the floorplane:

`run_placement`

![placement](https://github.com/user-attachments/assets/d2ae32a6-b21b-48c2-b4f4-4f0ff4c6c9d9)

Load the `placement.def` file in magic:

1. `cd /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/05-06_16-23/results/placement`
2. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &`

The `placement.def` file displayed on magic:

![placement def](https://github.com/user-attachments/assets/2552a8b3-afaf-4b71-a98a-5aff652a44b0)

When zoomed in, we can observe instances of `vsdinv` getting utilised.

![placement vsdinv](https://github.com/user-attachments/assets/ac9d95fa-f7b9-41b3-8db1-e3d66cc395df)

In the tkcon window:

1. `expand`

We notice that the instance of `sky130_vsdinv` is directly connected to the cells of the other library:

![expand](https://github.com/user-attachments/assets/05c831ae-9a8d-45ed-bd01-6e8e4e72c726)


</details>
<details>
<summary> 
<h3>Timing modelling using ideal clocks in OpenSTA and Clock Tree Synthesis</h3>
</summary>
Performing synthesis and preparing for post-synth STA:

1. `cd Desktop/work/tools/openlane_working_dir/openlane`
2. `docker`
3. `package require openlane 0.9`
4. `prep -design picorv32a`
5. `set lefs [glob $::env(DESIGN_DIR)/src/*.lef]`
6. `add_lefs -src $lefs`
7. `set ::env(SYNTH_SIZING) 1`
8. `run_synthesis`

![Screenshot 2024-08-06 190716](https://github.com/user-attachments/assets/61a2936a-6965-4e4e-84d6-b3fa9e1a8e25)

Create a `pre_sta.conf` file for STA analysis in Openlane directory:

![pre_sta conf](https://github.com/user-attachments/assets/5c124bb3-a63c-4b9d-9ef3-dccefe90d42e)


Create a new `my_base.sdc` file specifically for STA analysis in the `/openlane/designs/picorv32a/src/` folder:

![mybase sdc](https://github.com/user-attachments/assets/ef4228dc-cbc2-4e4f-a496-f3709ab286d5)


STA Analysis:

1. `sta pre_sta.conf`

![sta1](https://github.com/user-attachments/assets/21290400-06f0-40e4-a565-dde3a4d46684)

![sta2](https://github.com/user-attachments/assets/7e938d8b-9653-48d5-90f1-eaeeb2a7ba82)

![sta3](https://github.com/user-attachments/assets/b3f770fc-ff3b-42d7-be7d-d67bb9c21d0a)

![sta4](https://github.com/user-attachments/assets/c252adce-a56b-40d2-a7d3-b18a9bb8f19b)

![sta5](https://github.com/user-attachments/assets/8dafc6de-9822-46f6-adfe-a7838fb0ca7f)


Adding parameters to reduce fanout, in turn reducing the delay:

1. `prep -design picorv32a -tag 08-08_06-55 -overwrite`
2. `set lefs [glob $::env(DESIGN_DIR)/src/*.lef]`
3. `add_lefs -src $lefs`
4. `set ::env(SYNTH_SIZING) 1`
5. `set ::env(SYNTH_MAX_FANOUT) 4`
6. `echo $::env(SYNTH_DRIVING_CELL)`
7. `run_synthesis`

![run_synthesis](https://github.com/user-attachments/assets/d78c5999-c22a-4b14-8623-0f9d8a43a477)

Static Timing Analysis:

`sta pre_sta.conf`

![sta1](https://github.com/user-attachments/assets/147e3f79-db23-4532-8d1c-832c40bf5bc3)

![Screenshot 2024-08-08 155559](https://github.com/user-attachments/assets/434c5655-bd51-467b-ba62-157c44a60291)

![sta](https://github.com/user-attachments/assets/df987d25-b4b4-4bcb-9144-3a1836df213a)

Timing ECO fixes to reduce slack violations:

![image](https://github.com/user-attachments/assets/d19fb30c-7ea1-45af-b09c-67857ee942e9)

Notice how an OR gate of drive strength 2 is driving 4 fanouts.

In order optimise timing,

1. `report_net -connections _11672_`
2. `help replace_cell`
3. `replace_cell _14510_ sky130_fd_sc_hd__or3_4`
4. `report_checks -fields {net cap slew input_pins} -digits 4`

![slackreduce1](https://github.com/user-attachments/assets/3c28a025-1cd5-49ae-8b4b-133637cce2b6)

![slackreduce2](https://github.com/user-attachments/assets/9fb9d9f9-52fa-4efc-9154-67b38c416119)

![slackreduce3](https://github.com/user-attachments/assets/20bcd9c3-e49d-49b5-9452-9b49b4e3ecc7)

Similarly in the case below:

The OR gate with drive strength 2 is driving 4 fanouts.

![slackreduce0](https://github.com/user-attachments/assets/2ac73681-adfc-4b3f-a958-b4b321828b4a)

1. `report_net -connections _11675_`
2. `replace_cell _14514_ sky130_fd_sc_hd__or3_4`
3. `report_checks -fields {net cap slew input_pins} -digits 4`

![slackreduce1](https://github.com/user-attachments/assets/7ccfd77c-55cb-415d-90d7-1cc1dea69a88)

![slackreduce2](https://github.com/user-attachments/assets/13eae6bd-8f9c-4aef-a050-c213161192c6)

![slackreduce3](https://github.com/user-attachments/assets/56ad9bd3-1774-46fc-844f-e132325910c4)

In the below case the OR gate of drive strength 2, driving OA gate has a lot of delay:

![slackreduce0](https://github.com/user-attachments/assets/573e7e40-d15e-471f-9940-e14a8d95f242)

1. `report_net -connections _11643_`
2. `replace_cell _14481_ sky130_fd_sc_hd__or4_4`
3. `report_checks -fields {net cap slew input_pins} -digits 4`

![slackreduce1](https://github.com/user-attachments/assets/318f04c0-f4ac-4e3d-8192-6fea154e463e)

![slackreduce3](https://github.com/user-attachments/assets/187c32e1-c4a3-4b88-90c9-ad36c2c24ace)

Similarly in the case below:

![slackreduce0](https://github.com/user-attachments/assets/f0829175-461b-4e7e-86b7-eaf65343c9b7)

1. `report_net -connections _11668_`
2. `replace_cell _14506_ sky130_fd_sc_hd__or4_4`
3. `report_checks -fields {net cap slew input_pins} -digits 4`

![slackreduce1](https://github.com/user-attachments/assets/417ad86c-3420-49db-b623-1400f78c99f3)

![slackreduce3](https://github.com/user-attachments/assets/dff258de-9538-4aeb-af23-5861efe0d025)

Commands to verify instance `_14506_` is replaced with `sky130_fd_sc_hd__or4_4`:

`report_checks -from _29043_ -to _30440_ -through _14506_`

![instance](https://github.com/user-attachments/assets/562a47db-3ab1-4a32-9b31-8edd00daaccb)

We started ECO fixes at wns -23.9000 and now we stand at wns -22.6173 we reduced around 1.2827 ns of violation.

Now we need to replace the old synthesised netlist with the new netlist where we have performed all the ECO fixes:

In order to insert this updated netlist, we can utilise the `write_verilog` command and overwrite the old netlist.

But for documentation purposes, we'll make a copy of the old netlist first.

1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/08-08_06-55/results/synthesis/`
2. `cp picorv32a.synthesis.v picorv32a.synthesis_old.v`

![rewriting0](https://github.com/user-attachments/assets/9d4d4b5d-a363-418b-8aff-c853e1b4fe67)

`write_verilog`:

1. `write_verilog /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/08-08_06-55/results/synthesis/picorv32a.synthesis.v`
2. `exit`

![rewriting](https://github.com/user-attachments/assets/d365e7c2-d2ed-4d4f-a07a-005d4a9598bb)

Verification that `_14506_` is replaced with `sky130_fd_sc_hd__or4_4`:

![instancegeneration](https://github.com/user-attachments/assets/5c123e62-4984-4aee-b66b-816466523b88)

If you remember, we had earlier created a 0 tns & wns design.

Let's load that back and progress to further stages.

1. `prep -design picorv32a -tag 08-08_06-55 -overwrite`
2. `set lefs [glob $::env(DESIGN_DIR)/src/*.lef]`
3. `add_lefs -src $lefs `
4. `set ::env(SYNTH_STRATEGY) "DELAY 3"`
5. `set ::env(SYNTH_SIZING) 1`
6. `run_synthesis`

As discussed earlier, the below steps are sourced in `run_floorplan`:

7. `init_floorplan`
8. `place_io`
9. `tap_decap_or`

Placement:

10. `run_placement`

Clock Tree Synthesis (CTS):

11. `run_cts`
12. `echo $::env(CTS_CLK_BUFFER_LIST)`
![loadingback](https://github.com/user-attachments/assets/b312d364-0023-41ef-97fa-0d521c8a43fd)

![loadingback2](https://github.com/user-attachments/assets/5df9ba4a-0c76-496f-8514-de0d8d7fabf8)

![loadingback3](https://github.com/user-attachments/assets/b78da739-5ff5-4b57-9509-24054618ab0d)

![loadingback4](https://github.com/user-attachments/assets/42db88f8-ca1d-43ab-bc46-e9c6551cfe92)

![loadingback5](https://github.com/user-attachments/assets/2a593bb6-9702-42b7-be24-736258bc5e17)

![loadingback6](https://github.com/user-attachments/assets/9be8a4f4-1b38-49a7-8f7f-b3b1c73ba60d)

![loadingback7](https://github.com/user-attachments/assets/7f079ace-6678-4279-b874-e55f12e45986)

![loadingback8](https://github.com/user-attachments/assets/121edbee-d183-4143-bca0-3ffcedf9a3c7)

</details>
<details>
<summary> 
<h3>OpenROAD Timing Analysis</h3>
</summary>

Performing timing analysis of the `picorv32a` design on OpenROAD:

1. `openroad`
2. `read_lef /openLANE_flow/designs/picorv32a/runs/24-03_10-03/tmp/merged.lef`
3. `read_def /openLANE_flow/designs/picorv32a/runs/24-03_10-03/results/cts/picorv32a.cts.def`
4. `write_db pico_cts.db`
5. `read_db pico_cts.db`
6. `read_verilog /openLANE_flow/designs/picorv32a/runs/24-03_10-03/results/synthesis/picorv32a.synthesis_cts.v`
7. `read_liberty $::env(LIB_SYNTH_COMPLETE)`
8. `link_design picorv32a`
9. `read_sdc /openLANE_flow/designs/picorv32a/src/my_base.sdc`
10. `set_propagated_clock [all_clocks]`
11. `report_checks -path_delay min_max -fields {slew trans net cap input_pins} -format full_clock_expanded -digits 4`

![openroad](https://github.com/user-attachments/assets/09cfee01-6c85-45c0-8199-1eab156f8d99)

![openroad1](https://github.com/user-attachments/assets/03d5b0c9-7874-4f28-ba39-c1515f7861a0)

![openroad2](https://github.com/user-attachments/assets/dbb62b29-585d-462a-97d5-bd4812471ed6)

![openroad3](https://github.com/user-attachments/assets/9a4269dc-c6c4-42e9-a317-9dca50471ae2)

![openroad4](https://github.com/user-attachments/assets/4b4244bc-79e6-4a12-88cc-5a5fa7ad6cdc)

Removing 'sky130_fd_sc_hd__clkbuf_1' cell from clock buffer list variable 'CTS_CLK_BUFFER_LIST':

1. `echo $::env(CTS_CLK_BUFFER_LIST)`
2. `set ::env(CTS_CLK_BUFFER_LIST) [lreplace $::env(CTS_CLK_BUFFER_LIST) 0 0]`
3. `echo $::env(CTS_CLK_BUFFER_LIST)`
4. `echo $::env(CURRENT_DEF)`
5. `set ::env(CURRENT_DEF) /openLANE_flow/designs/picorv32a/runs/24-03_10-03/results/placement/picorv32a.placement.def`
6. `run_cts`

![openroad5](https://github.com/user-attachments/assets/be91638f-d751-4dc5-bb13-c8083de6cb68)

![openroad6](https://github.com/user-attachments/assets/e5d6ff18-437e-480a-ac2a-b3b25a1208dd)

7. `echo $::env(CTS_CLK_BUFFER_LIST)`
8. `openroad`
9. `read_lef /openLANE_flow/designs/picorv32a/runs/24-03_10-03/tmp/merged.lef`
10. `read_def /openLANE_flow/designs/picorv32a/runs/24-03_10-03/results/cts/picorv32a.cts.def`
11. `write_db pico_cts1.db`
12. `read_db pico_cts.db`
13. `read_verilog /openLANE_flow/designs/picorv32a/runs/24-03_10-03/results/synthesis/picorv32a.synthesis_cts.v`

![openroad7](https://github.com/user-attachments/assets/2c09d898-e933-4bad-98ea-eff308171619)

14. `read_liberty $::env(LIB_SYNTH_COMPLETE)`
15. `link_design picorv32a`
16. `read_sdc /openLANE_flow/designs/picorv32a/src/my_base.sdc`
17. `set_propagated_clock [all_clocks]`
18. `report_checks -path_delay min_max -fields {slew trans net cap input_pins} -format full_clock_expanded -digits 4`

![openroad8](https://github.com/user-attachments/assets/15d43967-69e3-46ec-8b86-68f7e6e7d643)

![openroad9](https://github.com/user-attachments/assets/fa0a2e7c-1f08-4b33-97a7-ac39a0603f37)

![openroad10](https://github.com/user-attachments/assets/43e5a8ba-2370-4289-b920-581fe90efe31)

![openroad11](https://github.com/user-attachments/assets/55890fef-1413-43f5-bf6b-fb9129fed5ec)

19. `report_clock_skew -hold`
20. `report_clock_skew -setup`
21. `exit`

![openroad12](https://github.com/user-attachments/assets/e4823d6f-b6de-488a-a1ad-b1d68d6767f0)

22. `echo $::env(CTS_CLK_BUFFER_LIST)`
23. `set ::env(CTS_CLK_BUFFER_LIST) [linsert $::env(CTS_CLK_BUFFER_LIST) 0 sky130_fd_sc_hd__clkbuf_1]`
24. `echo $::env(CTS_CLK_BUFFER_LIST)`

![openroad13](https://github.com/user-attachments/assets/d01c1b45-cacd-437c-acc5-bb430d4b8361)

</details>
<details>
<summary> 
<h3>Final Steps for RTL2GDS using OpenSTA and tritonRoute </h3>
</summary>

Power Distribution Network building:

1. `docker`
2. `package require openlane 0.9`
3. `prep -design picorv32a`
4. `set lefs [glob $::env(DESIGN_DIR)/src/*.lef]`
5. `add_lefs -src $lefs`
6. `set ::env(SYNTH_STRATEGY) "DELAY 3"`
7. `set ::env(SYNTH_SIZING) 1`
8. `run_synthesis`

![postrtl0](https://github.com/user-attachments/assets/6b5385d4-5347-4d4d-8c9a-5088809c04d0)

![postrtl1](https://github.com/user-attachments/assets/9d011f3a-7033-4a38-bde4-8fe49e5e4397)

9. `init_floorplan`
10. `place_io`
11. `tap_decap_or`

![postrtl2](https://github.com/user-attachments/assets/716bdf13-3e6c-4ad7-a6b4-f7ae31d84985)

![postrtl3](https://github.com/user-attachments/assets/b571d376-b809-49ef-b210-24640d4c491a)

12. `run_placement`

![image](https://github.com/user-attachments/assets/9d5f915e-4f17-4fff-b59c-d3180e556829)

13. `run_cts`

![postrtl5](https://github.com/user-attachments/assets/e19c7e1c-cfdc-4676-9ad6-ccd21ca656df)

14. `gen_pdn`

![postrtl5 5](https://github.com/user-attachments/assets/30cf2d71-a634-43e5-9eed-90bcc43ceaff)

![postrtl6](https://github.com/user-attachments/assets/0005d50b-024c-4809-b3b1-a21983215fd7)


Load the PDN def in magic:

1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/09-08_10-40/tmp/floorplan/`
2. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read 14-pdn.def &`

Screenshots of the PDN def in magic:

![postrtl7](https://github.com/user-attachments/assets/5d4d0885-1408-49b6-9974-abaeb8e9e851)

![postrtl6 5](https://github.com/user-attachments/assets/f6e0dae7-f8d4-425c-945d-a2792031f1f0)

![postrtl8](https://github.com/user-attachments/assets/8ea304e0-003c-4e78-8bad-2eb985e009cb)

Routing using tritonRoute and exploration:

1. `echo $::env(CURRENT_DEF)`
2. `echo $::env(ROUTING_STRATEGY)`
3. `run_routing`

![postrtl9](https://github.com/user-attachments/assets/7c14b64f-6d99-44b7-9a54-d5db3f105d0b)

![Screenshot 2024-08-09 193840](https://github.com/user-attachments/assets/5a875be0-6da3-47ad-9789-bb60b3e1a346)

![postrtl10](https://github.com/user-attachments/assets/9bb183a2-11c1-411e-8d17-dd14f9156ed3)

Commands to load the routed def in magic:

1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/09-08_10-40/results/routing/`
2. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.def &`

![postrtl11](https://github.com/user-attachments/assets/775eb9af-9c58-4ae6-ada9-a795f5872d52)

![postrtl12](https://github.com/user-attachments/assets/85b81d4c-6f41-4cf3-aeb5-853bf570af08)

![postrtl13](https://github.com/user-attachments/assets/704d8abc-0ff0-4382-b5c0-e96021e07ba8)

![postrtl14](https://github.com/user-attachments/assets/d90d04e8-f152-405d-8ccd-f36593f844cd)

`fastroute.guide`:

1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/09-08_10-40/tmp/routing/`
2. `vim 15-fastroute.guide`

![fastroute guide](https://github.com/user-attachments/assets/7f9563a2-cf23-44a5-a6b6-0e06c37a888f)

SPEF extractor parasitic extraction:

1. `cd Desktop/work/tools/SPEF_EXTRACTOR`
2. `python3 main.py /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/26-03_08-45/tmp/merged.lef /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/26-03_08-45/results/routing/picorv32a.def`


</details>

</details>
<details>
<summary> 
<h2>Week 7</h2>
</summary>

Let's run the same flow for our custom `rv32i` design. 

<details>
  <summary>
    <h3>Folders and files</h3>
  </summary>

1. Create a `riscv` folder in the `designs` folder.

Here's a layout of the folder and the important files in it:

![riscvfolder](https://github.com/user-attachments/assets/da4e4856-632d-4d78-944f-350af7a899f2)

`config.tcl` file:

![riscvfolder2](https://github.com/user-attachments/assets/8fa936b1-6652-4c18-9f63-59042efbc2cf)

`src` folder:

![riscvfolder3](https://github.com/user-attachments/assets/61372214-9d1d-4b98-8c3e-0bf018b43991)

Make sure to edit each of these files to match the design name and module name.

</details>

<details>
  <summary>
    <h3>PDN generation</h3>
  </summary>

Since we have incorporated our own custom inverter cell in this design as well, here are the instances of it occuring in our design.

![extra](https://github.com/user-attachments/assets/934910ba-293a-4f18-9c9c-74641849ded5)

</details>
<details>
  <summary>
    <h3>PDN generation</h3>
  </summary>

1. `prep -design riscv`
2. `set lefs [glob $::env(DESIGN_DIR)/src/*.lef]`
3. `add_lefs -src $lefs`
4. `set ::env(SYNTH_STRATEGY) "DELAY 3"`
5. `set ::env(SYNTH_SIZING) 1`
6. `run_synthesis`
7. `init_floorplan`
8. `place_io`
9. `tap_decap_or`
10. `run_placement`
11. `run_cts`
12. `gen_pdn`

![pdn](https://github.com/user-attachments/assets/88dc3dec-5c8b-436a-b67e-cef4051bc9dc)

Viewing it in magic:

 1. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/riscv/runs/16-08_16-40/tmp/floorplan/`
 2. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read 14-pdn.def &`

![pdn2](https://github.com/user-attachments/assets/9c2f6d6a-f490-4b03-a5aa-7d07b9060827)

</details>

<details>
  <summary>
    <h3>Routing</h3>
  </summary>

1. `run_routing`

![routing](https://github.com/user-attachments/assets/20418cdd-dd4d-426e-8c5f-1a8d8197bf29)

2. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/riscv/runs/16-08_16-40/results/routing/`
3. `magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read rv32i.def &`

![routing2](https://github.com/user-attachments/assets/7435b627-450f-4388-9799-f09ffbd44582)

![routing3](https://github.com/user-attachments/assets/e578bf74-5ca8-4e45-a480-da55478ed0d8)

![routing4](https://github.com/user-attachments/assets/5a71e39a-8bae-4512-be5e-447fe8329ea4)

![routing5](https://github.com/user-attachments/assets/c86026c9-256a-427f-a57f-04bed540afdb)

4. `cd Desktop/work/tools/openlane_working_dir/openlane/designs/riscv/runs/16-08_16-40/tmp/routing/`
5. `gvim 15-fastroute`

![routing6](https://github.com/user-attachments/assets/99c8ef39-64b7-480a-a018-314d694121ff)

</details>
</details>
<details>
  <summary>
    <h2 id = 'week-8'>Week 8</h2>
  </summary>

<h3>Post routing STA</h3>

TCL file:

![postroutin1](https://github.com/user-attachments/assets/f0838d7a-ba8a-4f3c-8945-2b1b4f7b4e92)

1. `cd Desktop/work/tools/openlane_working_dir/openlane`
2. `docker`
3. `./flow.tcl -interactive`
4. `openroad post_routing.tcl`

Generated `.txt` files:

![postroutin2](https://github.com/user-attachments/assets/25cc4fb1-ccfc-418b-8b49-24275c6bdf6f)

Worst slack:

![postroutin3](https://github.com/user-attachments/assets/40b08636-095a-44c9-8599-ba171f85b45a)

Graphical view:

![worst slack](https://github.com/user-attachments/assets/3917b547-2154-4fd3-9ffd-4efb569b5760)

Total negative slack:

![postroutin4](https://github.com/user-attachments/assets/90064686-ffd5-475d-be0f-cc5b4b681fe6)

Graphical view:

![tns](https://github.com/user-attachments/assets/33ff3876-63db-475d-b02e-e36de3a1bdf5)

Worst negative slack:

![postroutin5](https://github.com/user-attachments/assets/e1941f1a-8e21-48d4-b905-79e924cbd609)

Graphical view:

![wns](https://github.com/user-attachments/assets/5c2083c3-71ac-469e-9c03-251fa76b28a3)


Input `run_magic` after routing:

`rv32i.gds.png`:

![run_magic](https://github.com/user-attachments/assets/cfa5fc41-a44b-4f1b-b244-c606ac45481a)


</details>

