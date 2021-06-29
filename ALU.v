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
	input [4:0] alu_operation_i,
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

localparam ADD = 5'b00000;
localparam SUB = 5'b00001;
localparam OR  = 5'b00010;
localparam ORI = 5'b00011;
localparam SRL = 5'b00100;
localparam SLL = 5'b00101;
localparam LUI = 5'b00110;
localparam ANDI = 5'b00111;
localparam LW = 5'b01000;
localparam SW = 5'b01001;
localparam BEQ = 5'b01010;
localparam BNE = 5'b01011;
localparam NOR = 5'b01100;
localparam AND = 5'b01101;
localparam JMP	 = 5'b01110;
localparam JAL	 = 5'b01111;
localparam JR	 = 5'b10000;
  
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
		  */
		  BEQ:
			if(a_i == b_i)begin		
				jump_pc_o = pc_i + {{14{imm_i[15]}},imm_i, 2'b0};
			end
		  
		  BNE:
			if(a_i != b_i)begin 	
				jump_pc_o = pc_i + {{14{imm_i[15]}}, imm_i, 2'b0};
			end
			
		  NOR: 
			alu_data_o = ~(a_i | b_i);
			
		  JMP:
			jump_pc_o = {pc_i[31:28], address_i, 2'b0};
			
		  /*JAL:
			ra
			jump_pc_o = {pc_i[31:28], address_i, 2'b0};*/
			
		  JR:
			jump_pc_o = a_i;

		default:
			alu_data_o = 0;
		endcase // case(control)
		
		zero_o = (alu_data_o == 0) ? 1'b1 : 1'b0;
		
     end // always @ (A or B or control)
	  
endmodule // ALU