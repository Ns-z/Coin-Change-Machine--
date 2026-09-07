module comparator(y, A, B);

output wire [2:0] y;
input wire [6:0] A,B;


assign y[0] = A>B;
assign y[1] = (A==B);
assign y[2] = (A<B);

endmodule