module topmodule(
    input wire clk,
    input wire rst,
    output wire [31:0] pc_out,
    output wire [31:0] instruction,
    output wire [5:0] opcode,
    output wire [5:0] func,
    output wire [15:0] jump_address,
    output wire [4:0] rs,
    output wire [4:0] rt,
    output wire [4:0] rd,
    output wire [31:0] signextend,
    output wire regdst,
    output wire jump,
    output wire branch,
    output wire memRead,
    output wire memToReg,
    output wire [1:0] aluOp,
    output wire memWrite,
    output wire aluSrc,
    output wire regWrite,
    output wire [31:0] rs_data,
    output wire [31:0] rt_data,
    output wire reg_dst_id_ex,
    output wire reg_write_id_ex,
    output wire alu_src_id_ex,
    output wire mem_read_id_ex,
    output wire mem_write_id_ex,
    output wire pc_src_id_ex,
    output wire jump_id_ex,
    output wire branch_id_ex,
    output wire mem_to_reg_id_ex,
    output wire [1:0] alu_op_id_ex,
    output wire [31:0] signextend_id_ex,
    output wire [5:0] func_id_ex,
    output wire [31:0] rs_data_id_ex,
    output wire [31:0] rt_data_id_ex,
    output wire [4:0] rd_id_ex,
    output wire [4:0] rt_id_ex,
    output wire [4:0] rs_id_ex,
    output wire [3:0] ALUControlOp1,
    output wire zero,
    output wire [31:0] alu_result,
    output wire [4:0] writebackreg_ex_mem,
    output wire [31:0] alu_result_ex_mem,
    output wire [31:0] signextend_ex_mem,
    output wire [31:0] rt_data_ex_mem,
    output wire mem_read_ex_mem,
    output wire mem_write_ex_mem,
    output wire mem_to_reg_ex_mem,
    output wire reg_write_ex_mem,
    output wire jump_ex_mem,
    output wire branch_ex_mem,
    output wire zero_ex_mem,
    output wire [31:0] data_out,
    output wire [4:0] writebackreg_mem_wb,
    output wire reg_write_mem_wb,
    output wire [31:0] data_towrite_mem_wb
);

//pc call
PC pc1(
    .jump_address(signextend_ex_mem), 
    .pc_out(pc_out), 
    .jump(jump_ex_mem), 
    .clk(clk), 
    .rst(rst)
);

//instruction call
Instruction_memory im1(
    .rst(rst),
    .pc_address(pc_out), 
    .instruction(instruction),
	 .clk(clk)
);
    
//if/id
IF_ID ifid1(
    .instruction(instruction), 
    .clk(clk), 
    .rst(rst), 
    .opcode(opcode), 
    .func(func), 
    .jump_address(jump_address), 
    .rs(rs), 
    .rt(rt), 
    .rd(rd), 
    .signextend(signextend)
);
    
//control unit
Control_unit cu1(
    .clk(clk),
    .rst(rst),
    .opcode(opcode),
    .regdst(regdst),
    .jump(jump),
    .branch(branch),
    .memRead(memRead),
    .memToReg(memToReg),
    .aluOp(aluOp),
    .memWrite(memWrite),
    .aluSrc(aluSrc),
    .regWrite(regWrite)
);

//RegFile
RegFile rf1(
    .rs(rs),
    .rt(rt), 
    .writebackreg(writebackreg_mem_wb), 
    .rst(rst),
    .clk(clk),
    .regwrite(reg_write_mem_wb), 
    .data_towrite_mem_wb(data_towrite_mem_wb),
    .RD1(rs_data), 
    .RD2(rt_data)
);

