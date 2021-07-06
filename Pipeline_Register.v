module Pipeline_Register 
#
(
	parameter N_BITS = 32
)
(	
	input clk,
	input reset,
	input [N_BITS-1:0] dataIn,
	output reg [N_BITS-1:0] dataOut
);

always @ (negedge clk) begin
	if(reset==0)
		dataOut <= 0;
	else
		dataOut <= dataIn;
end
	  
endmodule 
