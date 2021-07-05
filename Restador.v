/******************************************************************
* Description
*	This is a  an adder that can be parameterized in its bit-width.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/

module Restador
#
(
	parameter N_BITS = 32
)
(
	input [N_BITS-1:0]data_i,
	output [N_BITS-1:0] result_o
);

assign result_o = data_i - 32'h10010000;

endmodule
