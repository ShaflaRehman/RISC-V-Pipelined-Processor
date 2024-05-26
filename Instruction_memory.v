module Instruction_memory(
    input rst,
    input [31:0] pc_address,
    output reg [31:0] instruction,
	 input clk
);

    reg [31:0] mem [31:0];

          integer i;

    initial begin
        mem[0] = 32'b000001_00001_00000_00000_00000_000001; // Addi $2, $1, 0
mem[1] = 32'b000001_00001_00000_00000_00000_000010; // Addi $3, $1, 2
mem[2] = 32'b000001_00011_00000_00011_00000_000000; // Addi $3, $3, 0
mem[3] = 32'b000001_00001_00011_00011_00000_000000; // Addi $3, $1, 0
mem[4] = 32'b100011_00001_00000_00000_00000_000001; // lw $3, 1($1)
mem[5] = 32'b000001_00001_00000_00111_00000_000000; // Addi $7, $1, 0
mem[6] = 32'b101011_00000_01000_00000_00000_000001; // sw $0, 1($8)
mem[7] = 32'b000010_00000_00000_00000_00000_001000; // Jump to address 8
mem[8] = 32'b000100_00010_00011_11111_11111_111110; // Beq $2, $3, -2
mem[9] = 32'b000101_00011_00010_11111_11111_111110; // Bne $3, $2, -2
mem[10] = 32'b000000_00010_00011_00001_00000_100000; // Add $1, $2, $3
mem[11] = 32'b000000_00010_00011_00001_00000_100010; // Sub $1, $2, $3
mem[12] = 32'b000000_00010_00011_00001_00000_100100; // And $1, $2, $3
mem[13] = 32'b000000_00010_00011_00001_00000_100101; // Or $1, $2, $3
mem[14] = 32'b000000_00010_00011_00001_00000_101010; // Slt $1, $2, $3
        
        for (i = 7; i < 32; i = i + 1) 
		begin
            mem[i] = 32'b0;
        end
    end

    always @(posedge clk) 
	begin
        if (rst) 
		begin
            instruction <= 32'b0;
        end 
		else
		begin
            instruction <= mem[pc_address];
        end
    end

endmodule