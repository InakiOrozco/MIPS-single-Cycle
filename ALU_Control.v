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
	input [2:0] alu_op_i,
	input [5:0] alu_function_i,
	
	output [3:0] alu_operation_o

);


localparam R_TYPE_ADD    = 9'b111_100000;
localparam I_TYPE_ADDI	 = 9'b000_xxxxxx;
localparam R_TYPE_OR     = 9'b111_100101;
localparam R_TYPE_SUB	 = 9'b111_100010;
localparam I_TYPE_ORI	 = 9'b001_xxxxxx;
localparam R_TYPE_SRL	 = 9'b111_000010;
localparam R_TYPE_SLL	 = 9'b111_000000;
localparam I_TYPE_LUI 	 = 9'b010_xxxxxx;
localparam I_TYPE_ANDI 	 = 9'b011_xxxxxx;
localparam I_TYPE_LW 	 = 9'b100_xxxxxx;
localparam I_TYPE_SW 	 = 9'b101_xxxxxx;
//localparam I_TYPE_BEQ 	 = 9'b111_xxxxxx;
//localparam I_TYPE_BNE 	 = 9'b111_xxxxxx;
localparam R_TYPE_NOR	 = 9'b111_100111;
localparam R_TYPE_AND	 = 9'b111_100100;


reg [3:0] alu_control_values_r;
wire [8:0] selector_w;

assign selector_w = {alu_op_i, alu_function_i};

always@(selector_w)begin

	casex(selector_w)
	
		R_TYPE_ADD:    alu_control_values_r = 4'b0000;
		I_TYPE_ADDI: 	alu_control_values_r = 4'b0000;
		R_TYPE_SUB:		alu_control_values_r = 4'b0001;
		R_TYPE_OR:		alu_control_values_r = 4'b0010;
		I_TYPE_ORI: 	alu_control_values_r = 4'b0011;
		R_TYPE_SRL: 	alu_control_values_r = 4'b0100;
		R_TYPE_SLL: 	alu_control_values_r = 4'b0101;
		I_TYPE_LUI: 	alu_control_values_r = 4'b0110;
		I_TYPE_ANDI: 	alu_control_values_r = 4'b0111;
		I_TYPE_LW: 		alu_control_values_r = 4'b1000;
		I_TYPE_SW: 		alu_control_values_r = 4'b1001;
//		I_TYPE_BEQ: 	alu_control_values_r = 4'b1010;
//		I_TYPE_BNE: 	alu_control_values_r = 4'b1011;
		R_TYPE_NOR:		alu_control_values_r = 4'b1100;
		R_TYPE_AND:		alu_control_values_r = 4'b1101;
		
		default: alu_control_values_r = 4'b1111;
	endcase
	
end


assign alu_operation_o = alu_control_values_r;

endmodule
