module clock_divider(
	input wire clk_in, 
	output reg clk_out
);
reg [20:0] counter = 0;
// 100 MHz input
// slow clock (~1 Hz)
always @(posedge clk_in) 
	begin 
		counter <= counter + 1;
		clk_out <= counter[20];
	end 
endmodule
// toggle every ~67 million cycles
