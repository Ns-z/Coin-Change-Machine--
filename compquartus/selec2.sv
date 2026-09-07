module selec2(clk ,a ,reset ,out);

input clk, reset;
input a;
output out;
always@(posedge clk)
begin
	if(reset)
	  out <=0;
	else if (a)
 	  out <=1;
end
endmodule