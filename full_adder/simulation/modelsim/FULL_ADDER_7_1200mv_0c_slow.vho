-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/14/2019 20:13:43"

-- 
-- Device: Altera EP3C16F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FULL_ADDER IS
    PORT (
	I_A : IN std_logic;
	I_B : IN std_logic;
	I_C : IN std_logic;
	O_C : BUFFER std_logic;
	O_S : BUFFER std_logic
	);
END FULL_ADDER;

-- Design Ports Information
-- O_C	=>  Location: PIN_P4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- O_S	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I_B	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I_C	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I_A	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FULL_ADDER IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_I_A : std_logic;
SIGNAL ww_I_B : std_logic;
SIGNAL ww_I_C : std_logic;
SIGNAL ww_O_C : std_logic;
SIGNAL ww_O_S : std_logic;
SIGNAL \O_C~output_o\ : std_logic;
SIGNAL \O_S~output_o\ : std_logic;
SIGNAL \I_A~input_o\ : std_logic;
SIGNAL \I_B~input_o\ : std_logic;
SIGNAL \I_C~input_o\ : std_logic;
SIGNAL \O_C~0_combout\ : std_logic;
SIGNAL \HALF2|O_S~0_combout\ : std_logic;

BEGIN

ww_I_A <= I_A;
ww_I_B <= I_B;
ww_I_C <= I_C;
O_C <= ww_O_C;
O_S <= ww_O_S;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y10_N23
\O_C~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \O_C~0_combout\,
	devoe => ww_devoe,
	o => \O_C~output_o\);

-- Location: IOOBUF_X0_Y22_N23
\O_S~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HALF2|O_S~0_combout\,
	devoe => ww_devoe,
	o => \O_S~output_o\);

-- Location: IOIBUF_X0_Y21_N1
\I_A~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_A,
	o => \I_A~input_o\);

-- Location: IOIBUF_X0_Y24_N22
\I_B~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_B,
	o => \I_B~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\I_C~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I_C,
	o => \I_C~input_o\);

-- Location: LCCOMB_X1_Y23_N8
\O_C~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \O_C~0_combout\ = (\I_A~input_o\ & ((\I_B~input_o\) # (\I_C~input_o\))) # (!\I_A~input_o\ & (\I_B~input_o\ & \I_C~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I_A~input_o\,
	datac => \I_B~input_o\,
	datad => \I_C~input_o\,
	combout => \O_C~0_combout\);

-- Location: LCCOMB_X1_Y23_N26
\HALF2|O_S~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \HALF2|O_S~0_combout\ = \I_A~input_o\ $ (\I_B~input_o\ $ (\I_C~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I_A~input_o\,
	datac => \I_B~input_o\,
	datad => \I_C~input_o\,
	combout => \HALF2|O_S~0_combout\);

ww_O_C <= \O_C~output_o\;

ww_O_S <= \O_S~output_o\;
END structure;


