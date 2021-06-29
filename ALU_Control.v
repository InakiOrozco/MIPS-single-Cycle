/******************************************************************
* Description
*	This is the control unit for the ALU. It receves an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/
module ALU_Control
(
	input [3:0] alu_op_i,
	input [5:0] alu_function_i,
	
	output [4:0] alu_operation_o

);


localparam R_TYPE_ADD    = 10'b1111_100000;
localparam I_TYPE_ADDI	 = 10'b0000_xxxxxx;
localparam R_TYPE_OR     = 10'b1111_100101;
localparam R_TYPE_SUB	 = 10'b1111_100010;
localparam I_TYPE_ORI	 = 10'b0001_xxxxxx;
localparam R_TYPE_SRL	 = 10'b1111_000010;
localparam R_TYPE_SLL	 = 10'b1111_000000;
localparam I_TYPE_LUI 	 = 10'b0010_xxxxxx;
localparam I_TYPE_ANDI 	 = 10'b0011_xxxxxx;
localparam I_TYPE_LW 	 = 10'b0100_xxxxxx;
localparam I_TYPE_SW 	 = 10'b0101_xxxxxx;
localparam I_TYPE_BEQ 	 = 10'b0110_xxxxxx;
localparam I_TYPE_BNE 	 = 10'b0111_xxxxxx;
localparam R_TYPE_NOR	 = 10'b1111_100111;
localparam R_TYPE_AND	 = 10'b1111_100100;
localparam J_TYPE_JMP	 = 10'b1000_xxxxxx;
localparam J_TYPE_JAL	 = 10'b1001_xxxxxx;


reg [4:0] alu_control_values_r;
wire [9:0] selector_w;

assign selector_w = {alu_op_i, alu_function_i};

always@(selector_w)begin

	casex(selector_w)
	
		R_TYPE_ADD:    alu_control_values_r = 5'b00000;
		I_TYPE_ADDI: 	alu_control_values_r = 5'b00000;
		R_TYPE_SUB:		alu_control_values_r = 5'b00001;
		R_TYPE_OR:		alu_control_values_r = 5'b00010;
		I_TYPE_ORI: 	alu_control_values_r = 5'b00011;
		R_TYPE_SRL: 	alu_control_values_r = 5'b00100;
		R_TYPE_SLL: 	alu_control_values_r = 5'b00101;
		I_TYPE_LUI: 	alu_control_values_r = 5'b00110;
		I_TYPE_ANDI: 	alu_control_values_r = 5'b00111;
		I_TYPE_LW: 		alu_control_values_r = 5'b01000;
		I_TYPE_SW: 		alu_control_values_r = 5'b01001;
		I_TYPE_BEQ: 	alu_control_values_r = 5'b01010;
		I_TYPE_BNE: 	alu_control_values_r = 5'b01011;
		R_TYPE_NOR:		alu_control_values_r = 5'b01100;
		R_TYPE_AND:		alu_control_values_r = 5'b01101;
		J_TYPE_JMP:		alu_control_values_r = 5'b01110;	
		J_TYPE_JAL:		alu_control_values_r = 5'b01111;
		
		default: alu_control_values_r = 5'b11111;
	endcase
	
end


assign alu_operation_o = alu_control_values_r;

endmodule