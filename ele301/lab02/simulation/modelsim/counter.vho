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

-- DATE "02/06/2017 16:01:20"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	counter IS
    PORT (
	clock_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0)
	);
END counter;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock_50~input_o\ : std_logic;
SIGNAL \clock_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \filter|shift[4]~DUPLICATE_q\ : std_logic;
SIGNAL \filter|shift[6]~DUPLICATE_q\ : std_logic;
SIGNAL \filter|is_zero~0_combout\ : std_logic;
SIGNAL \filter|output~0_combout\ : std_logic;
SIGNAL \filter|output~1_combout\ : std_logic;
SIGNAL \filter|output~q\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \Counter2:loopcount[0]~q\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Counter2:loopcount[1]~q\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Counter2:loopcount[2]~q\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Counter2:loopcount[3]~q\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Counter2:loopcount[4]~q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \display0|aout[0]~0_combout\ : std_logic;
SIGNAL \display0|aout[1]~1_combout\ : std_logic;
SIGNAL \display0|aout[2]~2_combout\ : std_logic;
SIGNAL \display0|aout[3]~3_combout\ : std_logic;
SIGNAL \display0|aout[4]~4_combout\ : std_logic;
SIGNAL \display0|aout[5]~5_combout\ : std_logic;
SIGNAL \display0|aout[6]~6_combout\ : std_logic;
SIGNAL \display1|aout[0]~0_combout\ : std_logic;
SIGNAL \display1|aout[1]~1_combout\ : std_logic;
SIGNAL \display1|aout[2]~2_combout\ : std_logic;
SIGNAL \display1|aout[3]~3_combout\ : std_logic;
SIGNAL \display1|aout[4]~4_combout\ : std_logic;
SIGNAL \display1|aout[5]~5_combout\ : std_logic;
SIGNAL \display1|aout[6]~6_combout\ : std_logic;
SIGNAL \filter|shift\ : std_logic_vector(7 DOWNTO 0);
SIGNAL count : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \filter|ALT_INV_is_zero~0_combout\ : std_logic;
SIGNAL \filter|ALT_INV_output~0_combout\ : std_logic;
SIGNAL \filter|ALT_INV_shift\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \filter|ALT_INV_output~q\ : std_logic;
SIGNAL \display0|ALT_INV_aout[2]~2_combout\ : std_logic;
SIGNAL ALT_INV_count : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Counter2:loopcount[4]~q\ : std_logic;
SIGNAL \ALT_INV_Counter2:loopcount[1]~q\ : std_logic;
SIGNAL \ALT_INV_Counter2:loopcount[2]~q\ : std_logic;
SIGNAL \ALT_INV_Counter2:loopcount[3]~q\ : std_logic;
SIGNAL \ALT_INV_Counter2:loopcount[0]~q\ : std_logic;

BEGIN

ww_clock_50 <= clock_50;
ww_KEY <= KEY;
ww_SW <= SW;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\filter|ALT_INV_is_zero~0_combout\ <= NOT \filter|is_zero~0_combout\;
\filter|ALT_INV_output~0_combout\ <= NOT \filter|output~0_combout\;
\filter|ALT_INV_shift\(4) <= NOT \filter|shift\(4);
\filter|ALT_INV_shift\(3) <= NOT \filter|shift\(3);
\filter|ALT_INV_shift\(2) <= NOT \filter|shift\(2);
\filter|ALT_INV_shift\(1) <= NOT \filter|shift\(1);
\filter|ALT_INV_shift\(0) <= NOT \filter|shift\(0);
\filter|ALT_INV_shift\(7) <= NOT \filter|shift\(7);
\filter|ALT_INV_shift\(6) <= NOT \filter|shift\(6);
\filter|ALT_INV_shift\(5) <= NOT \filter|shift\(5);
\filter|ALT_INV_output~q\ <= NOT \filter|output~q\;
\display0|ALT_INV_aout[2]~2_combout\ <= NOT \display0|aout[2]~2_combout\;
ALT_INV_count(2) <= NOT count(2);
ALT_INV_count(3) <= NOT count(3);
ALT_INV_count(0) <= NOT count(0);
ALT_INV_count(1) <= NOT count(1);
\ALT_INV_Counter2:loopcount[4]~q\ <= NOT \Counter2:loopcount[4]~q\;
\ALT_INV_Counter2:loopcount[1]~q\ <= NOT \Counter2:loopcount[1]~q\;
\ALT_INV_Counter2:loopcount[2]~q\ <= NOT \Counter2:loopcount[2]~q\;
\ALT_INV_Counter2:loopcount[3]~q\ <= NOT \Counter2:loopcount[3]~q\;
\ALT_INV_Counter2:loopcount[0]~q\ <= NOT \Counter2:loopcount[0]~q\;

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
	i => \display0|ALT_INV_aout[2]~2_combout\,
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

