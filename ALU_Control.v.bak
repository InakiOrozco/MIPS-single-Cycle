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



reg [3:0] alu_control_values_r;
wire [8:0] selector_w;

assign selector_w = {alu_op_i, alu_function_i};

always@(selector_w)begin

	casex(selector_w)
	
		R_TYPE_ADD:    alu_control_values_r = 4'b0011;


		default: alu_control_values_r = 4'b1001;
	endcase
	
end


assign alu_operation_o = alu_control_values_r;

endmodule
