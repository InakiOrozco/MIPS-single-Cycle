/******************************************************************
* Description
*	This is a register of 32-bit that corresponds to the PC counter. 
*	This register does not have an enable signal.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/

module Program_Counter
#(
	parameter N_BITS = 32
)
(
	input clk,
	input reset,
	input pc_write_i,
	input  [N_BITS-1:0] new_pc_i,
	
	output reg [N_BITS-1:0] pc_value_o
);

//clk ahora en negedge
always@(negedge reset or negedge clk) begin
	if(reset==0)
		pc_value_o <= 32'h00400000;
	else	begin
		if(pc_write_i == 0)
			pc_value_o<=new_pc_i;
	end
end

endmodule