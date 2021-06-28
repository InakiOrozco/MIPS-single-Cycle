/******************************************************************
* Description
*	This is control unit for the MIPS processor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/
module Control
(
	input [5:0]opcode_i,
	
	output reg_dst_o,
	output branch_eq_o,
	output branch_ne_o,
	output mem_read_o,
	output mem_to_reg_o,
	output mem_write_o,
	output alu_src_o,
	output reg_write_o,
	output jump_signal_o,
	output [3:0]alu_op_o
);


localparam R_TYPE = 0;
localparam I_TYPE_ADDI = 6'h8;
localparam I_TYPE_ORI = 6'hd;
localparam I_TYPE_LUI = 6'hf;
localparam I_TYPE_ANDI = 6'hc;
localparam I_TYPE_LW = 6'h23;
localparam I_TYPE_SW = 6'h2b;
localparam I_TYPE_BEQ = 6'h4;
localparam I_TYPE_BNE = 6'h5;
localparam J_TYPE_JMP = 6'h2;
localparam J_TYPE_JAL = 6'h3;

reg [12:0] control_values_r;

always@(opcode_i) begin

	case(opcode_i)
		
		R_TYPE		: control_values_r = 13'b1_001_00_00_0_1111;
		I_TYPE_ADDI	: control_values_r = 13'b0_101_00_00_0_0000;
		I_TYPE_ORI	: control_values_r = 13'b0_101_00_00_0_0001;
		I_TYPE_LUI	: control_values_r = 13'b0_101_00_00_0_0010;
		I_TYPE_ANDI : control_values_r = 13'b0_101_00_00_0_0011;
		I_TYPE_LW 	: control_values_r = 12'b0_111_10_00_0_0100;
		I_TYPE_SW 	: control_values_r = 12'b0_100_01_00_0_0101;
		I_TYPE_BEQ  : control_values_r = 12'b0_100_00_01_0_0110;
		I_TYPE_BNE	: control_values_r = 12'b0_100_00_10_0_0111;
		J_TYPE_JMP	: control_values_r = 12'b0_000_00_00_1_1000;
		J_TYPE_JAL	: control_values_r = 12'b0_001_00_00_1_1001;
		
		default:
			control_values_r = 12'b00000000000;
	endcase
		
end	
	
assign reg_dst_o = control_values_r[12]; //si es rd o rt el destino (las tipo R usan rd y las tipo I usan rt)
assign alu_src_o = control_values_r[11]; //si es tipo R o tipo I
assign mem_to_reg_o = control_values_r[10];
assign reg_write_o = control_values_r[9];
assign mem_read_o = control_values_r[8];
assign mem_write_o = control_values_r[7];
assign branch_ne_o = control_values_r[6];
assign branch_eq_o = control_values_r[5];
assign jump_signal_o = control_values_r[4]; //si es una tipo J
assign alu_op_o = control_values_r[3:0];	

endmodule


