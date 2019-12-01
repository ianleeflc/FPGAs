`timescale 1ns/1ps
module testBench_roll (input clk, output [3:0] an, output [6:0] seg);
	rolling_SSD(
		.clk(clk),
		.an(an),
		.seg(seg)	
	);

endmodule
