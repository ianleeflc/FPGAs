`timescale 1ns / 1ps

// 2-input AND gate
module Gates(input a, b, output y);
    assign y=a&b;
endmodule

`timescale 1ns / 1ps
module TestBench();
    reg a,b;
    wire y;
    Gates dut (a,b,y);
    initial begin
    a=0;b=0; #10;
    a=1;b=1; #10;
    end
endmodule
