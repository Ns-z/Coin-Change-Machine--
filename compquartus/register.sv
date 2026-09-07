module register(clk , in , out  ,en ,reset);

input clk;
input [6:0] in;
input en ,reset;
output [6:0] out;

 always_ff@(posedge clk)
	begin
	if(reset)
		out <=7'b0000000;
	if(en)
		out <= in;
	else
		out <= 7'b0000000;
end 
endmodule
