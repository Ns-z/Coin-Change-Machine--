

module mux2_1(Y, A, B, S);

output Y;
input [6:0] A, B;
input S;
wire T1, T2, Sbar;

and (T1, B, S), (T2, A, Sbar);
not (Sbar, S);
or (Y, T1, T2);

endmodule