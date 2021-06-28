/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add
*		sub
*		or
*		and
*		nor
* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/

module ALU 
(
	input [3:0] alu_operation_i,
	input [31:0] a_i,
	input [31:0] b_i,
	input [4:0] shamt_i,
	input [15:0] imm_i,
	input [25:0] address_i,
	input [31:0] pc_i,

	output reg [31:0]jump_pc_o,
	output reg zero_o,
	output reg [31:0] alu_data_o
);

localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam OR  = 4'b0010;
localparam ORI = 4'b0011;
localparam SRL = 4'b0100;
localparam SLL = 4'b0101;
localparam LUI = 4'b0110;
localparam ANDI = 4'b0111;
localparam LW = 4'b1000;
localparam SW = 4'b1001;
localparam BEQ = 4'b1010;
localparam BNE = 4'b1011;
localparam NOR = 4'b1100;
localparam AND = 4'b1101;
localparam JMP	 = 4'b1110;
localparam JAL	 = 4'b1111;
   
   always @ (a_i or b_i or alu_operation_i or shamt_i or imm_i or pc_i or address_i)
     begin
		case (alu_operation_i)
		
		  ADD: // add
			alu_data_o = a_i + b_i;
		  
		  OR:
			alu_data_o = a_i | b_i;
			
		  ORI:
			alu_data_o = a_i | {16'b0, imm_i};
		  
		  SUB: 
			alu_data_o = a_i - b_i;
		  
		  SLL:
			alu_data_o = b_i << shamt_i;
		  		  
		  SRL:
			alu_data_o = b_i >> shamt_i;
		  
		  LUI:
			alu_data_o = {imm_i, 16'b0};
			
		  AND:
			alu_data_o = a_i & b_i;		  
			
		  ANDI: 
			alu_data_o = a_i & {16'b0, imm_i};
		  
/*		  LW:
		 //alu_data_o = M[a_i + b_i]
			alu_data_o = a_i;
		  
		  SW:
			//M[a_i + b_i] = alu_data_o
			alu_data_o = a_i;
		  
		  BEQ:
			
		  	alu_data_o = a_i;

		  BNE:
			alu_data_o = a_i;
*/			
		  NOR: 
			alu_data_o = ~(a_i | b_i);
			
		  JMP:
			jump_pc_o = {pc_i[31:28], address_i, 2'b0};

		default:
			alu_data_o = 0;
		endcase // case(control)
		
		zero_o = (alu_data_o == 0) ? 1'b1 : 1'b0;
		
     end // always @ (A or B or control)
	  
endmodule // ALU