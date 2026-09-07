module mux2(I0, I1, s ,clk, out);

input [6:0] I0,I1;
input s,clk;
output [6:0] out;

always@(posedge clk)
	begin
	if(!s)
	out = I0;
	else if(s)
	out = I1;
end
endmodule