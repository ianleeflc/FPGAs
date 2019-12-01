`timescale 1ns/1ps
module testBench_addsub (
	input clk,
	input [15:0] sw,
	output [15:0] led,
	output [3:0] an,
	output [6:0] seg
);
wire [6:0] dtod;
	addsub u1 (
		.clk(clk),
		.A(sw[2:0]),
		.B(sw[5:3]),
		.cm1(sw[15]),
		.S(led[2:0]),
		.c2final(led[3]),
		.OV(led[4]),
		.digit(dtod)
	);	
	disp u2(
	   .clk(clk),
	   .an(an),
	   .digit(dtod),
       .seg(seg)
	);	
endmodule

