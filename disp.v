`timescale 1ns/1ps
module disp(input clk, input [3:0] digit, output reg [6:0] seg, output reg [3:0] an);
     parameter cntmax=32'd1000000;
     reg [31:0] cnt;
     reg [3:0] ann=4'b1101;
     always @ (posedge clk)
        if ((cnt==cntmax) & (ann[1]==0) & digit[3]==1)
        begin
            an<=ann;
            cnt<=0;
            seg<=7'b0111111;
            ann<={ann[3], ann[2], ann[0], ann[1]};
            an<=ann;
        end
        else if ((cnt==cntmax) & (ann[1]==0) & digit[3]==0)   
        begin
            cnt<=0;
            seg<=7'b1111111;
            ann<={ann[3], ann[2], ann[0], ann[1]};
            an<=ann;          
        end
        else if ((cnt==cntmax) & (ann[0]==0))
        begin
            an<=ann;
            cnt<=0;
            case (digit)
              7'b0000: seg=7'b1000000; //0
              7'b0001: seg=7'b1111001; //1   
              7'b0010: seg=7'b0100100; //2
              7'b0011: seg=7'b0110000; //3
              7'b0100: seg=7'b0011001; //4      
              7'b0101: seg=7'b0010010; //5
              7'b0110: seg=7'b0000010; //6
              7'b0111: seg=7'b1111000; //7     
              7'b1000: seg=7'b0000000; //-8
              7'b1001: seg=7'b1111000; //-7
              7'b1010: seg=7'b0000010; //-6      
              7'b1011: seg=7'b0010010; //-5
              7'b1100: seg=7'b0011001; //-4
              7'b1101: seg=7'b0110000; //-3      
              7'b1110: seg=7'b0100100; //-2
              7'b1111: seg=7'b1111001; //-1
           endcase
            ann<={ann[3], ann[2], ann[0], ann[1]};
            an<=ann;
        end  
        else cnt<=cnt+1; 
 endmodule
