-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
-- CREATED		"Sun May 29 12:49:29 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY comparatorwork IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		done :  OUT  STD_LOGIC;
		s_10out :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		s_1out :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		s_25out :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		s_50out :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		s_5out :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END comparatorwork;

ARCHITECTURE bdf_type OF comparatorwork IS 

COMPONENT counter
	PORT(clk : IN STD_LOGIC;
		 rst : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 count : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT comparator
	PORT(clk : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 yequal : OUT STD_LOGIC;
		 ybigger : OUT STD_LOGIC;
		 ysmaller : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT substracker
	PORT(control : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 done : OUT STD_LOGIC;
		 true : OUT STD_LOGIC;
		 dispense_50s : OUT STD_LOGIC;
		 dispense_25s : OUT STD_LOGIC;
		 dispense_10s : OUT STD_LOGIC;
		 dispense_5s : OUT STD_LOGIC;
		 dispense_1s : OUT STD_LOGIC;
		 sum : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT selec2
	PORT(clk : IN STD_LOGIC;
		 a : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT register
	PORT(clk : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux5
	PORT(clk : IN STD_LOGIC;
		 I0 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 I1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 I2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 I3 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 I4 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT selector
	PORT(a : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 out : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2
	PORT(s : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 I0 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 I1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	10s_out :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	1s_out :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	25s_out :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	50s_out :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	5s_out :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(6 DOWNTO 0);


BEGIN 



b2v_10s : counter
PORT MAP(clk => clk,
		 rst => reset,
		 en => SYNTHESIZED_WIRE_0,
		 count => 10s_out);


b2v_1s : counter
PORT MAP(clk => clk,
		 rst => reset,
		 en => SYNTHESIZED_WIRE_1,
		 count => 1s_out);


b2v_25s : counter
PORT MAP(clk => clk,
		 rst => reset,
		 en => SYNTHESIZED_WIRE_2,
		 count => 25s_out);


b2v_50s : counter
PORT MAP(clk => clk,
		 rst => reset,
		 en => SYNTHESIZED_WIRE_3,
		 count => 50s_out);


b2v_5s : counter
PORT MAP(clk => clk,
		 rst => reset,
		 en => SYNTHESIZED_WIRE_4,
		 count => 5s_out);


b2v_compar : comparator
PORT MAP(clk => clk,
		 A => SYNTHESIZED_WIRE_19,
		 B => SYNTHESIZED_WIRE_20,
		 yequal => SYNTHESIZED_WIRE_11,
		 ybigger => SYNTHESIZED_WIRE_10,
		 ysmaller => SYNTHESIZED_WIRE_16);


b2v_inst : substracker
PORT MAP(control => SYNTHESIZED_WIRE_7,
		 clk => clk,
		 A => SYNTHESIZED_WIRE_19,
		 B => SYNTHESIZED_WIRE_20,
		 done => done,
		 true => SYNTHESIZED_WIRE_21,
		 dispense_50s => SYNTHESIZED_WIRE_3,
		 dispense_25s => SYNTHESIZED_WIRE_2,
		 dispense_10s => SYNTHESIZED_WIRE_0,
		 dispense_5s => SYNTHESIZED_WIRE_4,
		 dispense_1s => SYNTHESIZED_WIRE_1,
		 sum => SYNTHESIZED_WIRE_14);


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_10 OR SYNTHESIZED_WIRE_11;


b2v_inst4 : selec2
PORT MAP(clk => clk,
		 a => SYNTHESIZED_WIRE_21,
		 reset => reset,
		 out => SYNTHESIZED_WIRE_17);


b2v_inst5 : register
PORT MAP(clk => clk,
		 en => SYNTHESIZED_WIRE_21,
		 reset => reset,
		 in => SYNTHESIZED_WIRE_14,
		 out => SYNTHESIZED_WIRE_18);


b2v_inst6 : mux5
PORT MAP(clk => clk,
		 sel => SYNTHESIZED_WIRE_15,
		 out => SYNTHESIZED_WIRE_20);


b2v_inst7 : selector
PORT MAP(a => SYNTHESIZED_WIRE_16,
		 reset => reset,
		 clk => clk,
		 out => SYNTHESIZED_WIRE_15);


b2v_mux2-1 : mux2
PORT MAP(s => SYNTHESIZED_WIRE_17,
		 clk => clk,
		 I0 => A,
		 I1 => SYNTHESIZED_WIRE_18,
		 out => SYNTHESIZED_WIRE_19);

s_10out <= 10s_out;
s_1out <= 1s_out;
s_25out <= 25s_out;
s_50out <= 50s_out;
s_5out <= 5s_out;

END bdf_type;