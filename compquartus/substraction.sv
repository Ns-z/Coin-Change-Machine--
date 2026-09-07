module substracker(A,B,control, sum, done, true, dispense_50s,  dispense_25s, dispense_10s,  dispense_5s, dispense_1s);
input [6:0]A,B;
input control;

output true;
output done;
output dispense_50s;
output dispense_25s;
output dispense_10s;
output dispense_5s;
output dispense_1s;
output [6:0]sum;
always@(*)	
begin

	if(control)
		sum = A-B;
		true = (1 & sum);
	if( sum > 25 & sum < 50 & A > 50)
		dispense_50s = 1'b1;
	else
		dispense_50s = 1'b0;
	if( sum > 10 & sum < 25 & A > 25)
		dispense_25s = 1'b1;
	else
		dispense_25s = 1'b0;
	if(sum > 5 &  sum < 10 & A > 10)
		dispense_10s = 1'b1;
	else 
		dispense_10s = 1'b0;
	if(sum > 1 & sum < 5 & A >5)
		dispense_5s = 1'b1;
	else
	 dispense_5s = 1'b0;
	  if( sum<5 & (A != 0) & (sum != 0) & (A > 0))
		 dispense_1s = 1'b1;
	else
	dispense_1s = 1'b0;
	if(sum == 0)
		 done <= 1'b1;
		end
		

endmodule
