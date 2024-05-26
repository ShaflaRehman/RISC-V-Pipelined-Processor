module MEM_WB( 
    input clk,
    input rst,
    input mem_to_reg_ex_mem,
    input reg_write_ex_mem,
    input [31:0] memdata,
    input [31:0] alu_result_ex_mem,
    input [4:0] writebackreg_ex_mem,
    output reg [4:0] writebackreg_mem_wb,
    output reg reg_write_mem_wb,
    output reg [31:0] data_towrite_mem_wb
);

    always @(posedge clk or posedge rst) 
    begin
        if (rst) 
        begin
            writebackreg_mem_wb <= 5'b0;
            reg_write_mem_wb <= 0;
            data_towrite_mem_wb <= 32'b0;
        end
        else 
        begin
            writebackreg_mem_wb <= writebackreg_ex_mem;
            reg_write_mem_wb <= reg_write_ex_mem;
            data_towrite_mem_wb <= mem_to_reg_ex_mem ? memdata : alu_result_ex_mem;
        end
    end

endmodule
