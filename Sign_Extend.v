/******************************************************************
* Description
*	This module performes a sign-extend operation that is need with
*	in instruction like andi or ben.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	05/07/2020
******************************************************************/
module Sign_Extend
(   
	input [15:0]  data_i,
   output[31:0] sign_extend_o
);

assign  sign_extend_o = {{16{data_i[15]}},data_i[15:0]};

endmodule // signExtend
