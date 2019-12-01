`timescale 1ns / 1ps

module testBench(input [15:0] sw, input clk, output [15:0] led);
    logicBasics(.a(sw[0]),
                .b(sw[1]),
                .c(sw[2]),
                .d(sw[3]),
                .sel(sw[5:4]),
                .y_and(led[0]),
                .y_or(led[1]),
                .y_xor(led[2]),
                .y_mux_1(led[3]),
                .y_mux_2(led[4]),
                .y_mux_4to1(led[5])
                );
    clk_div(.clk(clk),
            .clk_div(led[6])
            );
    DFF(.clk(clk),
        .D(sw[6]),
        .Q(led[7])
        );
endmodule
      
    
    
    
    
    
    
    
    
    
    
    
    