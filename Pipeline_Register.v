module Pipeline_Register 
#
(
	parameter N_BITS = 32
)
(	
	input clk,
	input reset,
	input enable,
	input flush,
	input [N_BITS-1:0] dataIn,
	output reg [N_BITS-1:0] dataOut
);

always @ (negedge clk) begin
	if(reset==0 || flush)
		dataOut <= 0;
	else if (enable == 0)
		dataOut <= dataIn;
end
	  
endmodule 
