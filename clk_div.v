`timescale 1ns / 1ps
//clock divider
module clk_div(input clk, output reg clk_div);
    reg [31:0] cnt;
    always @ (posedge clk)
        if (cnt==32'd100000000)
            begin
                cnt<=0;
                clk_div<=~clk_div;
            end
        else
            cnt<=cnt+1;
endmodule
