/******************************************************************
* Description
*	This is the top-level of a MIPS processor that can execute the next set of instructions:
*		add
*		addi
*		sub
*		ori
*		or
*		bne
*		beq
*		and
*		nor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 64
)
(
	// Inputs
	input clk,
	input reset,
	// Output
	output [31:0] alu_result_o
);
//******************************************************************/
//******************************************************************/
// Data types to connect modules

wire reg_dst_w;
wire not_zero_and_branch_ne_e;
wire zero_and_branch_eq_W;
wire or_for_branch_w;
wire alu_rc_w;
wire reg_write_w;
wire jump_signal_w;
wire jump_register_w;
wire return_address_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire zero_w;
wire [3:0] alu_op_w;
wire [4:0] alu_operation_w;
wire [4:0] r_or_i_w;
wire [4:0] write_register_w;
wire [31:0] data_ram_w;
wire [31:0] mux_pc_w;
wire [31:0] pc_w;
wire [31:0] jump_pc_w;
wire [31:0] program_counter_w;
wire [31:0] instruction_w;
//wire [31:0] read_data_1_w;
//wire [31:0] read_data_2_w;
//wire [31:0] inmmediate_extend_w;
wire [31:0] read_ata_2_r_nmmediate_w;
wire [31:0] alu_result_w;
wire [31:0] address_sub_w;
wire [31:0] address_w;
wire [31:0] pc_plus_4_w;
wire [31:0] write_data_w;

//nuevos wires del pipeline
//IF/ID
wire [31:0] ID_pc_plus_4_w;
wire [31:0] ID_instruction_w;
wire [31:0] ID_inmmediate_extend_w;
wire [31:0] ID_read_data_1_w;
wire [31:0] ID_read_data_2_w;

//EX
wire [31:0] EX_pc_plus_4_w;
wire [31:0] EX_read_data_1_w;
wire [31:0] EX_read_data_2_w;
wire [31:0] EX_inmmediate_extend_w;
wire [5:0] EX_instruction_R_w;
wire [5:0] EX_instruction_I_w;
wire [25:0] EX_adress_w;
wire [15:0] EX_imm_w;
wire [5:0] EX_shamt_w;
wire EX_reg_dst_w;
wire EX_alu_op_w;
wire EX_alu_rc_w;
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/

//IF


//IF/ID
Pipeline_Register
#
(
//2 outputs = 32 bits * 2
	.N_BITS(64)
)
IF_ID_PIPELINE
(
	.clk(clk),
	.reset(reset),
	.dataIn({pc_plus_4_w,instruction_w}),
	.dataOut({ID_pc_plus_4_w,ID_instruction_w})
);

//ID/EX
Pipeline_Register
#
(
//2 outputs = 32 bits * 2
	.N_BITS(64)
)
IF_ID_PIPELINE
(
	.clk(clk),
	.reset(reset),
	.dataIn({reg_dst_w, alu_op_w, alu_rc_w, ID_pc_plus_4_w, ID_read_data_1_w, ID_read_data_2_w, ID_inmmediate_extend_w, ID_instruction_w[20:16], ID_instruction_w[15:11], ID_instruction_w[25:0], instruction_w[15:0], instruction_w[10:6]}),
	.dataOut({EX_reg_dst_w, EX_alu_op_w, EX_alu_rc_w, EX_pc_plus_4_w, EX_read_data_1_w, EX_read_data_2_w, EX_inmmediate_extend_w, EX_instruction_R_w, EX_instruction_I_w, EX_adress_w, EX_imm_w, EX_shamt_w})
);

//EX/MEM
Pipeline_Register
#
(
//2 outputs = 32 bits * 2
	.N_BITS(64)
)
IF_ID_PIPELINE
(
	.clk(clk),
	.reset(reset),
	.dataIn({}),
	.dataOut({})
);

//ID
Control
CONTROL_UNIT
(
	.opcode_i(ID_instruction_w[31:26]),
	.reg_dst_o(reg_dst_w), //EX
	.alu_op_o(alu_op_w), //EX
	.alu_src_o(alu_rc_w), //EX
	.reg_write_o(reg_write_w), //va a WB
	.jump_signal_o(jump_signal_w), //MEM
	.mem_write_o(mem_write_w), //MEM
	.mem_read_o(mem_read_w), //MEM
	.mem_to_reg_o(mem_to_reg_w) //WB
);

