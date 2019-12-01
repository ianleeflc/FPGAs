`timescale 1ns / 1ps

module DFF(input clk, D, output reg Q);
    always @ (posedge clk)
        Q<=D;
endmodule
