/******************************************************************
* Description
*	This is the data memory for the MIPS processor
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/

module Data_Memory 
#(	parameter DATA_WIDTH=8,
	parameter MEMORY_DEPTH = 1024

)
(
	input [DATA_WIDTH-1:0] write_data_i,
	input [DATA_WIDTH-1:0]  address_i,
	input mem_write_i,mem_read_i, clk,
	output  [DATA_WIDTH-1:0]  data_o
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[MEMORY_DEPTH-1:0];
	wire [DATA_WIDTH-1:0] read_data_aux;

	always @ (posedge clk)
	begin
		// Write
		if (mem_write_i)
			ram[address_i] <= write_data_i;
	end
	assign read_data_aux = ram[address_i];
  	assign data_o = {DATA_WIDTH{mem_read_i}}& read_data_aux;

endmodule
