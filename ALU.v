module ALU (
    input [31:0] ALUSrcResult,
    input [31:0] readdata1,
    input [3:0] ALUControlOp,
    output Zero,
    output [31:0] ALUResult
);
    reg [31:0] result;

    always @* begin
        case (ALUControlOp)
            // Branch equal: Subtract
            4'b0110: result = readdata1 - ALUSrcResult;
            // R-type Add: Add
            4'b0010: result = readdata1 + ALUSrcResult;
            // R-type AND: AND
            4'b0000: result = readdata1 & ALUSrcResult;
            // R-type OR: OR
            4'b0001: result = readdata1 | ALUSrcResult;
            // R-type Set on less than: SLT
            4'b0111: result = (readdata1 < ALUSrcResult) ? 32'b1 : 32'b0;
            // Load word: Add base address and offset
            default: result = 32'b0; // Default to 0 for unsupported operations
        endcase
    end

    assign Zero = (result == 32'b0); // Output zero flag
    assign ALUResult = result; // Output ALU result

endmodule
