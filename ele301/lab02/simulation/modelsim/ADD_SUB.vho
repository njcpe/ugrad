-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Standard Edition"

-- DATE "02/06/2017 14:32:33"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ADD_SUB IS
    PORT (
	SW : IN std_logic_vector(8 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0)
	);
END ADD_SUB;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ADD_SUB IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \Add1~18_cout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \display0|aout[0]~0_combout\ : std_logic;
SIGNAL \display0|aout[1]~1_combout\ : std_logic;
SIGNAL \display0|aout[2]~2_combout\ : std_logic;
SIGNAL \display0|aout[3]~3_combout\ : std_logic;
SIGNAL \display0|aout[4]~4_combout\ : std_logic;
SIGNAL \display0|aout[5]~5_combout\ : std_logic;
SIGNAL \display0|aout[6]~6_combout\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;

BEGIN

ww_SW <= SW;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;

-- Location: IOOBUF_X89_Y8_N39
\HEX0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X89_Y11_N79
\HEX0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X89_Y11_N96
\HEX0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X89_Y4_N79
\HEX0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X89_Y13_N56
\HEX0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X89_Y13_N39
\HEX0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X89_Y4_N96
\HEX0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|aout[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOIBUF_X4_Y0_N18
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LABCELL_X10_Y2_N0
\Add1~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~18_cout\ = CARRY(( \SW[8]~input_o\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[8]~input_o\,
	cin => GND,
	cout => \Add1~18_cout\);

-- Location: LABCELL_X10_Y2_N3
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( \SW[4]~input_o\ ) + ( !\SW[8]~input_o\ $ (!\SW[0]~input_o\) ) + ( \Add1~18_cout\ ))
-- \Add1~2\ = CARRY(( \SW[4]~input_o\ ) + ( !\SW[8]~input_o\ $ (!\SW[0]~input_o\) ) + ( \Add1~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100101010100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[8]~input_o\,
	datac => \ALT_INV_SW[4]~input_o\,
	dataf => \ALT_INV_SW[0]~input_o\,
	cin => \Add1~18_cout\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: IOIBUF_X16_Y0_N18
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LABCELL_X10_Y2_N6
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !\SW[8]~input_o\ $ (!\SW[1]~input_o\) ) + ( \SW[5]~input_o\ ) + ( \Add1~2\ ))
-- \Add1~10\ = CARRY(( !\SW[8]~input_o\ $ (!\SW[1]~input_o\) ) + ( \SW[5]~input_o\ ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[8]~input_o\,
	datac => \ALT_INV_SW[5]~input_o\,
	datad => \ALT_INV_SW[1]~input_o\,
	cin => \Add1~2\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: IOIBUF_X8_Y0_N35
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: LABCELL_X10_Y2_N9
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !\SW[8]~input_o\ $ (!\SW[2]~input_o\) ) + ( \SW[6]~input_o\ ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( !\SW[8]~input_o\ $ (!\SW[2]~input_o\) ) + ( \SW[6]~input_o\ ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[8]~input_o\,
	datac => \ALT_INV_SW[2]~input_o\,
	dataf => \ALT_INV_SW[6]~input_o\,
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: IOIBUF_X4_Y0_N1
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: LABCELL_X10_Y2_N12
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !\SW[8]~input_o\ $ (!\SW[3]~input_o\) ) + ( \SW[7]~input_o\ ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datac => \ALT_INV_SW[8]~input_o\,
	datad => \ALT_INV_SW[3]~input_o\,
	cin => \Add1~6\,
	sumout => \Add1~13_sumout\);

-- Location: LABCELL_X10_Y4_N0
\display0|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[0]~0_combout\ = ( \Add1~13_sumout\ & ( (\Add1~1_sumout\ & (!\Add1~9_sumout\ $ (!\Add1~5_sumout\))) ) ) # ( !\Add1~13_sumout\ & ( (!\Add1~9_sumout\ & (!\Add1~1_sumout\ $ (!\Add1~5_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100001001000000101000001010001001000010010000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~9_sumout\,
	datac => \ALT_INV_Add1~5_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[0]~0_combout\);

-- Location: LABCELL_X10_Y4_N39
\display0|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[1]~1_combout\ = ( \Add1~13_sumout\ & ( (!\Add1~1_sumout\ & (\Add1~5_sumout\)) # (\Add1~1_sumout\ & ((\Add1~9_sumout\))) ) ) # ( !\Add1~13_sumout\ & ( (\Add1~5_sumout\ & (!\Add1~9_sumout\ $ (!\Add1~1_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010000010101010000111100000101010100000101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add1~9_sumout\,
	datad => \ALT_INV_Add1~1_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[1]~1_combout\);

-- Location: LABCELL_X10_Y4_N12
\display0|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[2]~2_combout\ = ( \Add1~13_sumout\ & ( (\Add1~5_sumout\ & ((!\Add1~1_sumout\) # (\Add1~9_sumout\))) ) ) # ( !\Add1~13_sumout\ & ( (!\Add1~1_sumout\ & (\Add1~9_sumout\ & !\Add1~5_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000000010110000101100100000001000000000101100001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~9_sumout\,
	datac => \ALT_INV_Add1~5_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[2]~2_combout\);

-- Location: LABCELL_X10_Y4_N51
\display0|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[3]~3_combout\ = ( \Add1~13_sumout\ & ( (!\Add1~5_sumout\ & (!\Add1~9_sumout\ $ (!\Add1~1_sumout\))) # (\Add1~5_sumout\ & (\Add1~9_sumout\ & \Add1~1_sumout\)) ) ) # ( !\Add1~13_sumout\ & ( (!\Add1~5_sumout\ & (!\Add1~9_sumout\ & 
-- \Add1~1_sumout\)) # (\Add1~5_sumout\ & (!\Add1~9_sumout\ $ (\Add1~1_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000010100101000010101010010101010000101001010000101010100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add1~9_sumout\,
	datad => \ALT_INV_Add1~1_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[3]~3_combout\);

-- Location: LABCELL_X10_Y4_N54
\display0|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[4]~4_combout\ = ( \Add1~13_sumout\ & ( (\Add1~1_sumout\ & (!\Add1~9_sumout\ & !\Add1~5_sumout\)) ) ) # ( !\Add1~13_sumout\ & ( ((!\Add1~9_sumout\ & \Add1~5_sumout\)) # (\Add1~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101011101010000000100000001011101010111010100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~9_sumout\,
	datac => \ALT_INV_Add1~5_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[4]~4_combout\);

-- Location: LABCELL_X10_Y4_N33
\display0|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[5]~5_combout\ = ( \Add1~13_sumout\ & ( (\Add1~5_sumout\ & (!\Add1~9_sumout\ & \Add1~1_sumout\)) ) ) # ( !\Add1~13_sumout\ & ( (!\Add1~5_sumout\ & ((\Add1~1_sumout\) # (\Add1~9_sumout\))) # (\Add1~5_sumout\ & (\Add1~9_sumout\ & 
-- \Add1~1_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010101111000000000101000000001010101011110000000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~5_sumout\,
	datac => \ALT_INV_Add1~9_sumout\,
	datad => \ALT_INV_Add1~1_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[5]~5_combout\);

-- Location: LABCELL_X10_Y4_N6
\display0|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[6]~6_combout\ = ( \Add1~13_sumout\ & ( (!\Add1~1_sumout\ & (!\Add1~9_sumout\ & \Add1~5_sumout\)) ) ) # ( !\Add1~13_sumout\ & ( (!\Add1~9_sumout\ & ((!\Add1~5_sumout\))) # (\Add1~9_sumout\ & (\Add1~1_sumout\ & \Add1~5_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000111000001000010000000100011000001110000010000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => \ALT_INV_Add1~9_sumout\,
	datac => \ALT_INV_Add1~5_sumout\,
	datae => \ALT_INV_Add1~13_sumout\,
	combout => \display0|aout[6]~6_combout\);

-- Location: MLABCELL_X28_Y41_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


