module selector(a ,reset, clk , out);

input a,clk,reset;
output [2:0] out;
always@(posedge clk)
begin
 if(a)
	out = out + 3'b001 ;
	if(reset)
	out =  3'b000;
	if( out >= 4)
	out = 3'b000;
end
endmodule


  