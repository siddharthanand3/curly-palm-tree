# read design

read_verilog rv32i.v

# generic synthesis
synth -top rv32i

# mapping to mycells.lib
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
proc; opt
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}
clean
flatten
# write synthesized design
write_verilog -noattr rv32i_synth.v
