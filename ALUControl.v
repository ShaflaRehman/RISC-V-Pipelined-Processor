module ALUControl(
    input [5:0] func_id_ex,
    input [1:0] alu_op_id_ex,
    output reg [3:0] ALUControlOp1
);

    always @(*) begin
        case (alu_op_id_ex)
            2'b00: ALUControlOp1 = 4'b0010; // LW, SW: Add
            2'b01: ALUControlOp1 = 4'b0110; // BEQ: Subtract
            2'b10: begin // R-type instructions
                case (func_id_ex)
                    6'b100000: ALUControlOp1 = 4'b0010; // ADD
                    6'b100010: ALUControlOp1 = 4'b0110; // SUB
                    6'b100100: ALUControlOp1 = 4'b0000; // AND
                    6'b100101: ALUControlOp1 = 4'b0001; // OR
                    6'b101010: ALUControlOp1 = 4'b0111; // SLT
                    default: ALUControlOp1 = 4'b0000; // Default
                endcase
            end
            default: ALUControlOp1 = 4'b0000; // Default to 0 for unsupported ALU operation
        endcase
    end
endmodule
