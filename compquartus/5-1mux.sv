module mux5(I0, I1, I2, I3, I4,clk, sel, out);

input  [6:0] I0, I1, I2, I3, I4;
input  [2:0] sel;
input clk;
output [6:0] out;

always @(posedge clk)
begin
	if(sel == 3'b000)
		out = I0;
	else if(sel == 3'b001)
		out = I1;
	else if(sel == 3'b010)
	   out = I2;
	else if(sel == 3'b011)
		 out = I3;
	else if(sel == 3'b100)
		 out = I4;
	
	end
	endmodule
	