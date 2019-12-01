`timescale 1ns / 1ps

module logicBasics(input a, b, c, d, [1:0] sel,
                   output y_and, y_or, y_xor, 
                   y_mux_1, y_mux_2, y_mux_4to1);
                   
    assign y_and=a&&b, y_or=a||b, y_xor=a^b; // gates
    assign y_mux_1=(~sel[0]&&a) || (sel[0]&&b); // 2:1 mux
    assign y_mux_2=sel[0]?b:a; //sel==1 pick up a, otherwise pick b
    assign y_mux_4to1=sel[1]?(sel[0]?d:c):(sel[0]?b:a); // 4:1 mux
    
endmodule
