module Hazard_Unit
(	
	input EX_mem_read_i,
	input [4:0] ID_reg_rs_i,
	input [4:0] ID_reg_rt_i,
	input [4:0] EX_reg_rt_i,
	/*
	input MEM_branch_i,
	input MEM_jump_i,
	input MEM_jr_i,
		
	output reg IF_ID_flush_o,
	output reg ID_EX_flush_o,
	output reg EX_MEM_flush_o
	*/
	output reg pc_write_o,
	output reg IF_ID_write_o,
	output reg stall_o
);

	always @ (EX_mem_read_i or EX_reg_rt_i or ID_reg_rt_i or ID_reg_rs_i)begin
		pc_write_o = 1'b0;
		IF_ID_write_o = 1'b0;
		stall_o = 1'b0;
		if (EX_mem_read_i &&((EX_reg_rt_i == ID_reg_rs_i) || (EX_reg_rt_i == ID_reg_rt_i)))begin
			pc_write_o = 1'b1;
			IF_ID_write_o = 1'b1;
			stall_o = 1'b1;
		end
		/*
		if (MEM_jump_i || MEM_jr_i || MEM_branch_i)begin
			IF_ID_flush_o = 1'b1;
			ID_EX_flush_o = 1'b1;
			EX_MEM_flush_o = 1'b1;
		end*/
	end

endmodule 