module ID_EX(
    input wire clk,
    input wire rst,
    input wire reg_dst,
    input wire reg_write,
    input wire alu_src,
    input wire mem_read,
    input wire mem_write,
    input wire pc_src,
    input wire jump,
    input wire branch,
    input wire mem_to_reg,
    input wire [1:0] alu_op,
    input wire [31:0] signextend,
    input wire [5:0] func,
    input wire [31:0] rs_data,
    input wire [31:0] rt_data,
    input wire [4:0] rd,
    input wire [4:0] rt,
    input wire [4:0] rs,

    output reg reg_dst_id_ex,
    output reg reg_write_id_ex,
    output reg alu_src_id_ex,
    output reg mem_read_id_ex,
    output reg mem_write_id_ex,
    output reg pc_src_id_ex,
    output reg jump_id_ex,
    output reg branch_id_ex,
    output reg mem_to_reg_id_ex,
    output reg [1:0] alu_op_id_ex,
    output reg [31:0] signextend_id_ex,
    output reg [5:0] func_id_ex,
    output reg [31:0] rs_data_id_ex,
    output reg [31:0] rt_data_id_ex,
    output reg [4:0] rd_id_ex,
    output reg [4:0] rt_id_ex,
    output reg [4:0] rs_id_ex
);

    always @(posedge clk or posedge rst) 
	begin
        if (rst)
		begin
            reg_dst_id_ex <= 0;
            reg_write_id_ex <= 0;
            alu_src_id_ex <= 0;
            mem_read_id_ex <= 0;
            mem_write_id_ex <= 0;
            pc_src_id_ex <= 0;
            jump_id_ex <= 0;
            branch_id_ex <= 0;
            mem_to_reg_id_ex <= 0;
            alu_op_id_ex <= 2'b00;
            signextend_id_ex <= 16'b0;
            func_id_ex <= 6'b0;
            rs_data_id_ex <= 32'b0;
            rt_data_id_ex <= 32'b0;
            rd_id_ex <= 5'b0;
            rt_id_ex <= 5'b0;
            rs_id_ex <= 5'b0;
        end 
		else //to store data
		begin
            reg_dst_id_ex <= reg_dst;
            reg_write_id_ex <= reg_write;
            alu_src_id_ex <= alu_src;
            mem_read_id_ex <= mem_read;
            mem_write_id_ex <= mem_write;
            pc_src_id_ex <= pc_src;
            jump_id_ex <= jump;
            branch_id_ex <= branch;
            mem_to_reg_id_ex <= mem_to_reg;
            alu_op_id_ex <= alu_op;
            signextend_id_ex <= signextend;
            func_id_ex <= func;
            rs_data_id_ex <= rs_data;
            rt_data_id_ex <= rt_data;
            rd_id_ex <= rd;
            rt_id_ex <= rt;
            rs_id_ex <= rs;
        end
    end

endmodule
