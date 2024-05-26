module Control_unit(
    input clk,
    input rst,
    input [5:0] opcode,
	 
    output regdst,
    output jump,
    output branch,
    output memRead,
    output memToReg,
    output [1:0] aluOp,
    output memWrite,
    output aluSrc,
    output regWrite
);

	 reg RegDst;
    reg Jump;
    reg Branch;
    reg MemRead;
    reg MemToReg;
    reg MemWrite;
    reg ALUSrc;
    reg RegWrite;
	 reg [1:0] ALUOp;
	 
    always @* begin
        if (rst) 
		begin
            RegDst <= 0;
            Jump <= 0;
            Branch <= 0;
            MemRead <= 0;
            MemToReg <= 0;
            ALUOp <= 2'b00;
            MemWrite <= 0;
            ALUSrc <= 0;
            RegWrite <= 0;
        end 
		else
		begin
            case (opcode)
                6'b000000:
				begin // R-type instructions
                    RegDst <= 1;
                    Jump <= 0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemToReg <= 0;
                    ALUOp <= 2'b10;
                    MemWrite <= 0;
                    ALUSrc <= 0;
                    RegWrite <= 1;
                end
                6'b100011:
				begin // LW
                    RegDst <= 0;
                    Jump <= 0;
                    Branch <= 0;
                    MemRead <= 1;
                    MemToReg <= 1;
                    ALUOp <= 2'b00;
                    MemWrite <= 0;
                    ALUSrc <= 1;
                    RegWrite <= 1;
                end
                6'b101011: 
				begin // SW
                    RegDst <= 1'b0;
                    Jump <= 0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemToReg <= 1'b0;
                    ALUOp <= 2'b00;
                    MemWrite <= 1;
                    ALUSrc <= 1;
                    RegWrite <= 0;
                end
                6'b000100, 6'b000101:
				begin // BEQ, BNE
                    RegDst <= 1'b0;
                    Jump <= 0;
                    Branch <= 1;
                    MemRead <= 0;
                    MemToReg <= 1'b0;
                    ALUOp <= 2'b01;
                    MemWrite <= 0;
                    ALUSrc <= 0;
                    RegWrite <= 0;
                end
                6'b000010:
				begin // Jump
                    RegDst <= 1'b0;
                    Jump <= 1;
                    Branch <= 0;
                    MemRead <= 0;
                    MemToReg <= 1'b0;
                    ALUOp <= 2'b00;
                    MemWrite <= 0;
                    ALUSrc <= 1'bx;
                    RegWrite <= 0;
                end
					   6'b000001:
				begin //aDDI
                    RegDst <= 1'b0;
                    Jump <= 0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemToReg <= 1'b0;
                    ALUOp <= 2'b00;
                    MemWrite <= 0;
                    ALUSrc <= 1'b1;
                    RegWrite <= 1'b1;
                end
                default:
				begin // Other instructions
                    RegDst <= 1'b0;
                    Jump <= 0;
                    Branch <= 0;
                    MemRead <= 0;
                    MemToReg <= 1'b0;
                    ALUOp <= 2'b00;
                    MemWrite <= 0;
                    ALUSrc <= 1'b0;
                    RegWrite <= 0;
                end
            endcase
        end
    end
	 
	 assign regdst=RegDst;
    assign jump=Jump;
    assign branch = Branch;
    assign memRead = MemRead;
    assign memToReg= MemToReg;
    assign aluOp = ALUOp;
    assign memWrite=MemWrite;
    assign aluSrc= ALUSrc;
    assign regWrite = RegWrite;

endmodule
