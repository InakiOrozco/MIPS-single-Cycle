module Forwarding_Unit
(	
	input MEM_reg_write,
	input WB_reg_write,
	input [4:0] MEM_reg_rd,
	input [4:0] WB_reg_rd,
	input [4:0] EX_reg_rt,
	input [4:0] EX_reg_rs,
	output reg [1:0] forward_A,
	output reg [1:0] forward_B
);
	
	always @ (MEM_reg_write or WB_reg_write or MEM_reg_rd or WB_reg_rd or EX_reg_rt or EX_reg_rs)begin
		forward_A = 2'b00;
		forward_B = 2'b00;
		
		//EX forward unit
		if(MEM_reg_write && (MEM_reg_rd != 0) && (MEM_reg_rd == EX_reg_rs))begin
			forward_A = 2'b10;
		end
		if(MEM_reg_write && (MEM_reg_rd != 0) && (MEM_reg_rd == EX_reg_rt))begin
			forward_B = 2'b10; 
		end
		
		//MEM forward unit
		if(WB_reg_write && (WB_reg_rd != 0) && (MEM_reg_rd != EX_reg_rs) && (WB_reg_rd == EX_reg_rs))begin
			forward_A = 2'b01;
		end
		if(WB_reg_write && (WB_reg_rd != 0) && (MEM_reg_rd != EX_reg_rt) && (WB_reg_rd == EX_reg_rt))begin
			forward_B = 2'b01;
		end
	end
endmodule 