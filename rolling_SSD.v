`timescale 1ns/1ps
module rolling_SSD (input clk, output reg [3:0] an, output reg [6:0] seg); 
	parameter cntmax=1000;
	parameter cntmax2=32'd100000000;
	reg [9:0] cnt;
	reg [3:0] ann=4'b1110;
	reg [1:0] state=0;
	reg [31:0] cnt2;

	always @ (posedge clk)
if (cnt2==cntmax2)
begin
	cnt2<=0;
	ann<={ann[2:0],ann[3]};
	an<=ann;
end
else
begin
	if (cnt==cntmax)
	begin
		if (state==0)
		begin
			cnt<=0;
			ann<={ann[2:0],ann[3]};
			an<=ann;
			seg<=7'b0000110;
			state<=state+1;
		end
	        else if (state==1)
		begin
			cnt<=0;
			ann<={ann[2:0],ann[3]};
			an<=ann;
			seg<=7'b1000001;
			state<=state+1;
		end
		else if(state==2)
		begin
			cnt<=0;
			ann<={ann[2:0],ann[3]};
			an<=ann;
			seg<=7'b1000000;
			state<=state+1;
		end
		else if (state==3)
		begin
			cnt<=0;
			ann<={ann[2:0],ann[3]};
			an<=ann;
			seg<=7'b1000111;
			state<=0;
		end
	end
	else cnt<=cnt+1;
	cnt2<=cnt2+1;
end
endmodule
