onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk_tb
add wave -noupdate /MIPS_Processor_TB/reset_tb
add wave -noupdate /MIPS_Processor_TB/alu_result_tb
add wave -noupdate -expand -group PROGRAM_COUNTER -radix hexadecimal /MIPS_Processor_TB/DUV/PC/new_pc_i
add wave -noupdate -expand -group PROGRAM_COUNTER -radix hexadecimal /MIPS_Processor_TB/DUV/PC/pc_value_o
add wave -noupdate -expand -group PROGRAM_MEMORY -radix hexadecimal /MIPS_Processor_TB/DUV/ROM/address_i
add wave -noupdate -expand -group PROGRAM_MEMORY -radix hexadecimal -childformat {{{/MIPS_Processor_TB/DUV/ROM/instruction_o[31]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[30]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[29]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[28]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[27]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[26]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[25]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[24]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[23]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[22]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[21]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[20]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[19]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[18]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[17]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[16]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[15]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[14]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[13]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[12]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[11]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[10]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[9]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[8]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[7]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[6]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[5]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[4]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[3]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[2]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[1]} -radix hexadecimal} {{/MIPS_Processor_TB/DUV/ROM/instruction_o[0]} -radix hexadecimal}} -subitemconfig {{/MIPS_Processor_TB/DUV/ROM/instruction_o[31]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[30]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[29]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[28]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[27]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[26]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[25]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[24]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[23]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[22]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[21]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[20]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[19]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[18]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[17]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[16]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[15]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[14]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[13]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[12]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[11]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[10]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[9]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[8]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[7]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[6]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[5]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[4]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[3]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[2]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[1]} {-height 15 -radix hexadecimal} {/MIPS_Processor_TB/DUV/ROM/instruction_o[0]} {-height 15 -radix hexadecimal}} /MIPS_Processor_TB/DUV/ROM/instruction_o
add wave -noupdate -expand -group REGISTER /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/reg_write_i
add wave -noupdate -expand -group REGISTER -color {Dark Slate Blue} -label t0 -radix binary /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t0/data_o
add wave -noupdate -expand -group REGISTER -label t1 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t1/data_o
add wave -noupdate -expand -group REGISTER -label t2 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t2/data_o
add wave -noupdate -expand -group REGISTER -label s7 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/s7/data_o
add wave -noupdate -expand -group REGISTER -color {Forest Green} -label sp -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/sp/data_o
add wave -noupdate -expand -group REGISTER -label t3 -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/t3/data_o
add wave -noupdate -group ALU /MIPS_Processor_TB/DUV/ALU_UNIT/alu_operation_i
add wave -noupdate -group ALU /MIPS_Processor_TB/DUV/ALU_UNIT/a_i
add wave -noupdate -group ALU /MIPS_Processor_TB/DUV/ALU_UNIT/b_i
add wave -noupdate -group ALU /MIPS_Processor_TB/DUV/ALU_UNIT/zero_o
add wave -noupdate -group ALU /MIPS_Processor_TB/DUV/ALU_UNIT/alu_data_o
add wave -noupdate -group CONTROL -color Yellow /MIPS_Processor_TB/DUV/CONTROL_UNIT/opcode_i
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/reg_dst_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/branch_eq_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/branch_ne_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_read_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_to_reg_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/mem_write_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/alu_src_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/reg_write_o
add wave -noupdate -group CONTROL /MIPS_Processor_TB/DUV/CONTROL_UNIT/alu_op_o
add wave -noupdate -expand -group REG_FILE -radix decimal /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/reg_write_i
add wave -noupdate -expand -group REG_FILE -radix unsigned /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/write_register_i
add wave -noupdate -expand -group REG_FILE -radix unsigned /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_register_1_i
add wave -noupdate -expand -group REG_FILE -radix unsigned /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_register_2_i
add wave -noupdate -expand -group REG_FILE -radix unsigned /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/write_data_i
add wave -noupdate -expand -group REG_FILE -radix unsigned /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_data_1_o
add wave -noupdate -expand -group REG_FILE -radix unsigned /MIPS_Processor_TB/DUV/REGISTER_FILE_UNIT/read_data_2_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {10 ps} {56 ps}