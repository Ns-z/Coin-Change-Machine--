// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
// CREATED		"Sun May 29 13:49:36 2022"

module comparatorwork(
	reset,
	clk,
	A,
	I1_25,
	I2_10,
	I3_5,
	I4_1,
	IO_50,
	done,
	s_10out,
	s_1out,
	s_25out,
	s_50out,
	s_5out
);


input wire	reset;
input wire	clk;
input wire	[6:0] A;
input wire	[6:0] I1_25;
input wire	[6:0] I2_10;
input wire	[6:0] I3_5;
input wire	[6:0] I4_1;
input wire	[6:0] IO_50;
output wire	done;
output wire	[2:0] s_10out;
output wire	[2:0] s_1out;
output wire	[2:0] s_25out;
output wire	[2:0] s_50out;
output wire	[2:0] s_5out;

wire	[2:0] 10s_out;
wire	[2:0] 1s_out;
wire	[2:0] 25s_out;
wire	[2:0] 50s_out;
wire	[2:0] 5s_out;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[6:0] SYNTHESIZED_WIRE_19;
wire	[6:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_21;
wire	[6:0] SYNTHESIZED_WIRE_14;
wire	[2:0] SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	[6:0] SYNTHESIZED_WIRE_18;





counter	b2v_10s(
	.clk(clk),
	.rst(reset),
	.en(SYNTHESIZED_WIRE_0),
	.count(10s_out));


counter	b2v_1s(
	.clk(clk),
	.rst(reset),
	.en(SYNTHESIZED_WIRE_1),
	.count(1s_out));


counter	b2v_25s(
	.clk(clk),
	.rst(reset),
	.en(SYNTHESIZED_WIRE_2),
	.count(25s_out));


counter	b2v_50s(
	.clk(clk),
	.rst(reset),
	.en(SYNTHESIZED_WIRE_3),
	.count(50s_out));


counter	b2v_5s(
	.clk(clk),
	.rst(reset),
	.en(SYNTHESIZED_WIRE_4),
	.count(5s_out));


comparator	b2v_compar(
	.clk(clk),
	.A(SYNTHESIZED_WIRE_19),
	.B(SYNTHESIZED_WIRE_20),
	.yequal(SYNTHESIZED_WIRE_11),
	.ybigger(SYNTHESIZED_WIRE_10),
	.ysmaller(SYNTHESIZED_WIRE_16));


substracker	b2v_inst(
	.control(SYNTHESIZED_WIRE_7),
	.clk(clk),
	.A(SYNTHESIZED_WIRE_19),
	.B(SYNTHESIZED_WIRE_20),
	.done(done),
	.true(SYNTHESIZED_WIRE_21),
	.dispense_50s(SYNTHESIZED_WIRE_3),
	.dispense_25s(SYNTHESIZED_WIRE_2),
	.dispense_10s(SYNTHESIZED_WIRE_0),
	.dispense_5s(SYNTHESIZED_WIRE_4),
	.dispense_1s(SYNTHESIZED_WIRE_1),
	.sum(SYNTHESIZED_WIRE_14));

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;


selec2	b2v_inst4(
	.clk(clk),
	.a(SYNTHESIZED_WIRE_21),
	.reset(reset),
	.out(SYNTHESIZED_WIRE_17));


register	b2v_inst5(
	.clk(clk),
	.en(SYNTHESIZED_WIRE_21),
	.reset(reset),
	.in(SYNTHESIZED_WIRE_14),
	.out(SYNTHESIZED_WIRE_18));


mux5	b2v_inst6(
	.clk(clk),
	.I0(IO_50),
	.I1(I1_25),
	.I2(I2_10),
	.I3(I3_5),
	.I4(I4_1),
	.sel(SYNTHESIZED_WIRE_15),
	.out(SYNTHESIZED_WIRE_20));


selector	b2v_inst7(
	.a(SYNTHESIZED_WIRE_16),
	.reset(reset),
	.clk(clk),
	.out(SYNTHESIZED_WIRE_15));


mux2	b2v_mux2-1(
	.s(SYNTHESIZED_WIRE_17),
	.clk(clk),
	.I0(A),
	.I1(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_19));

assign	s_10out = 10s_out;
assign	s_1out = 1s_out;
assign	s_25out = 25s_out;
assign	s_50out = 50s_out;
assign	s_5out = 5s_out;

endmodule
