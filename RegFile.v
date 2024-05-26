module RegFile(
  input [4:0] rs,
    input [4:0] rt,
    input [4:0] writebackreg,
	 input rst,
    input regwrite,
	  input [31:0] data_towrite_mem_wb,
    input clk,
    output reg [31:0] RD1,
    output reg [31:0] RD2
	 );

    reg [31:0] memory[31:0];

integer i;
    initial 
	begin
		for (i = 0; i < 31; i = i + 1)
			begin
				memory[i] = i;
			end
    end
	
    always @(posedge clk ) begin
		
        if (regwrite) 
		begin
			memory[writebackreg]<=data_towrite_mem_wb;
        end
	 end	 
				
		
   
    always @(*) 
	begin
			if(rst)
			begin
				RD1=0;
				RD2=0;
		    end
		   else 
		   begin
				RD1 = memory[rs];
				RD2 = memory[rt];
			end		
    end

endmodule
