module counter(clk ,rst, count ,en);

input en, clk , rst ;
output wire [2:0] count;
always@(posedge clk)
begin
if(rst)
	count = 3'b000;
	else if(en)
	 count = count + 3'b001;
	end
endmodule