//id/ex reg
ID_EX id_ex1(
    .clk(clk),
    .rst(rst),
    .reg_dst(regdst),
    .reg_write(regWrite),
    .alu_src(aluSrc),
    .mem_read(memRead),
    .mem_write(memWrite),
    .pc_src(branch),
    .jump(jump),
    .branch(branch),
    .mem_to_reg(memToReg),
    .alu_op(aluOp),
    .signextend(signextend),
    .func(func),
    .rs_data(rs_data),
    .rt_data(rt_data),
    .rd(rd),
    .rt(rt),
    .rs(rs),
    .reg_dst_id_ex(reg_dst_id_ex),
    .reg_write_id_ex(reg_write_id_ex),
    .alu_src_id_ex(alu_src_id_ex),
    .mem_read_id_ex(mem_read_id_ex),
    .mem_write_id_ex(mem_write_id_ex),
    .pc_src_id_ex(pc_src_id_ex),
    .jump_id_ex(jump_id_ex),
    .branch_id_ex(branch_id_ex),
    .mem_to_reg_id_ex(mem_to_reg_id_ex),
    .alu_op_id_ex(alu_op_id_ex),
    .signextend_id_ex(signextend_id_ex),
    .func_id_ex(func_id_ex),
    .rs_data_id_ex(rs_data_id_ex),
    .rt_data_id_ex(rt_data_id_ex),
    .rd_id_ex(rd_id_ex),
    .rt_id_ex(rt_id_ex),
    .rs_id_ex(rs_id_ex)
);

//alu control
ALUControl alucu1(
    .func_id_ex(func_id_ex),
    .alu_op_id_ex(alu_op_id_ex),
    .ALUControlOp1(ALUControlOp1)
); 

//alu
ALU alu (
    .ALUSrcResult((alu_src_id_ex) ? signextend_id_ex : rt_data_id_ex),
    .readdata1(rs_data_id_ex),
    .ALUControlOp(ALUControlOp1),
    .Zero(zero),
    .ALUResult(alu_result)
);

//ex mem reg
EX_MEM ex_mem1 (
    .clk(clk), 
    .rst(rst), 
    .mem_read_id_ex(mem_read_id_ex), 
    .mem_write_id_ex(mem_write_id_ex), 
    .mem_to_reg_id_ex(mem_to_reg_id_ex), 
    .reg_dst_id_ex(reg_dst_id_ex), 
    .reg_write_id_ex(reg_write_id_ex), 
    .jump_id_ex(jump_id_ex), 
    .branch_id_ex(branch_id_ex), 
    .zero(zero), 
    .alu_result(alu_result), 
    .rt_data_id_ex(rt_data_id_ex), 
    .rt_id_ex(rt_id_ex), 
    .rd_id_ex(rd_id_ex), 
    .signextend_id_ex(signextend_id_ex), 
    .writebackreg_ex_mem(writebackreg_ex_mem), 
    .alu_result_ex_mem(alu_result_ex_mem), 
    .signextend_ex_mem(signextend_ex_mem), 
    .rt_data_ex_mem(rt_data_ex_mem), 
    .mem_read_ex_mem(mem_read_ex_mem), 
    .mem_write_ex_mem(mem_write_ex_mem), 
    .mem_to_reg_ex_mem(mem_to_reg_ex_mem), 
    .reg_write_ex_mem(reg_write_ex_mem), 
    .jump_ex_mem(jump_ex_mem), 
    .branch_ex_mem(branch_ex_mem), 
    .zero_ex_mem(zero_ex_mem)
);

//data memory
Datamem dm1 (
    .address(alu_result_ex_mem), 
    .data_in(rt_data_ex_mem), 
    .data_out(data_out), 
    .clk(clk), 
    .we(mem_write_ex_mem),
    .rst(rst),
    .mem_read_ex_mem(mem_read_ex_mem)
);

//wb reg
MEM_WB wb1 (
    .clk(clk), 
    .rst(rst), 
    .mem_to_reg_ex_mem(mem_to_reg_ex_mem), 
    .reg_write_ex_mem(reg_write_ex_mem), 
    .memdata(data_out), 
    .alu_result_ex_mem(alu_result_ex_mem), 
    .writebackreg_ex_mem(writebackreg_ex_mem), 
    .writebackreg_mem_wb(writebackreg_mem_wb), 
    .reg_write_mem_wb(reg_write_mem_wb), 
    .data_towrite_mem_wb(data_towrite_mem_wb)
);

endmodule
