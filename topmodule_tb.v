module testbench();
    reg clk;
    reg rst;

    wire [31:0] pc_out;
    wire [31:0] instruction;
    wire [5:0] opcode;
    wire [5:0] func;
    wire [15:0] jump_address;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [31:0] signextend;
    wire regdst;
    wire jump;
    wire branch;
    wire memRead;
    wire memToReg;
    wire [1:0] aluOp;
    wire memWrite;
    wire aluSrc;
    wire regWrite;
    wire [31:0] rs_data;
    wire [31:0] rt_data;
    wire reg_dst_id_ex;
    wire reg_write_id_ex;
    wire alu_src_id_ex;
    wire mem_read_id_ex;
    wire mem_write_id_ex;
    wire pc_src_id_ex;
    wire jump_id_ex;
    wire branch_id_ex;
    wire mem_to_reg_id_ex;
    wire [1:0] alu_op_id_ex;
    wire [31:0] signextend_id_ex;
    wire [5:0] func_id_ex;
    wire [31:0] rs_data_id_ex;
    wire [31:0] rt_data_id_ex;
    wire [4:0] rd_id_ex;
    wire [4:0] rt_id_ex;
    wire [4:0] rs_id_ex;
    wire [3:0] ALUControlOp1;
    wire zero;
    wire [31:0] alu_result;
    wire [4:0] writebackreg_ex_mem;
    wire [31:0] alu_result_ex_mem;
    wire [31:0] signextend_ex_mem;
    wire [31:0] rt_data_ex_mem;
    wire mem_read_ex_mem;
    wire mem_write_ex_mem;
    wire mem_to_reg_ex_mem;
    wire reg_write_ex_mem;
    wire jump_ex_mem;
    wire branch_ex_mem;
    wire zero_ex_mem;
    wire [31:0] data_out;
    wire [4:0] writebackreg_mem_wb;
    wire reg_write_mem_wb;
    wire [31:0] data_towrite_mem_wb;

    topmodule uut (
        .clk(clk),
        .rst(rst),
        .pc_out(pc_out),
        .instruction(instruction),
        .opcode(opcode),
        .func(func),
        .jump_address(jump_address),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .signextend(signextend),
        .regdst(regdst),
        .jump(jump),
        .branch(branch),
        .memRead(memRead),
        .memToReg(memToReg),
        .aluOp(aluOp),
        .memWrite(memWrite),
        .aluSrc(aluSrc),
        .regWrite(regWrite),
        .rs_data(rs_data),
        .rt_data(rt_data),
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
        .rs_id_ex(rs_id_ex),
        .ALUControlOp1(ALUControlOp1),
        .zero(zero),
        .alu_result(alu_result),
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
        .zero_ex_mem(zero_ex_mem),
        .data_out(data_out),
        .writebackreg_mem_wb(writebackreg_mem_wb),
        .reg_write_mem_wb(reg_write_mem_wb),
        .data_towrite_mem_wb(data_towrite_mem_wb)
    );

    initial begin
        // Initialize clock and reset
        clk = 0;
        rst = 1;
        #5 rst = 0;

        // Generate clock signal
        forever #5 clk = ~clk;
    end


endmodule