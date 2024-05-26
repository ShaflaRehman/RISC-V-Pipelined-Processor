module PC(
    input wire [31:0] jump_address,
    output reg [31:0] pc_out,
    input wire jump,
    input wire clk,
    input wire rst
);

    reg [31:0] pc_reg;

    always @(posedge clk or posedge rst)
	begin
        if (rst)
		begin
            pc_reg <= 32'b0;
        end 
		else
		begin
			if (jump)
			begin
				pc_reg <= jump_address;
			end 
			else
			begin
				pc_reg <= pc_reg + 1;
			end
		end
    end

    always@(*)
	 pc_out = pc_reg;

endmodule
