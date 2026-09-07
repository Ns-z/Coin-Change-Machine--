module mux5(I0, I1, I2, I3, I4, sel, out);

input wire [6:0] I0, I1, I2, I3, I4;
input wire [2:0] sel;
output wire  out;

always @(*)
begin
	if(sel == 3'b000)
	assign	out = I0;
	else if(sel == 3'b001)
	assign	out = I1;
	else if(sel == 3'b010)
	 assign  out = I2;
	else if(sel == 3'b011)
		assign out = I3;
	else if(sel == 3'b100)
		assign out = I4;
	
	end
	endmodule
	