//IF
Program_Counter
PC
(
	.clk(clk),
	.reset(reset),
	.new_pc_i(program_counter_w),
	.pc_value_o(pc_w)
);

//MEM
Data_Memory
#( .DATA_WIDTH(32),
	.MEMORY_DEPTH(256)
)
RAM
(
	.clk(clk),
	.write_data_i(MEM_read_data_2_w),
	.address_i(address_w),
	.mem_write_i(mem_write_w),
	.mem_read_i(mem_read_w),
	.data_o(data_ram_w)
);

//IF
Program_Memory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROM
(
	.address_i(pc_w),
	.instruction_o(instruction_w)
);

//IF
Adder
PC_Puls_4
(
	.data_0_i(pc_w),
	.data_1_i(32'h4),
	
	.result_o(pc_plus_4_w)
);


//WB
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_ALU_RESULT_OR_MEM_DATA
(
	.selector_i(WB_mem_to_reg_w),
	.data_0_i(WB_alu_result_w),
	.data_1_i(WB_data_ram_w),
	
	.mux_o(write_data_w)
);

//MEM
Restador
Resta
(
	.data_i(MEM_alu_result_w),
	.result_o(address_sub_w)
);

//MEM
Shift_Right_2
Shifter_R
(
	.data_i(address_sub_w),
	.data_o(address_w)
);

//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/

//EX
Multiplexer_2_to_1
#(
	.N_BITS(5)
)
MUX_R_TYPE_OR_I_Type
(
	.selector_i(EX_reg_dst_w),
	.data_0_i(EX_instruction_R_w),
	.data_1_i(EX_instruction_I_w),
	
	.mux_o(r_or_i_w)

);


//Este mux debe ir en EX
Multiplexer_2_to_1
#(
	.N_BITS(5)
)
MUX_REG_OR_RA
(
	.selector_i(return_address_w),
	.data_0_i(r_or_i_w),
	.data_1_i(5'b11111),
	
	.mux_o(write_register_w) //MEM

);

//ID
Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.reg_write_i(WB_reg_write_w),
	.write_register_i(WB_write_register_w),
	.read_register_1_i(ID_instruction_w[25:21]), //rs
	.read_register_2_i(ID_instruction_w[20:16]), //rt
	.write_data_i(write_data_w),
	.read_data_1_o(ID_read_data_1_w),
	.read_data_2_o(ID_read_data_2_w)

);

//ID
Sign_Extend
SIGNED_EXTEND_FOR_CONSTANTS
(   
	.data_i(ID_instruction_w[15:0]),
   .sign_extend_o(ID_inmmediate_extend_w)
);

//EX
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_READ_DATA_2_OR_IMMEDIATE
(
	.selector_i(EX_alu_rc_w),
	.data_0_i(EX_read_data_2_w),
	.data_1_i(EX_inmmediate_extend_w),
	
	.mux_o(read_ata_2_r_nmmediate_w)

);


//Mux que va antes del PC (IF)
Multiplexer_2_to_1
#(
	.N_BITS(32)
)
MUX_ADDER_OR_JUMP
(
	.selector_i(MEM_jump_signal_w | MEM_jump_register_w),
	.data_0_i(pc_plus_4_w),
	.data_1_i(MEM_jump_pc_w),
	
	.mux_o(program_counter_w)

);

//EX
ALU_Control
ALU_CTRL
(
	.alu_op_i(EX_alu_op_w),
	.alu_function_i(EX_inmmediate_extend_w[5:0]),
	.alu_operation_o(alu_operation_w),
	.jump_register_o(jump_register_w), //MEM
	.return_address_o(return_address_w) 

);



ALU
ALU_UNIT
(
	.alu_operation_i(alu_operation_w),
	.a_i(EX_read_data_1_w),
	.b_i(read_ata_2_r_nmmediate_w),
	.zero_o(zero_w),
	.shamt_i(EX_shamt_w),
	.imm_i(EX_imm_w),
	.address_i(EX_adress_w),
	.pc_i(EX_pc_plus_4_w),
	.jump_pc_o(jump_pc_w), //MEM
	.alu_data_o(alu_result_w) //MEM
);

assign alu_result_o = alu_result_w;


endmodule