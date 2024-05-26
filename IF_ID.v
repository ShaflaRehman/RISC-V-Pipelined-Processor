module IF_ID(
    input wire [31:0] instruction,
    input wire clk,
    input wire rst,

    output reg [5:0] opcode,
    output reg [5:0] func,
    output reg [15:0] jump_address,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [31:0] signextend
);

    always @(posedge clk or posedge rst)
	begin
        if (rst) 
		begin
            opcode <= 6'b0;
            func <= 6'b0;
            jump_address <= 16'b0;
            rs <= 5'b0;
            rt <= 5'b0;
            rd <= 5'b0;
            signextend <= 32'b0;
        end
		else
		begin
            opcode <= instruction[31:26];
            func <= instruction[5:0];
            jump_address <= instruction[15:0];
			
            rs <= instruction[25:21];
            rt <= instruction[20:16];
            rd <= instruction[15:11];
			
            signextend <= {{16{instruction[15]}}, instruction[15:0]};
        end
    end

endmodule
