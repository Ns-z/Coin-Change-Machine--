module comparator( A, B,yequal,clk, ybigger, ysmaller ,Compdone);

output  yequal;
output  ybigger;
output  ysmaller;
output Compdone;
input  [6:0] A,B;
input clk;

always@(posedge clk)
begin
if(A<0 | A == 0)
Compdone = 1'b1;
if(A>B)
ybigger = 1;
if(A==B)
yequal = 1;
if(A<B && A>0)
ysmaller =1;
end

endmodule