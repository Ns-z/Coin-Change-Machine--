module counter(clk ,rst, count ,y);

input y, clk , rst ;
output wire [2:0] count;
always@(posedge clk)
begin
if(rst)
	count = 3'b000;
	else if(y)
	assign count = count + 3'b001;

	end
endmodule