-- Location: IOOBUF_X89_Y6_N39
\HEX1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(0));

-- Location: IOOBUF_X89_Y6_N56
\HEX1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(1));

-- Location: IOOBUF_X89_Y16_N39
\HEX1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(2));

-- Location: IOOBUF_X89_Y16_N56
\HEX1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(3));

-- Location: IOOBUF_X89_Y15_N39
\HEX1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(4));

-- Location: IOOBUF_X89_Y15_N56
\HEX1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(5));

-- Location: IOOBUF_X89_Y8_N56
\HEX1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display1|aout[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(6));

-- Location: IOIBUF_X32_Y0_N1
\clock_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_50,
	o => \clock_50~input_o\);

-- Location: CLKCTRL_G6
\clock_50~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock_50~input_o\,
	outclk => \clock_50~inputCLKENA0_outclk\);

-- Location: IOIBUF_X40_Y0_N18
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: FF_X40_Y3_N59
\filter|shift[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \KEY[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(0));

-- Location: FF_X40_Y3_N53
\filter|shift[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(1));

-- Location: FF_X40_Y3_N22
\filter|shift[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(2));

-- Location: FF_X40_Y3_N2
\filter|shift[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(3));

-- Location: FF_X40_Y3_N7
\filter|shift[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift[4]~DUPLICATE_q\);

-- Location: FF_X40_Y3_N14
\filter|shift[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift[4]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(5));

-- Location: FF_X40_Y3_N47
\filter|shift[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(6));

-- Location: FF_X40_Y3_N46
\filter|shift[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift[6]~DUPLICATE_q\);

-- Location: FF_X40_Y3_N35
\filter|shift[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift[6]~DUPLICATE_q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(7));

-- Location: FF_X40_Y3_N8
\filter|shift[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \filter|shift\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|shift\(4));

-- Location: LABCELL_X40_Y3_N15
\filter|is_zero~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter|is_zero~0_combout\ = ( !\filter|shift\(0) & ( !\filter|shift\(2) & ( (!\filter|shift\(1) & (!\filter|shift\(4) & !\filter|shift\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \filter|ALT_INV_shift\(1),
	datac => \filter|ALT_INV_shift\(4),
	datad => \filter|ALT_INV_shift\(3),
	datae => \filter|ALT_INV_shift\(0),
	dataf => \filter|ALT_INV_shift\(2),
	combout => \filter|is_zero~0_combout\);

-- Location: LABCELL_X40_Y3_N36
\filter|output~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter|output~0_combout\ = ( \filter|shift\(3) & ( \filter|shift\(2) & ( (\filter|shift\(0) & (\filter|shift\(1) & \filter|shift\(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \filter|ALT_INV_shift\(0),
	datac => \filter|ALT_INV_shift\(1),
	datad => \filter|ALT_INV_shift\(4),
	datae => \filter|ALT_INV_shift\(3),
	dataf => \filter|ALT_INV_shift\(2),
	combout => \filter|output~0_combout\);

-- Location: LABCELL_X40_Y3_N30
\filter|output~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter|output~1_combout\ = ( \filter|output~0_combout\ & ( \filter|output~q\ & ( (((!\filter|is_zero~0_combout\) # (\filter|shift\(7))) # (\filter|shift\(5))) # (\filter|shift\(6)) ) ) ) # ( !\filter|output~0_combout\ & ( \filter|output~q\ & ( 
-- (((!\filter|is_zero~0_combout\) # (\filter|shift\(7))) # (\filter|shift\(5))) # (\filter|shift\(6)) ) ) ) # ( \filter|output~0_combout\ & ( !\filter|output~q\ & ( (\filter|shift\(6) & (\filter|shift\(5) & \filter|shift\(7))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010000000111111111011111111111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \filter|ALT_INV_shift\(6),
	datab => \filter|ALT_INV_shift\(5),
	datac => \filter|ALT_INV_shift\(7),
	datad => \filter|ALT_INV_is_zero~0_combout\,
	datae => \filter|ALT_INV_output~0_combout\,
	dataf => \filter|ALT_INV_output~q\,
	combout => \filter|output~1_combout\);

-- Location: FF_X40_Y3_N29
\filter|output\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~input_o\,
	asdata => \filter|output~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter|output~q\);

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

-- Location: MLABCELL_X39_Y3_N0
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \SW[0]~input_o\ ) + ( count(0) ) + ( !VCC ))
-- \Add0~6\ = CARRY(( \SW[0]~input_o\ ) + ( count(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[0]~input_o\,
	datac => ALT_INV_count(0),
	cin => GND,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: IOIBUF_X36_Y0_N1
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

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

-- Location: MLABCELL_X39_Y3_N30
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( \Counter2:loopcount[0]~q\ ) + ( \SW[4]~input_o\ ) + ( !VCC ))
-- \Add1~2\ = CARRY(( \Counter2:loopcount[0]~q\ ) + ( \SW[4]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[4]~input_o\,
	datad => \ALT_INV_Counter2:loopcount[0]~q\,
	cin => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: FF_X39_Y3_N56
\Counter2:loopcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add1~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \Equal0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter2:loopcount[0]~q\);

-- Location: MLABCELL_X39_Y3_N33
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( \SW[5]~input_o\ ) + ( \Counter2:loopcount[1]~q\ ) + ( \Add1~2\ ))
-- \Add1~14\ = CARRY(( \SW[5]~input_o\ ) + ( \Counter2:loopcount[1]~q\ ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[5]~input_o\,
	datac => \ALT_INV_Counter2:loopcount[1]~q\,
	cin => \Add1~2\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: FF_X39_Y3_N17
\Counter2:loopcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add1~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \Equal0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter2:loopcount[1]~q\);

-- Location: MLABCELL_X39_Y3_N36
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( \Counter2:loopcount[2]~q\ ) + ( \SW[6]~input_o\ ) + ( \Add1~14\ ))
-- \Add1~10\ = CARRY(( \Counter2:loopcount[2]~q\ ) + ( \SW[6]~input_o\ ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Counter2:loopcount[2]~q\,
	dataf => \ALT_INV_SW[6]~input_o\,
	cin => \Add1~14\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: FF_X39_Y3_N20
\Counter2:loopcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add1~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \Equal0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter2:loopcount[2]~q\);

-- Location: MLABCELL_X39_Y3_N39
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( \Counter2:loopcount[3]~q\ ) + ( \SW[7]~input_o\ ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( \Counter2:loopcount[3]~q\ ) + ( \SW[7]~input_o\ ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[7]~input_o\,
	datad => \ALT_INV_Counter2:loopcount[3]~q\,
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: FF_X39_Y3_N23
\Counter2:loopcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add1~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \Equal0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter2:loopcount[3]~q\);

-- Location: MLABCELL_X39_Y3_N42
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( \Counter2:loopcount[4]~q\ ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Counter2:loopcount[4]~q\,
	cin => \Add1~6\,
	sumout => \Add1~17_sumout\);

-- Location: FF_X39_Y3_N14
\Counter2:loopcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add1~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \Equal0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Counter2:loopcount[4]~q\);

-- Location: MLABCELL_X39_Y3_N48
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( \Counter2:loopcount[3]~q\ & ( \Counter2:loopcount[2]~q\ & ( (!\Counter2:loopcount[4]~q\ & (\Counter2:loopcount[0]~q\ & \Counter2:loopcount[1]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Counter2:loopcount[4]~q\,
	datac => \ALT_INV_Counter2:loopcount[0]~q\,
	datad => \ALT_INV_Counter2:loopcount[1]~q\,
	datae => \ALT_INV_Counter2:loopcount[3]~q\,
	dataf => \ALT_INV_Counter2:loopcount[2]~q\,
	combout => \Equal0~0_combout\);

-- Location: FF_X39_Y3_N26
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add0~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: MLABCELL_X39_Y3_N3
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \SW[1]~input_o\ ) + ( count(1) ) + ( \Add0~6\ ))
-- \Add0~2\ = CARRY(( \SW[1]~input_o\ ) + ( count(1) ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(1),
	datad => \ALT_INV_SW[1]~input_o\,
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X39_Y3_N53
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add0~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: MLABCELL_X39_Y3_N6
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \SW[2]~input_o\ ) + ( count(2) ) + ( \Add0~2\ ))
-- \Add0~14\ = CARRY(( \SW[2]~input_o\ ) + ( count(2) ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[2]~input_o\,
	datac => ALT_INV_count(2),
	cin => \Add0~2\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X39_Y3_N50
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add0~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

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

-- Location: MLABCELL_X39_Y3_N9
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( count(3) ) + ( \SW[3]~input_o\ ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datad => ALT_INV_count(3),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\);

-- Location: FF_X39_Y3_N29
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \filter|output~q\,
	asdata => \Add0~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LABCELL_X40_Y3_N24
\display0|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[0]~0_combout\ = (!count(2) & (count(0) & (!count(1) $ (count(3))))) # (count(2) & (!count(1) & (!count(0) $ (count(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100000000110010010000000011001001000000001100100100000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(2),
	datab => ALT_INV_count(1),
	datac => ALT_INV_count(0),
	datad => ALT_INV_count(3),
	combout => \display0|aout[0]~0_combout\);

-- Location: LABCELL_X40_Y3_N27
\display0|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[1]~1_combout\ = ( count(0) & ( (!count(1) & (count(2) & !count(3))) # (count(1) & ((count(3)))) ) ) # ( !count(0) & ( (count(2) & ((count(3)) # (count(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010101000001010101010101010000000011110101000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(2),
	datac => ALT_INV_count(1),
	datad => ALT_INV_count(3),
	dataf => ALT_INV_count(0),
	combout => \display0|aout[1]~1_combout\);

-- Location: LABCELL_X40_Y3_N9
\display0|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[2]~2_combout\ = ( count(3) & ( count(0) & ( (!count(2)) # (!count(1)) ) ) ) # ( !count(3) & ( count(0) ) ) # ( count(3) & ( !count(0) & ( !count(2) ) ) ) # ( !count(3) & ( !count(0) & ( (!count(1)) # (count(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010111110101101010101010101011111111111111111111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(2),
	datac => ALT_INV_count(1),
	datae => ALT_INV_count(3),
	dataf => ALT_INV_count(0),
	combout => \display0|aout[2]~2_combout\);

-- Location: LABCELL_X40_Y3_N0
\display0|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[3]~3_combout\ = ( count(2) & ( count(0) & ( count(1) ) ) ) # ( !count(2) & ( count(0) & ( !count(1) ) ) ) # ( count(2) & ( !count(0) & ( (!count(3) & !count(1)) ) ) ) # ( !count(2) & ( !count(0) & ( (count(3) & count(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011110011000000000011111111000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(3),
	datad => ALT_INV_count(1),
	datae => ALT_INV_count(2),
	dataf => ALT_INV_count(0),
	combout => \display0|aout[3]~3_combout\);

-- Location: LABCELL_X40_Y3_N42
\display0|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[4]~4_combout\ = ( count(3) & ( (!count(1) & (!count(2) & count(0))) ) ) # ( !count(3) & ( ((!count(1) & count(2))) # (count(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011111111000000001100000000001100111111110000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(1),
	datac => ALT_INV_count(2),
	datad => ALT_INV_count(0),
	datae => ALT_INV_count(3),
	combout => \display0|aout[4]~4_combout\);

-- Location: LABCELL_X40_Y3_N48
\display0|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[5]~5_combout\ = ( count(3) & ( count(0) & ( (!count(1) & count(2)) ) ) ) # ( !count(3) & ( count(0) & ( (!count(2)) # (count(1)) ) ) ) # ( !count(3) & ( !count(0) & ( (count(1) & !count(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000011110011111100110000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(1),
	datac => ALT_INV_count(2),
	datae => ALT_INV_count(3),
	dataf => ALT_INV_count(0),
	combout => \display0|aout[5]~5_combout\);

-- Location: LABCELL_X40_Y3_N54
\display0|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[6]~6_combout\ = ( count(3) & ( (!count(0) & (count(2) & !count(1))) ) ) # ( !count(3) & ( (!count(2) & ((!count(1)))) # (count(2) & (count(0) & count(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000011000011000000000011110000000000110000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(0),
	datac => ALT_INV_count(2),
	datad => ALT_INV_count(1),
	datae => ALT_INV_count(3),
	combout => \display0|aout[6]~6_combout\);

-- Location: LABCELL_X37_Y3_N15
\display1|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[0]~0_combout\ = ( \Counter2:loopcount[3]~q\ & ( \Counter2:loopcount[2]~q\ & ( (!\Counter2:loopcount[1]~q\ & \Counter2:loopcount[0]~q\) ) ) ) # ( !\Counter2:loopcount[3]~q\ & ( \Counter2:loopcount[2]~q\ & ( (!\Counter2:loopcount[1]~q\ & 
-- !\Counter2:loopcount[0]~q\) ) ) ) # ( \Counter2:loopcount[3]~q\ & ( !\Counter2:loopcount[2]~q\ & ( (\Counter2:loopcount[1]~q\ & \Counter2:loopcount[0]~q\) ) ) ) # ( !\Counter2:loopcount[3]~q\ & ( !\Counter2:loopcount[2]~q\ & ( (!\Counter2:loopcount[1]~q\ 
-- & \Counter2:loopcount[0]~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000000110000001111000000110000000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Counter2:loopcount[1]~q\,
	datac => \ALT_INV_Counter2:loopcount[0]~q\,
	datae => \ALT_INV_Counter2:loopcount[3]~q\,
	dataf => \ALT_INV_Counter2:loopcount[2]~q\,
	combout => \display1|aout[0]~0_combout\);

-- Location: MLABCELL_X39_Y3_N27
\display1|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[1]~1_combout\ = ( \Counter2:loopcount[3]~q\ & ( (!\Counter2:loopcount[0]~q\ & ((\Counter2:loopcount[2]~q\))) # (\Counter2:loopcount[0]~q\ & (\Counter2:loopcount[1]~q\)) ) ) # ( !\Counter2:loopcount[3]~q\ & ( (\Counter2:loopcount[2]~q\ & 
-- (!\Counter2:loopcount[1]~q\ $ (!\Counter2:loopcount[0]~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000000110000111010001110100000110000001100001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter2:loopcount[1]~q\,
	datab => \ALT_INV_Counter2:loopcount[0]~q\,
	datac => \ALT_INV_Counter2:loopcount[2]~q\,
	datae => \ALT_INV_Counter2:loopcount[3]~q\,
	combout => \display1|aout[1]~1_combout\);

-- Location: MLABCELL_X39_Y3_N15
\display1|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[2]~2_combout\ = ( \Counter2:loopcount[1]~q\ & ( (!\Counter2:loopcount[3]~q\ & (!\Counter2:loopcount[2]~q\ & !\Counter2:loopcount[0]~q\)) # (\Counter2:loopcount[3]~q\ & (\Counter2:loopcount[2]~q\)) ) ) # ( !\Counter2:loopcount[1]~q\ & ( 
-- (\Counter2:loopcount[3]~q\ & (\Counter2:loopcount[2]~q\ & !\Counter2:loopcount[0]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000100100011001000100010000000100001001000110010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter2:loopcount[3]~q\,
	datab => \ALT_INV_Counter2:loopcount[2]~q\,
	datac => \ALT_INV_Counter2:loopcount[0]~q\,
	datae => \ALT_INV_Counter2:loopcount[1]~q\,
	combout => \display1|aout[2]~2_combout\);

-- Location: MLABCELL_X39_Y3_N57
\display1|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[3]~3_combout\ = (!\Counter2:loopcount[0]~q\ & ((!\Counter2:loopcount[1]~q\ & (\Counter2:loopcount[2]~q\ & !\Counter2:loopcount[3]~q\)) # (\Counter2:loopcount[1]~q\ & (!\Counter2:loopcount[2]~q\ & \Counter2:loopcount[3]~q\)))) # 
-- (\Counter2:loopcount[0]~q\ & (!\Counter2:loopcount[1]~q\ $ ((\Counter2:loopcount[2]~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100101001001001010010100100100101001010010010010100101001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter2:loopcount[1]~q\,
	datab => \ALT_INV_Counter2:loopcount[2]~q\,
	datac => \ALT_INV_Counter2:loopcount[0]~q\,
	datad => \ALT_INV_Counter2:loopcount[3]~q\,
	combout => \display1|aout[3]~3_combout\);

-- Location: MLABCELL_X39_Y3_N54
\display1|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[4]~4_combout\ = (!\Counter2:loopcount[1]~q\ & ((!\Counter2:loopcount[2]~q\ & ((\Counter2:loopcount[0]~q\))) # (\Counter2:loopcount[2]~q\ & (!\Counter2:loopcount[3]~q\)))) # (\Counter2:loopcount[1]~q\ & (((!\Counter2:loopcount[3]~q\ & 
-- \Counter2:loopcount[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000011111000001000001111100000100000111110000010000011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter2:loopcount[1]~q\,
	datab => \ALT_INV_Counter2:loopcount[2]~q\,
	datac => \ALT_INV_Counter2:loopcount[3]~q\,
	datad => \ALT_INV_Counter2:loopcount[0]~q\,
	combout => \display1|aout[4]~4_combout\);

-- Location: MLABCELL_X39_Y3_N18
\display1|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[5]~5_combout\ = (!\Counter2:loopcount[1]~q\ & (\Counter2:loopcount[0]~q\ & (!\Counter2:loopcount[3]~q\ $ (\Counter2:loopcount[2]~q\)))) # (\Counter2:loopcount[1]~q\ & (!\Counter2:loopcount[3]~q\ & ((!\Counter2:loopcount[2]~q\) # 
-- (\Counter2:loopcount[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000010010011100000001001001110000000100100111000000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter2:loopcount[1]~q\,
	datab => \ALT_INV_Counter2:loopcount[0]~q\,
	datac => \ALT_INV_Counter2:loopcount[3]~q\,
	datad => \ALT_INV_Counter2:loopcount[2]~q\,
	combout => \display1|aout[5]~5_combout\);

-- Location: MLABCELL_X39_Y3_N21
\display1|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[6]~6_combout\ = ( \Counter2:loopcount[2]~q\ & ( (!\Counter2:loopcount[1]~q\ & (!\Counter2:loopcount[0]~q\ & \Counter2:loopcount[3]~q\)) # (\Counter2:loopcount[1]~q\ & (\Counter2:loopcount[0]~q\ & !\Counter2:loopcount[3]~q\)) ) ) # ( 
-- !\Counter2:loopcount[2]~q\ & ( (!\Counter2:loopcount[1]~q\ & !\Counter2:loopcount[3]~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000000010001100010000001000110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Counter2:loopcount[1]~q\,
	datab => \ALT_INV_Counter2:loopcount[0]~q\,
	datad => \ALT_INV_Counter2:loopcount[3]~q\,
	dataf => \ALT_INV_Counter2:loopcount[2]~q\,
	combout => \display1|aout[6]~6_combout\);

-- Location: IOIBUF_X36_Y0_N18
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

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

-- Location: IOIBUF_X2_Y0_N58
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: MLABCELL_X28_Y33_N3
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


