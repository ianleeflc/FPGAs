`timescale 1ns/1ps
// Display four zero's on the board
module SSD (input clk, input [3:0] digit,  output reg [6:0] seg);
	always @ (posedge clk)
		case (digit)
			0: seg<=7'b1000000; //gfedcba
		endcase
endmodule
