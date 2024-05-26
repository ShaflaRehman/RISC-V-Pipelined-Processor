module EX_MEM(
		input clk,rst, 
		 input mem_read_id_ex,
		 mem_write_id_ex,
		 mem_to_reg_id_ex,
		 reg_dst_id_ex,
		 reg_write_id_ex,
		 jump_id_ex,
		 branch_id_ex,
		 zero,
		 input [31:0]alu_result,
		 input [31:0]rt_data_id_ex,
		 input [4:0] rt_id_ex,
		 input [4:0] rd_id_ex,
		 input [31:0] signextend_id_ex,
		 output reg[4:0] writebackreg_ex_mem,
		 output reg[31:0] alu_result_ex_mem,
		 output reg [31:0] signextend_ex_mem,
		 output reg[31:0] rt_data_ex_mem,
		 output reg mem_read_ex_mem,
		 mem_write_ex_mem,
		 mem_to_reg_ex_mem,
		 reg_write_ex_mem,
		 jump_ex_mem,
		 branch_ex_mem,
		 zero_ex_mem
    );
	
	
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			 writebackreg_ex_mem<=0;
			 alu_result_ex_mem<=0;
			 rt_data_ex_mem<=0;
			 mem_read_ex_mem<=0;
			 mem_write_ex_mem<=0;
			 mem_to_reg_ex_mem<=0;
			 reg_write_ex_mem<=0;
			 jump_ex_mem<=0;
			 branch_ex_mem<=0;
			 zero_ex_mem<=0;
			signextend_ex_mem<=0;
		end
		else 
		begin
			if(reg_dst_id_ex)
				writebackreg_ex_mem<=rd_id_ex;
			else
				writebackreg_ex_mem<=rt_id_ex;
			mem_read_ex_mem<=mem_read_id_ex;
			mem_write_ex_mem<=mem_write_id_ex;
			mem_to_reg_ex_mem<= mem_to_reg_id_ex;
			reg_write_ex_mem<=reg_write_id_ex;
			jump_ex_mem<=jump_id_ex;
			branch_ex_mem<=branch_id_ex;
			zero_ex_mem<=zero;
		   signextend_ex_mem<= signextend_id_ex;
			rt_data_ex_mem<=rt_data_id_ex;
			alu_result_ex_mem<=alu_result;
		end
	end

endmodule
