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
	output [2:0]alu_op_o
);


localparam R_TYPE = 0;



reg [10:0] control_values_r;

always@(opcode_i) begin

	case(opcode_i)
	
		R_TYPE     :  control_values_r = 11'b1_001_00_00_111;


		default:
			control_values_r = 11'b0000000000;
	endcase
		
end	
	
assign reg_dst_o = control_values_r[10];
assign alu_src_o = control_values_r[9];
assign mem_to_reg_o = control_values_r[8];
assign reg_write_o = control_values_r[7];
assign mem_read_o = control_values_r[6];
assign mem_write_o = control_values_r[5];
assign branch_ne_o = control_values_r[4];
assign branch_eq_o = control_values_r[3];
assign alu_op_o = control_values_r[2:0];	

endmodule


