module Multiplexer_3_to_1
#(
	parameter N_BITS=32
)
(
	input [1:0] selector_i,
	input [N_BITS-1:0] data_0_i,
	input [N_BITS-1:0] data_1_i,
	input [N_BITS-1:0] data_2_i,
	
	output reg [N_BITS-1:0] mux_o

);

	always@(selector_i, data_2_i, data_1_i, data_0_i) begin
		case(selector_i)
			2'b00: mux_o = data_0_i;
			2'b01: mux_o = data_1_i;
			2'b10: mux_o = data_2_i;
			default mux_o = 0;
		endcase
	end

endmodule