module comparator( A, B,yequal, ybigger, ysmaller );

output  yequal;
output  ybigger;
output  ysmaller;
input wire [6:0] A,B;


assign ybigger = A>B;
assign yequal = (A==B);
assign ysmaller = (A<B);

endmodule
	