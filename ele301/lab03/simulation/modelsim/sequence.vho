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

-- DATE "02/13/2017 17:27:22"

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

ENTITY 	fsm IS
    PORT (
	clock_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END fsm;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fsm IS
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
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock_50~input_o\ : std_logic;
SIGNAL \clock_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \key_debounce|shift[4]~feeder_combout\ : std_logic;
SIGNAL \key_debounce|output~0_combout\ : std_logic;
SIGNAL \key_debounce|is_zero~0_combout\ : std_logic;
SIGNAL \key_debounce|output~1_combout\ : std_logic;
SIGNAL \key_debounce|output~q\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \state.wait4~DUPLICATE_q\ : std_logic;
SIGNAL \state.wait3~DUPLICATE_q\ : std_logic;
SIGNAL \Selector40~2_combout\ : std_logic;
SIGNAL \state.blink1a~DUPLICATE_q\ : std_logic;
SIGNAL \Selector31~0_combout\ : std_logic;
SIGNAL \Selector38~7_combout\ : std_logic;
SIGNAL \state.wait6~q\ : std_logic;
SIGNAL \Selector39~0_combout\ : std_logic;
SIGNAL \state.wait7~q\ : std_logic;
SIGNAL \Selector37~0_combout\ : std_logic;
SIGNAL \state.wait5~q\ : std_logic;
SIGNAL \state.blink1~q\ : std_logic;
SIGNAL \Selector34~0_combout\ : std_logic;
SIGNAL \state.wait2~q\ : std_logic;
SIGNAL \Selector38~8_combout\ : std_logic;
SIGNAL \state.timer~q\ : std_logic;
SIGNAL \Selector40~1_combout\ : std_logic;
SIGNAL \state.wait7~DUPLICATE_q\ : std_logic;
SIGNAL \Selector40~3_combout\ : std_logic;
SIGNAL \state.wait8~q\ : std_logic;
SIGNAL \Selector41~0_combout\ : std_logic;
SIGNAL \state.blink1~DUPLICATE_q\ : std_logic;
SIGNAL \Selector45~0_combout\ : std_logic;
SIGNAL \state.blink1a~q\ : std_logic;
SIGNAL \Selector42~0_combout\ : std_logic;
SIGNAL \state.blink2~DUPLICATE_q\ : std_logic;
SIGNAL \Selector46~0_combout\ : std_logic;
SIGNAL \state.blink2a~q\ : std_logic;
SIGNAL \Selector43~0_combout\ : std_logic;
SIGNAL \state.blink3~DUPLICATE_q\ : std_logic;
SIGNAL \Selector47~0_combout\ : std_logic;
SIGNAL \state.blink3a~q\ : std_logic;
SIGNAL \Selector44~0_combout\ : std_logic;
SIGNAL \state.blink4~DUPLICATE_q\ : std_logic;
SIGNAL \Selector48~0_combout\ : std_logic;
SIGNAL \state.blink4a~q\ : std_logic;
SIGNAL \Selector33~0_combout\ : std_logic;
SIGNAL \state.wait1~q\ : std_logic;
SIGNAL \Selector31~1_combout\ : std_logic;
SIGNAL \clear~q\ : std_logic;
SIGNAL \state.blink2~q\ : std_logic;
SIGNAL \state.blink4~q\ : std_logic;
SIGNAL \state.timer~DUPLICATE_q\ : std_logic;
SIGNAL \state.blink3~q\ : std_logic;
SIGNAL \WideOr8~1_combout\ : std_logic;
SIGNAL \Selector32~0_combout\ : std_logic;
SIGNAL \state.wait6~DUPLICATE_q\ : std_logic;
SIGNAL \Selector32~1_combout\ : std_logic;
SIGNAL \start~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \tstate.standby~q\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \tstate.done~q\ : std_logic;
SIGNAL \timer_FSM:cnt[0]~0_combout\ : std_logic;
SIGNAL \timer_FSM:cnt[0]~q\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[1]~q\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[2]~q\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[3]~q\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[4]~q\ : std_logic;
SIGNAL \timer_FSM:cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[5]~q\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[6]~q\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[7]~q\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[8]~q\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[9]~q\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[10]~q\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[11]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[12]~q\ : std_logic;
SIGNAL \timer_FSM:cnt[14]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[13]~q\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[14]~q\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \timer_FSM:cnt[11]~q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \timer_FSM:cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \timer_FSM:cnt[20]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[15]~q\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[16]~q\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[17]~q\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[18]~q\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[19]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[20]~q\ : std_logic;
SIGNAL \timer_FSM:cnt[19]~q\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[21]~q\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[22]~q\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[23]~q\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[24]~q\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \timer_FSM:cnt[25]~q\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \tstate.count~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \tstate.check~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \timeup~q\ : std_logic;
SIGNAL \Selector35~0_combout\ : std_logic;
SIGNAL \state.wait3~q\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \state.wait4~q\ : std_logic;
SIGNAL \Selector51~0_combout\ : std_logic;
SIGNAL \Selector53~0_combout\ : std_logic;
SIGNAL \Selector53~1_combout\ : std_logic;
SIGNAL \LEDR[0]~reg0_q\ : std_logic;
SIGNAL \WideOr8~0_combout\ : std_logic;
SIGNAL \Selector52~0_combout\ : std_logic;
SIGNAL \LEDR[6]~reg0_q\ : std_logic;
SIGNAL \Selector51~1_combout\ : std_logic;
SIGNAL \LEDR[7]~reg0_q\ : std_logic;
SIGNAL \Selector50~0_combout\ : std_logic;
SIGNAL \Selector50~1_combout\ : std_logic;
SIGNAL \LEDR[8]~reg0_q\ : std_logic;
SIGNAL \key_debounce|shift\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_state.blink1~q\ : std_logic;
SIGNAL \ALT_INV_state.blink4a~q\ : std_logic;
SIGNAL \ALT_INV_timeup~q\ : std_logic;
SIGNAL \ALT_INV_state.wait4~q\ : std_logic;
SIGNAL \ALT_INV_LEDR[8]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_LEDR[7]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_LEDR[6]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_LEDR[0]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[15]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[25]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[24]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[23]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[22]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[21]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[20]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[19]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[18]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[17]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[16]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[0]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[4]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[3]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[2]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[1]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[12]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[14]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[10]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[9]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[8]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[7]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[6]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[5]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[13]~q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[11]~q\ : std_logic;
SIGNAL \ALT_INV_state.wait6~q\ : std_logic;
SIGNAL \ALT_INV_state.timer~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.wait3~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.wait7~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.blink1a~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.blink4~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.blink2~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.blink3~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.blink1~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.wait4~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[20]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[19]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[14]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_timer_FSM:cnt[11]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_state.wait6~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Selector32~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr8~1_combout\ : std_logic;
SIGNAL \ALT_INV_state.wait2~q\ : std_logic;
SIGNAL \ALT_INV_Selector40~2_combout\ : std_logic;
SIGNAL \ALT_INV_state.wait1~q\ : std_logic;
SIGNAL \ALT_INV_Selector40~1_combout\ : std_logic;
SIGNAL \ALT_INV_state.wait5~q\ : std_logic;
SIGNAL \ALT_INV_Selector31~0_combout\ : std_logic;
SIGNAL \ALT_INV_tstate.standby~q\ : std_logic;
SIGNAL \ALT_INV_start~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_clear~q\ : std_logic;
SIGNAL \ALT_INV_state.timer~q\ : std_logic;
SIGNAL \key_debounce|ALT_INV_is_zero~0_combout\ : std_logic;
SIGNAL \key_debounce|ALT_INV_output~0_combout\ : std_logic;
SIGNAL \key_debounce|ALT_INV_shift\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_state.wait8~q\ : std_logic;
SIGNAL \ALT_INV_tstate.check~q\ : std_logic;
SIGNAL \ALT_INV_tstate.count~q\ : std_logic;
SIGNAL \ALT_INV_tstate.done~q\ : std_logic;
SIGNAL \ALT_INV_state.wait3~q\ : std_logic;
SIGNAL \ALT_INV_state.wait7~q\ : std_logic;
SIGNAL \key_debounce|ALT_INV_output~q\ : std_logic;
SIGNAL \ALT_INV_Selector50~0_combout\ : std_logic;
SIGNAL \ALT_INV_state.blink3a~q\ : std_logic;
SIGNAL \ALT_INV_state.blink1a~q\ : std_logic;
SIGNAL \ALT_INV_state.blink2a~q\ : std_logic;
SIGNAL \ALT_INV_WideOr8~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector51~0_combout\ : std_logic;
SIGNAL \ALT_INV_state.blink4~q\ : std_logic;
SIGNAL \ALT_INV_state.blink2~q\ : std_logic;
SIGNAL \ALT_INV_Selector53~0_combout\ : std_logic;
SIGNAL \ALT_INV_state.blink3~q\ : std_logic;

BEGIN

ww_clock_50 <= clock_50;
ww_KEY <= KEY;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_state.blink1~q\ <= NOT \state.blink1~q\;
\ALT_INV_state.blink4a~q\ <= NOT \state.blink4a~q\;
\ALT_INV_timeup~q\ <= NOT \timeup~q\;
\ALT_INV_state.wait4~q\ <= NOT \state.wait4~q\;
\ALT_INV_LEDR[8]~reg0_q\ <= NOT \LEDR[8]~reg0_q\;
\ALT_INV_LEDR[7]~reg0_q\ <= NOT \LEDR[7]~reg0_q\;
\ALT_INV_LEDR[6]~reg0_q\ <= NOT \LEDR[6]~reg0_q\;
\ALT_INV_LEDR[0]~reg0_q\ <= NOT \LEDR[0]~reg0_q\;
\ALT_INV_timer_FSM:cnt[15]~q\ <= NOT \timer_FSM:cnt[15]~q\;
\ALT_INV_timer_FSM:cnt[25]~q\ <= NOT \timer_FSM:cnt[25]~q\;
\ALT_INV_timer_FSM:cnt[24]~q\ <= NOT \timer_FSM:cnt[24]~q\;
\ALT_INV_timer_FSM:cnt[23]~q\ <= NOT \timer_FSM:cnt[23]~q\;
\ALT_INV_timer_FSM:cnt[22]~q\ <= NOT \timer_FSM:cnt[22]~q\;
\ALT_INV_timer_FSM:cnt[21]~q\ <= NOT \timer_FSM:cnt[21]~q\;
\ALT_INV_timer_FSM:cnt[20]~q\ <= NOT \timer_FSM:cnt[20]~q\;
\ALT_INV_timer_FSM:cnt[19]~q\ <= NOT \timer_FSM:cnt[19]~q\;
\ALT_INV_timer_FSM:cnt[18]~q\ <= NOT \timer_FSM:cnt[18]~q\;
\ALT_INV_timer_FSM:cnt[17]~q\ <= NOT \timer_FSM:cnt[17]~q\;
\ALT_INV_timer_FSM:cnt[16]~q\ <= NOT \timer_FSM:cnt[16]~q\;
\ALT_INV_timer_FSM:cnt[0]~q\ <= NOT \timer_FSM:cnt[0]~q\;
\ALT_INV_timer_FSM:cnt[4]~q\ <= NOT \timer_FSM:cnt[4]~q\;
\ALT_INV_timer_FSM:cnt[3]~q\ <= NOT \timer_FSM:cnt[3]~q\;
\ALT_INV_timer_FSM:cnt[2]~q\ <= NOT \timer_FSM:cnt[2]~q\;
\ALT_INV_timer_FSM:cnt[1]~q\ <= NOT \timer_FSM:cnt[1]~q\;
\ALT_INV_timer_FSM:cnt[12]~q\ <= NOT \timer_FSM:cnt[12]~q\;
\ALT_INV_timer_FSM:cnt[14]~q\ <= NOT \timer_FSM:cnt[14]~q\;
\ALT_INV_timer_FSM:cnt[10]~q\ <= NOT \timer_FSM:cnt[10]~q\;
\ALT_INV_timer_FSM:cnt[9]~q\ <= NOT \timer_FSM:cnt[9]~q\;
\ALT_INV_timer_FSM:cnt[8]~q\ <= NOT \timer_FSM:cnt[8]~q\;
\ALT_INV_timer_FSM:cnt[7]~q\ <= NOT \timer_FSM:cnt[7]~q\;
\ALT_INV_timer_FSM:cnt[6]~q\ <= NOT \timer_FSM:cnt[6]~q\;
\ALT_INV_timer_FSM:cnt[5]~q\ <= NOT \timer_FSM:cnt[5]~q\;
\ALT_INV_timer_FSM:cnt[13]~q\ <= NOT \timer_FSM:cnt[13]~q\;
\ALT_INV_timer_FSM:cnt[11]~q\ <= NOT \timer_FSM:cnt[11]~q\;
\ALT_INV_state.wait6~q\ <= NOT \state.wait6~q\;
\ALT_INV_state.timer~DUPLICATE_q\ <= NOT \state.timer~DUPLICATE_q\;
\ALT_INV_state.wait3~DUPLICATE_q\ <= NOT \state.wait3~DUPLICATE_q\;
\ALT_INV_state.wait7~DUPLICATE_q\ <= NOT \state.wait7~DUPLICATE_q\;
\ALT_INV_state.blink1a~DUPLICATE_q\ <= NOT \state.blink1a~DUPLICATE_q\;
\ALT_INV_state.blink4~DUPLICATE_q\ <= NOT \state.blink4~DUPLICATE_q\;
\ALT_INV_state.blink2~DUPLICATE_q\ <= NOT \state.blink2~DUPLICATE_q\;
\ALT_INV_state.blink3~DUPLICATE_q\ <= NOT \state.blink3~DUPLICATE_q\;
\ALT_INV_state.blink1~DUPLICATE_q\ <= NOT \state.blink1~DUPLICATE_q\;
\ALT_INV_state.wait4~DUPLICATE_q\ <= NOT \state.wait4~DUPLICATE_q\;
\ALT_INV_timer_FSM:cnt[20]~DUPLICATE_q\ <= NOT \timer_FSM:cnt[20]~DUPLICATE_q\;
\ALT_INV_timer_FSM:cnt[19]~DUPLICATE_q\ <= NOT \timer_FSM:cnt[19]~DUPLICATE_q\;
\ALT_INV_timer_FSM:cnt[0]~DUPLICATE_q\ <= NOT \timer_FSM:cnt[0]~DUPLICATE_q\;
\ALT_INV_timer_FSM:cnt[1]~DUPLICATE_q\ <= NOT \timer_FSM:cnt[1]~DUPLICATE_q\;
\ALT_INV_timer_FSM:cnt[14]~DUPLICATE_q\ <= NOT \timer_FSM:cnt[14]~DUPLICATE_q\;
\ALT_INV_timer_FSM:cnt[11]~DUPLICATE_q\ <= NOT \timer_FSM:cnt[11]~DUPLICATE_q\;
\ALT_INV_state.wait6~DUPLICATE_q\ <= NOT \state.wait6~DUPLICATE_q\;
\ALT_INV_Selector32~0_combout\ <= NOT \Selector32~0_combout\;
\ALT_INV_WideOr8~1_combout\ <= NOT \WideOr8~1_combout\;
\ALT_INV_state.wait2~q\ <= NOT \state.wait2~q\;
\ALT_INV_Selector40~2_combout\ <= NOT \Selector40~2_combout\;
\ALT_INV_state.wait1~q\ <= NOT \state.wait1~q\;
\ALT_INV_Selector40~1_combout\ <= NOT \Selector40~1_combout\;
\ALT_INV_state.wait5~q\ <= NOT \state.wait5~q\;
\ALT_INV_Selector31~0_combout\ <= NOT \Selector31~0_combout\;
\ALT_INV_tstate.standby~q\ <= NOT \tstate.standby~q\;
\ALT_INV_start~q\ <= NOT \start~q\;
\ALT_INV_Equal0~4_combout\ <= NOT \Equal0~4_combout\;
\ALT_INV_Equal0~3_combout\ <= NOT \Equal0~3_combout\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_clear~q\ <= NOT \clear~q\;
\ALT_INV_state.timer~q\ <= NOT \state.timer~q\;
\key_debounce|ALT_INV_is_zero~0_combout\ <= NOT \key_debounce|is_zero~0_combout\;
\key_debounce|ALT_INV_output~0_combout\ <= NOT \key_debounce|output~0_combout\;
\key_debounce|ALT_INV_shift\(4) <= NOT \key_debounce|shift\(4);
\key_debounce|ALT_INV_shift\(3) <= NOT \key_debounce|shift\(3);
\key_debounce|ALT_INV_shift\(2) <= NOT \key_debounce|shift\(2);
\key_debounce|ALT_INV_shift\(1) <= NOT \key_debounce|shift\(1);
\key_debounce|ALT_INV_shift\(0) <= NOT \key_debounce|shift\(0);
\key_debounce|ALT_INV_shift\(7) <= NOT \key_debounce|shift\(7);
\key_debounce|ALT_INV_shift\(6) <= NOT \key_debounce|shift\(6);
\key_debounce|ALT_INV_shift\(5) <= NOT \key_debounce|shift\(5);
\ALT_INV_state.wait8~q\ <= NOT \state.wait8~q\;
\ALT_INV_tstate.check~q\ <= NOT \tstate.check~q\;
\ALT_INV_tstate.count~q\ <= NOT \tstate.count~q\;
\ALT_INV_tstate.done~q\ <= NOT \tstate.done~q\;
\ALT_INV_state.wait3~q\ <= NOT \state.wait3~q\;
\ALT_INV_state.wait7~q\ <= NOT \state.wait7~q\;
\key_debounce|ALT_INV_output~q\ <= NOT \key_debounce|output~q\;
\ALT_INV_Selector50~0_combout\ <= NOT \Selector50~0_combout\;
\ALT_INV_state.blink3a~q\ <= NOT \state.blink3a~q\;
\ALT_INV_state.blink1a~q\ <= NOT \state.blink1a~q\;
\ALT_INV_state.blink2a~q\ <= NOT \state.blink2a~q\;
\ALT_INV_WideOr8~0_combout\ <= NOT \WideOr8~0_combout\;
\ALT_INV_Selector51~0_combout\ <= NOT \Selector51~0_combout\;
\ALT_INV_state.blink4~q\ <= NOT \state.blink4~q\;
\ALT_INV_state.blink2~q\ <= NOT \state.blink2~q\;
\ALT_INV_Selector53~0_combout\ <= NOT \Selector53~0_combout\;
\ALT_INV_state.blink3~q\ <= NOT \state.blink3~q\;

-- Location: IOOBUF_X52_Y0_N2
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X52_Y0_N19
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X60_Y0_N2
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X80_Y0_N2
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X60_Y0_N19
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X80_Y0_N19
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X84_Y0_N2
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR[6]~reg0_q\,
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X89_Y6_N5
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR[7]~reg0_q\,
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X89_Y8_N5
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR[8]~reg0_q\,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X89_Y6_N22
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_LEDR(9));

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

-- Location: FF_X42_Y2_N35
\key_debounce|shift[0]\ : dffeas
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
	q => \key_debounce|shift\(0));

-- Location: FF_X42_Y2_N56
\key_debounce|shift[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \key_debounce|shift\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(1));

-- Location: FF_X42_Y2_N29
\key_debounce|shift[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \key_debounce|shift\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(2));

-- Location: FF_X42_Y2_N22
\key_debounce|shift[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \key_debounce|shift\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(3));

-- Location: LABCELL_X42_Y2_N39
\key_debounce|shift[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \key_debounce|shift[4]~feeder_combout\ = ( \key_debounce|shift\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \key_debounce|ALT_INV_shift\(3),
	combout => \key_debounce|shift[4]~feeder_combout\);

-- Location: FF_X42_Y2_N40
\key_debounce|shift[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \key_debounce|shift[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(4));

-- Location: LABCELL_X42_Y2_N57
\key_debounce|output~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \key_debounce|output~0_combout\ = ( \key_debounce|shift\(1) & ( \key_debounce|shift\(0) & ( (\key_debounce|shift\(2) & (\key_debounce|shift\(4) & \key_debounce|shift\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \key_debounce|ALT_INV_shift\(2),
	datab => \key_debounce|ALT_INV_shift\(4),
	datac => \key_debounce|ALT_INV_shift\(3),
	datae => \key_debounce|ALT_INV_shift\(1),
	dataf => \key_debounce|ALT_INV_shift\(0),
	combout => \key_debounce|output~0_combout\);

-- Location: LABCELL_X42_Y2_N24
\key_debounce|is_zero~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \key_debounce|is_zero~0_combout\ = ( !\key_debounce|shift\(1) & ( (!\key_debounce|shift\(2) & (!\key_debounce|shift\(3) & (!\key_debounce|shift\(0) & !\key_debounce|shift\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \key_debounce|ALT_INV_shift\(2),
	datab => \key_debounce|ALT_INV_shift\(3),
	datac => \key_debounce|ALT_INV_shift\(0),
	datad => \key_debounce|ALT_INV_shift\(4),
	datae => \key_debounce|ALT_INV_shift\(1),
	combout => \key_debounce|is_zero~0_combout\);

-- Location: FF_X42_Y2_N53
\key_debounce|shift[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \key_debounce|shift\(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(5));

-- Location: FF_X42_Y2_N59
\key_debounce|shift[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \key_debounce|shift\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(6));

-- Location: FF_X42_Y2_N16
\key_debounce|shift[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \key_debounce|shift\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|shift\(7));

-- Location: LABCELL_X42_Y2_N48
\key_debounce|output~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \key_debounce|output~1_combout\ = ( \key_debounce|output~q\ & ( \key_debounce|shift\(7) ) ) # ( !\key_debounce|output~q\ & ( \key_debounce|shift\(7) & ( (\key_debounce|output~0_combout\ & (\key_debounce|shift\(5) & \key_debounce|shift\(6))) ) ) ) # ( 
-- \key_debounce|output~q\ & ( !\key_debounce|shift\(7) & ( (!\key_debounce|is_zero~0_combout\) # ((\key_debounce|shift\(6)) # (\key_debounce|shift\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011111111111100000000000001011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \key_debounce|ALT_INV_output~0_combout\,
	datab => \key_debounce|ALT_INV_is_zero~0_combout\,
	datac => \key_debounce|ALT_INV_shift\(5),
	datad => \key_debounce|ALT_INV_shift\(6),
	datae => \key_debounce|ALT_INV_output~q\,
	dataf => \key_debounce|ALT_INV_shift\(7),
	combout => \key_debounce|output~1_combout\);

-- Location: FF_X42_Y2_N50
\key_debounce|output\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \key_debounce|output~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key_debounce|output~q\);

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

-- Location: FF_X42_Y3_N5
\state.wait4~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector36~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait4~DUPLICATE_q\);

-- Location: FF_X42_Y3_N26
\state.wait3~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector35~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait3~DUPLICATE_q\);

-- Location: LABCELL_X42_Y3_N36
\Selector40~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector40~2_combout\ = ( \state.wait8~q\ & ( (!\state.wait3~DUPLICATE_q\ & \state.wait1~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.wait3~DUPLICATE_q\,
	datac => \ALT_INV_state.wait1~q\,
	dataf => \ALT_INV_state.wait8~q\,
	combout => \Selector40~2_combout\);

-- Location: FF_X43_Y3_N50
\state.blink1a~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector45~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink1a~DUPLICATE_q\);

-- Location: LABCELL_X43_Y3_N54
\Selector31~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector31~0_combout\ = ( !\state.blink2a~q\ & ( (!\state.blink3a~q\ & (!\state.blink1a~DUPLICATE_q\ & !\state.blink4a~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000110000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_state.blink3a~q\,
	datac => \ALT_INV_state.blink1a~DUPLICATE_q\,
	datad => \ALT_INV_state.blink4a~q\,
	dataf => \ALT_INV_state.blink2a~q\,
	combout => \Selector31~0_combout\);

-- Location: LABCELL_X42_Y3_N27
\Selector38~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector38~7_combout\ = ( \state.wait5~q\ ) # ( !\state.wait5~q\ & ( \state.wait6~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_state.wait6~q\,
	dataf => \ALT_INV_state.wait5~q\,
	combout => \Selector38~7_combout\);

-- Location: FF_X42_Y3_N28
\state.wait6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector38~7_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \key_debounce|output~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait6~q\);

-- Location: LABCELL_X42_Y3_N15
\Selector39~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector39~0_combout\ = ( \state.wait7~q\ & ( \state.wait6~q\ & ( \key_debounce|output~q\ ) ) ) # ( !\state.wait7~q\ & ( \state.wait6~q\ & ( \key_debounce|output~q\ ) ) ) # ( \state.wait7~q\ & ( !\state.wait6~q\ & ( (!\timeup~q\ & 
-- \key_debounce|output~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011000000110000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeup~q\,
	datac => \key_debounce|ALT_INV_output~q\,
	datae => \ALT_INV_state.wait7~q\,
	dataf => \ALT_INV_state.wait6~q\,
	combout => \Selector39~0_combout\);

-- Location: FF_X42_Y3_N17
\state.wait7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector39~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait7~q\);

-- Location: LABCELL_X42_Y3_N0
\Selector37~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector37~0_combout\ = ( \timeup~q\ & ( (\key_debounce|output~q\ & (((\state.wait5~q\) # (\state.wait4~DUPLICATE_q\)) # (\state.wait7~q\))) ) ) # ( !\timeup~q\ & ( (\key_debounce|output~q\ & ((\state.wait5~q\) # (\state.wait4~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010101000001010101010100010101010101010001010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \key_debounce|ALT_INV_output~q\,
	datab => \ALT_INV_state.wait7~q\,
	datac => \ALT_INV_state.wait4~DUPLICATE_q\,
	datad => \ALT_INV_state.wait5~q\,
	dataf => \ALT_INV_timeup~q\,
	combout => \Selector37~0_combout\);

-- Location: FF_X42_Y3_N2
\state.wait5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector37~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait5~q\);

-- Location: FF_X42_Y3_N56
\state.blink1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector41~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink1~q\);

-- Location: LABCELL_X42_Y3_N45
\Selector34~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector34~0_combout\ = ( \Selector40~1_combout\ & ( (!\key_debounce|output~q\ & ((!\state.wait1~q\) # (\state.wait2~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011000000110011001100000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \key_debounce|ALT_INV_output~q\,
	datac => \ALT_INV_state.wait1~q\,
	datad => \ALT_INV_state.wait2~q\,
	dataf => \ALT_INV_Selector40~1_combout\,
	combout => \Selector34~0_combout\);

-- Location: FF_X42_Y3_N47
\state.wait2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector34~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait2~q\);

-- Location: LABCELL_X42_Y3_N57
\Selector38~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector38~8_combout\ = (\key_debounce|output~q\ & \state.wait2~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \key_debounce|ALT_INV_output~q\,
	datac => \ALT_INV_state.wait2~q\,
	combout => \Selector38~8_combout\);

-- Location: FF_X42_Y3_N59
\state.timer\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector38~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.timer~q\);

-- Location: LABCELL_X42_Y3_N21
\Selector40~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector40~1_combout\ = ( !\state.timer~q\ & ( !\state.blink3~DUPLICATE_q\ & ( (!\state.blink4~DUPLICATE_q\ & (!\state.blink2~DUPLICATE_q\ & (!\state.wait5~q\ & !\state.blink1~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.blink4~DUPLICATE_q\,
	datab => \ALT_INV_state.blink2~DUPLICATE_q\,
	datac => \ALT_INV_state.wait5~q\,
	datad => \ALT_INV_state.blink1~q\,
	datae => \ALT_INV_state.timer~q\,
	dataf => \ALT_INV_state.blink3~DUPLICATE_q\,
	combout => \Selector40~1_combout\);

-- Location: FF_X42_Y3_N16
\state.wait7~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector39~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait7~DUPLICATE_q\);

-- Location: LABCELL_X42_Y3_N30
\Selector40~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector40~3_combout\ = ( \Selector40~1_combout\ & ( \state.wait7~DUPLICATE_q\ & ( !\key_debounce|output~q\ ) ) ) # ( !\Selector40~1_combout\ & ( \state.wait7~DUPLICATE_q\ & ( !\key_debounce|output~q\ ) ) ) # ( \Selector40~1_combout\ & ( 
-- !\state.wait7~DUPLICATE_q\ & ( (!\key_debounce|output~q\ & (\Selector40~2_combout\ & ((!\timeup~q\) # (\Selector31~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010000000110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timeup~q\,
	datab => \key_debounce|ALT_INV_output~q\,
	datac => \ALT_INV_Selector40~2_combout\,
	datad => \ALT_INV_Selector31~0_combout\,
	datae => \ALT_INV_Selector40~1_combout\,
	dataf => \ALT_INV_state.wait7~DUPLICATE_q\,
	combout => \Selector40~3_combout\);

-- Location: FF_X42_Y3_N31
\state.wait8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector40~3_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait8~q\);

-- Location: LABCELL_X42_Y3_N54
\Selector41~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector41~0_combout\ = ( \state.wait8~q\ & ( \key_debounce|output~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \key_debounce|ALT_INV_output~q\,
	dataf => \ALT_INV_state.wait8~q\,
	combout => \Selector41~0_combout\);

-- Location: FF_X42_Y3_N55
\state.blink1~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector41~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink1~DUPLICATE_q\);

-- Location: LABCELL_X43_Y3_N48
\Selector45~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector45~0_combout\ = ( \state.blink1~DUPLICATE_q\ ) # ( !\state.blink1~DUPLICATE_q\ & ( (!\timeup~q\ & \state.blink1a~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeup~q\,
	datad => \ALT_INV_state.blink1a~q\,
	dataf => \ALT_INV_state.blink1~DUPLICATE_q\,
	combout => \Selector45~0_combout\);

-- Location: FF_X43_Y3_N49
\state.blink1a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector45~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink1a~q\);

-- Location: LABCELL_X43_Y3_N24
\Selector42~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector42~0_combout\ = ( \state.blink1a~q\ & ( \timeup~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeup~q\,
	dataf => \ALT_INV_state.blink1a~q\,
	combout => \Selector42~0_combout\);

-- Location: FF_X43_Y3_N25
\state.blink2~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector42~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink2~DUPLICATE_q\);

-- Location: LABCELL_X43_Y3_N9
\Selector46~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector46~0_combout\ = ( \state.blink2~DUPLICATE_q\ ) # ( !\state.blink2~DUPLICATE_q\ & ( (!\timeup~q\ & \state.blink2a~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timeup~q\,
	datad => \ALT_INV_state.blink2a~q\,
	dataf => \ALT_INV_state.blink2~DUPLICATE_q\,
	combout => \Selector46~0_combout\);

-- Location: FF_X43_Y3_N11
\state.blink2a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector46~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink2a~q\);

-- Location: LABCELL_X43_Y3_N27
\Selector43~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector43~0_combout\ = ( \state.blink2a~q\ & ( \timeup~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeup~q\,
	dataf => \ALT_INV_state.blink2a~q\,
	combout => \Selector43~0_combout\);

-- Location: FF_X43_Y3_N29
\state.blink3~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector43~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink3~DUPLICATE_q\);

-- Location: LABCELL_X43_Y3_N15
\Selector47~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector47~0_combout\ = ( \state.blink3~DUPLICATE_q\ ) # ( !\state.blink3~DUPLICATE_q\ & ( (!\timeup~q\ & \state.blink3a~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeup~q\,
	datad => \ALT_INV_state.blink3a~q\,
	dataf => \ALT_INV_state.blink3~DUPLICATE_q\,
	combout => \Selector47~0_combout\);

-- Location: FF_X43_Y3_N17
\state.blink3a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector47~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink3a~q\);

-- Location: LABCELL_X43_Y3_N12
\Selector44~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector44~0_combout\ = ( \state.blink3a~q\ & ( \timeup~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timeup~q\,
	dataf => \ALT_INV_state.blink3a~q\,
	combout => \Selector44~0_combout\);

-- Location: FF_X43_Y3_N13
\state.blink4~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector44~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink4~DUPLICATE_q\);

-- Location: LABCELL_X43_Y3_N3
\Selector48~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector48~0_combout\ = ( \state.blink4~DUPLICATE_q\ ) # ( !\state.blink4~DUPLICATE_q\ & ( (!\timeup~q\ & \state.blink4a~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timeup~q\,
	datad => \ALT_INV_state.blink4a~q\,
	dataf => \ALT_INV_state.blink4~DUPLICATE_q\,
	combout => \Selector48~0_combout\);

-- Location: FF_X43_Y3_N5
\state.blink4a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector48~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink4a~q\);

-- Location: LABCELL_X42_Y3_N39
\Selector33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector33~0_combout\ = ( \state.blink4a~q\ & ( (!\timeup~q\ & \state.wait1~q\) ) ) # ( !\state.blink4a~q\ & ( (!\key_debounce|output~q\) # ((\state.wait1~q\ & ((!\state.wait3~DUPLICATE_q\) # (!\timeup~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011111110111100001111111000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.wait3~DUPLICATE_q\,
	datab => \ALT_INV_timeup~q\,
	datac => \key_debounce|ALT_INV_output~q\,
	datad => \ALT_INV_state.wait1~q\,
	dataf => \ALT_INV_state.blink4a~q\,
	combout => \Selector33~0_combout\);

-- Location: FF_X42_Y3_N41
\state.wait1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector33~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait1~q\);

-- Location: LABCELL_X42_Y3_N6
\Selector31~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector31~1_combout\ = ( !\clear~q\ & ( ((!\timeup~q\ & (!\key_debounce|output~q\ & ((\state.wait7~DUPLICATE_q\)))) # (\timeup~q\ & (((!\Selector31~0_combout\) # (\state.wait7~DUPLICATE_q\))))) # (\state.wait4~DUPLICATE_q\) ) ) # ( \clear~q\ & ( 
-- (((!\Selector31~0_combout\ & (\timeup~q\)) # (\Selector31~0_combout\ & ((\state.wait1~q\)))) # (\state.wait7~DUPLICATE_q\)) # (\state.wait4~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0111011101010101011101110101111111110111111101111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.wait4~DUPLICATE_q\,
	datab => \ALT_INV_timeup~q\,
	datac => \ALT_INV_state.wait1~q\,
	datad => \ALT_INV_Selector31~0_combout\,
	datae => \ALT_INV_clear~q\,
	dataf => \ALT_INV_state.wait7~DUPLICATE_q\,
	datag => \key_debounce|ALT_INV_output~q\,
	combout => \Selector31~1_combout\);

-- Location: FF_X42_Y3_N7
clear : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector31~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clear~q\);

-- Location: FF_X43_Y3_N26
\state.blink2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector42~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink2~q\);

-- Location: FF_X43_Y3_N14
\state.blink4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector44~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink4~q\);

-- Location: FF_X42_Y3_N58
\state.timer~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector38~8_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.timer~DUPLICATE_q\);

-- Location: FF_X43_Y3_N28
\state.blink3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector43~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.blink3~q\);

-- Location: LABCELL_X43_Y3_N42
\WideOr8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr8~1_combout\ = ( !\state.blink1~DUPLICATE_q\ & ( !\state.blink3~q\ & ( (!\state.blink2~q\ & (!\state.blink4~q\ & !\state.timer~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.blink2~q\,
	datab => \ALT_INV_state.blink4~q\,
	datad => \ALT_INV_state.timer~DUPLICATE_q\,
	datae => \ALT_INV_state.blink1~DUPLICATE_q\,
	dataf => \ALT_INV_state.blink3~q\,
	combout => \WideOr8~1_combout\);

-- Location: LABCELL_X42_Y3_N42
\Selector32~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector32~0_combout\ = (!\state.wait8~q\ & (!\state.wait4~DUPLICATE_q\ & !\state.wait2~q\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.wait8~q\,
	datac => \ALT_INV_state.wait4~DUPLICATE_q\,
	datad => \ALT_INV_state.wait2~q\,
	combout => \Selector32~0_combout\);

-- Location: FF_X42_Y3_N29
\state.wait6~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector38~7_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \key_debounce|output~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait6~DUPLICATE_q\);

-- Location: LABCELL_X42_Y3_N48
\Selector32~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector32~1_combout\ = ( \start~q\ & ( \state.wait6~DUPLICATE_q\ ) ) # ( !\start~q\ & ( \state.wait6~DUPLICATE_q\ & ( (!\WideOr8~1_combout\) # (\key_debounce|output~q\) ) ) ) # ( \start~q\ & ( !\state.wait6~DUPLICATE_q\ & ( (!\WideOr8~1_combout\) # 
-- ((!\Selector32~0_combout\) # (\state.wait5~q\)) ) ) ) # ( !\start~q\ & ( !\state.wait6~DUPLICATE_q\ & ( !\WideOr8~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010111011111110111110101010111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr8~1_combout\,
	datab => \ALT_INV_Selector32~0_combout\,
	datac => \ALT_INV_state.wait5~q\,
	datad => \key_debounce|ALT_INV_output~q\,
	datae => \ALT_INV_start~q\,
	dataf => \ALT_INV_state.wait6~DUPLICATE_q\,
	combout => \Selector32~1_combout\);

-- Location: FF_X42_Y3_N49
start : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector32~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start~q\);

-- Location: LABCELL_X43_Y2_N6
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \tstate.count~q\ & ( (!\clear~q\) # ((\start~q\ & !\tstate.standby~q\)) ) ) # ( !\tstate.count~q\ & ( (!\start~q\ & (!\clear~q\ & (\tstate.check~q\))) # (\start~q\ & ((!\tstate.standby~q\) # ((!\clear~q\ & \tstate.check~q\)))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110100001100010111010000110011011101110011001101110111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_start~q\,
	datab => \ALT_INV_clear~q\,
	datac => \ALT_INV_tstate.check~q\,
	datad => \ALT_INV_tstate.standby~q\,
	dataf => \ALT_INV_tstate.count~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X43_Y2_N8
\tstate.standby\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector1~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tstate.standby~q\);

-- Location: LABCELL_X43_Y2_N30
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( \timer_FSM:cnt[0]~q\ ) + ( VCC ) + ( !VCC ))
-- \Add0~58\ = CARRY(( \timer_FSM:cnt[0]~q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[0]~q\,
	cin => GND,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: LABCELL_X43_Y2_N12
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \Equal0~4_combout\ & ( (!\clear~q\ & \tstate.check~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_clear~q\,
	datac => \ALT_INV_tstate.check~q\,
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X43_Y2_N14
\tstate.done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector4~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tstate.done~q\);

-- Location: LABCELL_X43_Y2_N0
\timer_FSM:cnt[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \timer_FSM:cnt[0]~0_combout\ = ( \tstate.standby~q\ & ( (!\tstate.done~q\ & !\tstate.check~q\) ) ) # ( !\tstate.standby~q\ & ( (!\tstate.done~q\ & (\start~q\ & !\tstate.check~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000000000011000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_tstate.done~q\,
	datac => \ALT_INV_start~q\,
	datad => \ALT_INV_tstate.check~q\,
	dataf => \ALT_INV_tstate.standby~q\,
	combout => \timer_FSM:cnt[0]~0_combout\);

-- Location: FF_X43_Y2_N31
\timer_FSM:cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[0]~q\);

-- Location: LABCELL_X43_Y2_N33
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( \timer_FSM:cnt[1]~q\ ) + ( GND ) + ( \Add0~58\ ))
-- \Add0~42\ = CARRY(( \timer_FSM:cnt[1]~q\ ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timer_FSM:cnt[1]~q\,
	cin => \Add0~58\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X43_Y2_N35
\timer_FSM:cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[1]~q\);

-- Location: LABCELL_X43_Y2_N36
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( \timer_FSM:cnt[2]~q\ ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~46\ = CARRY(( \timer_FSM:cnt[2]~q\ ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[2]~q\,
	cin => \Add0~42\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X43_Y2_N38
\timer_FSM:cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[2]~q\);

-- Location: LABCELL_X43_Y2_N39
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( \timer_FSM:cnt[3]~q\ ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~50\ = CARRY(( \timer_FSM:cnt[3]~q\ ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[3]~q\,
	cin => \Add0~46\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X43_Y2_N41
\timer_FSM:cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[3]~q\);

-- Location: LABCELL_X43_Y2_N42
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( \timer_FSM:cnt[4]~q\ ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~54\ = CARRY(( \timer_FSM:cnt[4]~q\ ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[4]~q\,
	cin => \Add0~50\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X43_Y2_N43
\timer_FSM:cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[4]~q\);

-- Location: FF_X43_Y2_N34
\timer_FSM:cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[1]~DUPLICATE_q\);

-- Location: LABCELL_X43_Y2_N45
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \timer_FSM:cnt[5]~q\ ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~10\ = CARRY(( \timer_FSM:cnt[5]~q\ ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[5]~q\,
	cin => \Add0~54\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X43_Y2_N47
\timer_FSM:cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[5]~q\);

-- Location: LABCELL_X43_Y2_N48
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \timer_FSM:cnt[6]~q\ ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( \timer_FSM:cnt[6]~q\ ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[6]~q\,
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X43_Y2_N50
\timer_FSM:cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[6]~q\);

-- Location: LABCELL_X43_Y2_N51
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \timer_FSM:cnt[7]~q\ ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( \timer_FSM:cnt[7]~q\ ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[7]~q\,
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X43_Y2_N52
\timer_FSM:cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[7]~q\);

-- Location: LABCELL_X43_Y2_N54
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \timer_FSM:cnt[8]~q\ ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( \timer_FSM:cnt[8]~q\ ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[8]~q\,
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X43_Y2_N56
\timer_FSM:cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[8]~q\);

-- Location: LABCELL_X43_Y2_N57
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \timer_FSM:cnt[9]~q\ ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( \timer_FSM:cnt[9]~q\ ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[9]~q\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X43_Y2_N59
\timer_FSM:cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[9]~q\);

-- Location: LABCELL_X43_Y1_N0
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( \timer_FSM:cnt[10]~q\ ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( \timer_FSM:cnt[10]~q\ ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[10]~q\,
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X43_Y1_N2
\timer_FSM:cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[10]~q\);

-- Location: LABCELL_X43_Y1_N3
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \timer_FSM:cnt[11]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~2\ = CARRY(( \timer_FSM:cnt[11]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[11]~DUPLICATE_q\,
	cin => \Add0~30\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X43_Y1_N5
\timer_FSM:cnt[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[11]~DUPLICATE_q\);

-- Location: LABCELL_X43_Y1_N6
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( \timer_FSM:cnt[12]~q\ ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~38\ = CARRY(( \timer_FSM:cnt[12]~q\ ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[12]~q\,
	cin => \Add0~2\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X43_Y1_N7
\timer_FSM:cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[12]~q\);

-- Location: FF_X43_Y1_N14
\timer_FSM:cnt[14]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[14]~DUPLICATE_q\);

-- Location: LABCELL_X43_Y1_N9
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \timer_FSM:cnt[13]~q\ ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~6\ = CARRY(( \timer_FSM:cnt[13]~q\ ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[13]~q\,
	cin => \Add0~38\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X43_Y1_N11
\timer_FSM:cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[13]~q\);

-- Location: LABCELL_X43_Y1_N12
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( \timer_FSM:cnt[14]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~34\ = CARRY(( \timer_FSM:cnt[14]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timer_FSM:cnt[14]~DUPLICATE_q\,
	cin => \Add0~6\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X43_Y1_N13
\timer_FSM:cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[14]~q\);

-- Location: LABCELL_X43_Y2_N18
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( \timer_FSM:cnt[12]~q\ & ( \timer_FSM:cnt[14]~q\ & ( (\timer_FSM:cnt[2]~q\ & (\timer_FSM:cnt[4]~q\ & (\timer_FSM:cnt[1]~DUPLICATE_q\ & \timer_FSM:cnt[3]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timer_FSM:cnt[2]~q\,
	datab => \ALT_INV_timer_FSM:cnt[4]~q\,
	datac => \ALT_INV_timer_FSM:cnt[1]~DUPLICATE_q\,
	datad => \ALT_INV_timer_FSM:cnt[3]~q\,
	datae => \ALT_INV_timer_FSM:cnt[12]~q\,
	dataf => \ALT_INV_timer_FSM:cnt[14]~q\,
	combout => \Equal0~1_combout\);

-- Location: FF_X43_Y1_N4
\timer_FSM:cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[11]~q\);

-- Location: LABCELL_X42_Y2_N42
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\timer_FSM:cnt[9]~q\ & ( !\timer_FSM:cnt[10]~q\ & ( (!\timer_FSM:cnt[7]~q\ & (!\timer_FSM:cnt[8]~q\ & (\timer_FSM:cnt[5]~q\ & \timer_FSM:cnt[6]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timer_FSM:cnt[7]~q\,
	datab => \ALT_INV_timer_FSM:cnt[8]~q\,
	datac => \ALT_INV_timer_FSM:cnt[5]~q\,
	datad => \ALT_INV_timer_FSM:cnt[6]~q\,
	datae => \ALT_INV_timer_FSM:cnt[9]~q\,
	dataf => \ALT_INV_timer_FSM:cnt[10]~q\,
	combout => \Equal0~0_combout\);

-- Location: FF_X43_Y2_N32
\timer_FSM:cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[0]~DUPLICATE_q\);

-- Location: FF_X43_Y1_N31
\timer_FSM:cnt[20]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[20]~DUPLICATE_q\);

-- Location: LABCELL_X43_Y1_N15
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( \timer_FSM:cnt[15]~q\ ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~102\ = CARRY(( \timer_FSM:cnt[15]~q\ ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[15]~q\,
	cin => \Add0~34\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\);

-- Location: FF_X43_Y1_N17
\timer_FSM:cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~101_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[15]~q\);

-- Location: LABCELL_X43_Y1_N18
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( \timer_FSM:cnt[16]~q\ ) + ( GND ) + ( \Add0~102\ ))
-- \Add0~62\ = CARRY(( \timer_FSM:cnt[16]~q\ ) + ( GND ) + ( \Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[16]~q\,
	cin => \Add0~102\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X43_Y1_N20
\timer_FSM:cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[16]~q\);

-- Location: LABCELL_X43_Y1_N21
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( \timer_FSM:cnt[17]~q\ ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~66\ = CARRY(( \timer_FSM:cnt[17]~q\ ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[17]~q\,
	cin => \Add0~62\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X43_Y1_N23
\timer_FSM:cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[17]~q\);

-- Location: LABCELL_X43_Y1_N24
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( \timer_FSM:cnt[18]~q\ ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~70\ = CARRY(( \timer_FSM:cnt[18]~q\ ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[18]~q\,
	cin => \Add0~66\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X43_Y1_N26
\timer_FSM:cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[18]~q\);

-- Location: LABCELL_X43_Y1_N27
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( \timer_FSM:cnt[19]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~74\ = CARRY(( \timer_FSM:cnt[19]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_timer_FSM:cnt[19]~DUPLICATE_q\,
	cin => \Add0~70\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X43_Y1_N29
\timer_FSM:cnt[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[19]~DUPLICATE_q\);

-- Location: LABCELL_X43_Y1_N30
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( \timer_FSM:cnt[20]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~78\ = CARRY(( \timer_FSM:cnt[20]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[20]~DUPLICATE_q\,
	cin => \Add0~74\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X43_Y1_N32
\timer_FSM:cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[20]~q\);

-- Location: FF_X43_Y1_N28
\timer_FSM:cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[19]~q\);

-- Location: LABCELL_X43_Y1_N48
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( \timer_FSM:cnt[17]~q\ & ( !\timer_FSM:cnt[16]~q\ & ( (\timer_FSM:cnt[0]~DUPLICATE_q\ & (\timer_FSM:cnt[20]~q\ & (!\timer_FSM:cnt[18]~q\ & \timer_FSM:cnt[19]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timer_FSM:cnt[0]~DUPLICATE_q\,
	datab => \ALT_INV_timer_FSM:cnt[20]~q\,
	datac => \ALT_INV_timer_FSM:cnt[18]~q\,
	datad => \ALT_INV_timer_FSM:cnt[19]~q\,
	datae => \ALT_INV_timer_FSM:cnt[17]~q\,
	dataf => \ALT_INV_timer_FSM:cnt[16]~q\,
	combout => \Equal0~2_combout\);

-- Location: LABCELL_X43_Y1_N33
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( \timer_FSM:cnt[21]~q\ ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~82\ = CARRY(( \timer_FSM:cnt[21]~q\ ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timer_FSM:cnt[21]~q\,
	cin => \Add0~78\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X43_Y1_N35
\timer_FSM:cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~81_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[21]~q\);

-- Location: LABCELL_X43_Y1_N36
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \timer_FSM:cnt[22]~q\ ) + ( GND ) + ( \Add0~82\ ))
-- \Add0~86\ = CARRY(( \timer_FSM:cnt[22]~q\ ) + ( GND ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[22]~q\,
	cin => \Add0~82\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X43_Y1_N38
\timer_FSM:cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[22]~q\);

-- Location: LABCELL_X43_Y1_N39
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( \timer_FSM:cnt[23]~q\ ) + ( GND ) + ( \Add0~86\ ))
-- \Add0~90\ = CARRY(( \timer_FSM:cnt[23]~q\ ) + ( GND ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[23]~q\,
	cin => \Add0~86\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X43_Y1_N41
\timer_FSM:cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[23]~q\);

-- Location: LABCELL_X43_Y1_N42
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( \timer_FSM:cnt[24]~q\ ) + ( GND ) + ( \Add0~90\ ))
-- \Add0~94\ = CARRY(( \timer_FSM:cnt[24]~q\ ) + ( GND ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_timer_FSM:cnt[24]~q\,
	cin => \Add0~90\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X43_Y1_N44
\timer_FSM:cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[24]~q\);

-- Location: LABCELL_X43_Y1_N45
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( \timer_FSM:cnt[25]~q\ ) + ( GND ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_timer_FSM:cnt[25]~q\,
	cin => \Add0~94\,
	sumout => \Add0~97_sumout\);

-- Location: FF_X43_Y1_N47
\timer_FSM:cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \ALT_INV_tstate.count~q\,
	ena => \timer_FSM:cnt[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer_FSM:cnt[25]~q\);

-- Location: LABCELL_X43_Y1_N54
\Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ( \timer_FSM:cnt[25]~q\ & ( !\timer_FSM:cnt[24]~q\ & ( (\timer_FSM:cnt[22]~q\ & (\timer_FSM:cnt[15]~q\ & (\timer_FSM:cnt[21]~q\ & \timer_FSM:cnt[23]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_timer_FSM:cnt[22]~q\,
	datab => \ALT_INV_timer_FSM:cnt[15]~q\,
	datac => \ALT_INV_timer_FSM:cnt[21]~q\,
	datad => \ALT_INV_timer_FSM:cnt[23]~q\,
	datae => \ALT_INV_timer_FSM:cnt[25]~q\,
	dataf => \ALT_INV_timer_FSM:cnt[24]~q\,
	combout => \Equal0~3_combout\);

-- Location: LABCELL_X43_Y2_N24
\Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = ( \Equal0~2_combout\ & ( \Equal0~3_combout\ & ( (\Equal0~1_combout\ & (!\timer_FSM:cnt[11]~q\ & (\timer_FSM:cnt[13]~q\ & \Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~1_combout\,
	datab => \ALT_INV_timer_FSM:cnt[11]~q\,
	datac => \ALT_INV_timer_FSM:cnt[13]~q\,
	datad => \ALT_INV_Equal0~0_combout\,
	datae => \ALT_INV_Equal0~2_combout\,
	dataf => \ALT_INV_Equal0~3_combout\,
	combout => \Equal0~4_combout\);

-- Location: LABCELL_X43_Y2_N9
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \Equal0~4_combout\ & ( (\start~q\ & !\tstate.standby~q\) ) ) # ( !\Equal0~4_combout\ & ( (!\start~q\ & (!\clear~q\ & ((\tstate.check~q\)))) # (\start~q\ & ((!\tstate.standby~q\) # ((!\clear~q\ & \tstate.check~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011011100010100001101110001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_start~q\,
	datab => \ALT_INV_clear~q\,
	datac => \ALT_INV_tstate.standby~q\,
	datad => \ALT_INV_tstate.check~q\,
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \Selector2~0_combout\);

-- Location: FF_X43_Y2_N11
\tstate.count\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tstate.count~q\);

-- Location: LABCELL_X43_Y2_N3
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \tstate.count~q\ & ( !\clear~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_clear~q\,
	dataf => \ALT_INV_tstate.count~q\,
	combout => \Selector3~0_combout\);

-- Location: FF_X43_Y2_N5
\tstate.check\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector3~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tstate.check~q\);

-- Location: LABCELL_X43_Y2_N15
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \tstate.done~q\ ) # ( !\tstate.done~q\ & ( (\timeup~q\ & ((\tstate.count~q\) # (\tstate.check~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_tstate.check~q\,
	datac => \ALT_INV_tstate.count~q\,
	datad => \ALT_INV_timeup~q\,
	dataf => \ALT_INV_tstate.done~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X43_Y2_N16
timeup : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector0~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timeup~q\);

-- Location: LABCELL_X42_Y3_N24
\Selector35~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector35~0_combout\ = ( \state.timer~DUPLICATE_q\ ) # ( !\state.timer~DUPLICATE_q\ & ( (\key_debounce|output~q\ & (!\timeup~q\ & \state.wait3~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110000000000000011000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \key_debounce|ALT_INV_output~q\,
	datac => \ALT_INV_timeup~q\,
	datad => \ALT_INV_state.wait3~q\,
	dataf => \ALT_INV_state.timer~DUPLICATE_q\,
	combout => \Selector35~0_combout\);

-- Location: FF_X42_Y3_N25
\state.wait3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector35~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait3~q\);

-- Location: LABCELL_X42_Y3_N3
\Selector36~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = ( !\state.wait7~DUPLICATE_q\ & ( (!\key_debounce|output~q\ & ((\state.wait4~q\) # (\state.wait3~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010101010000010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \key_debounce|ALT_INV_output~q\,
	datac => \ALT_INV_state.wait3~q\,
	datad => \ALT_INV_state.wait4~q\,
	dataf => \ALT_INV_state.wait7~DUPLICATE_q\,
	combout => \Selector36~0_combout\);

-- Location: FF_X42_Y3_N4
\state.wait4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector36~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.wait4~q\);

-- Location: LABCELL_X43_Y3_N6
\Selector51~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector51~0_combout\ = ( !\state.blink4~q\ & ( !\state.blink2~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_state.blink2~q\,
	dataf => \ALT_INV_state.blink4~q\,
	combout => \Selector51~0_combout\);

-- Location: LABCELL_X43_Y3_N57
\Selector53~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector53~0_combout\ = ( \timeup~q\ & ( (!\state.blink4a~q\ & (!\state.blink3~q\ & !\state.blink1~DUPLICATE_q\)) ) ) # ( !\timeup~q\ & ( ((!\state.blink3~q\ & !\state.blink1~DUPLICATE_q\)) # (\state.blink4a~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010101010101111101010101010110100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.blink4a~q\,
	datac => \ALT_INV_state.blink3~q\,
	datad => \ALT_INV_state.blink1~DUPLICATE_q\,
	dataf => \ALT_INV_timeup~q\,
	combout => \Selector53~0_combout\);

-- Location: LABCELL_X43_Y3_N0
\Selector53~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector53~1_combout\ = ( \Selector53~0_combout\ & ( ((!\Selector51~0_combout\) # (\LEDR[0]~reg0_q\)) # (\state.wait4~q\) ) ) # ( !\Selector53~0_combout\ & ( (!\Selector51~0_combout\) # (\state.wait4~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001111110011111100111111001111110011111111111111001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_state.wait4~q\,
	datac => \ALT_INV_Selector51~0_combout\,
	datad => \ALT_INV_LEDR[0]~reg0_q\,
	dataf => \ALT_INV_Selector53~0_combout\,
	combout => \Selector53~1_combout\);

-- Location: FF_X43_Y3_N2
\LEDR[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector53~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LEDR[0]~reg0_q\);

-- Location: LABCELL_X43_Y3_N51
\WideOr8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideOr8~0_combout\ = ( !\state.blink2~q\ & ( (!\state.blink1~DUPLICATE_q\ & (!\state.blink4~DUPLICATE_q\ & !\state.blink3~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.blink1~DUPLICATE_q\,
	datac => \ALT_INV_state.blink4~DUPLICATE_q\,
	datad => \ALT_INV_state.blink3~DUPLICATE_q\,
	dataf => \ALT_INV_state.blink2~q\,
	combout => \WideOr8~0_combout\);

-- Location: LABCELL_X43_Y3_N18
\Selector52~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector52~0_combout\ = ( \state.blink2a~q\ & ( !\WideOr8~0_combout\ ) ) # ( !\state.blink2a~q\ & ( (!\WideOr8~0_combout\) # ((!\state.blink3a~q\ & (!\state.blink1a~DUPLICATE_q\ & \LEDR[6]~reg0_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011101010101010101110101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideOr8~0_combout\,
	datab => \ALT_INV_state.blink3a~q\,
	datac => \ALT_INV_state.blink1a~DUPLICATE_q\,
	datad => \ALT_INV_LEDR[6]~reg0_q\,
	dataf => \ALT_INV_state.blink2a~q\,
	combout => \Selector52~0_combout\);

-- Location: FF_X43_Y3_N19
\LEDR[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector52~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LEDR[6]~reg0_q\);

-- Location: LABCELL_X43_Y3_N36
\Selector51~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector51~1_combout\ = ( \LEDR[7]~reg0_q\ & ( \Selector51~0_combout\ & ( (((\WideOr8~0_combout\ & !\state.blink2a~q\)) # (\state.blink3a~q\)) # (\state.blink1a~DUPLICATE_q\) ) ) ) # ( !\LEDR[7]~reg0_q\ & ( \Selector51~0_combout\ & ( (\state.blink3a~q\) 
-- # (\state.blink1a~DUPLICATE_q\) ) ) ) # ( \LEDR[7]~reg0_q\ & ( !\Selector51~0_combout\ ) ) # ( !\LEDR[7]~reg0_q\ & ( !\Selector51~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101110111011101110111111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state.blink1a~DUPLICATE_q\,
	datab => \ALT_INV_state.blink3a~q\,
	datac => \ALT_INV_WideOr8~0_combout\,
	datad => \ALT_INV_state.blink2a~q\,
	datae => \ALT_INV_LEDR[7]~reg0_q\,
	dataf => \ALT_INV_Selector51~0_combout\,
	combout => \Selector51~1_combout\);

-- Location: FF_X43_Y3_N37
\LEDR[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector51~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LEDR[7]~reg0_q\);

-- Location: LABCELL_X43_Y3_N21
\Selector50~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector50~0_combout\ = ( !\state.blink3~q\ & ( !\state.blink4~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_state.blink4~DUPLICATE_q\,
	dataf => \ALT_INV_state.blink3~q\,
	combout => \Selector50~0_combout\);

-- Location: LABCELL_X43_Y3_N30
\Selector50~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector50~1_combout\ = ( \LEDR[8]~reg0_q\ & ( \WideOr8~0_combout\ & ( (!\Selector50~0_combout\) # (((!\state.blink1a~DUPLICATE_q\) # (\state.blink2a~q\)) # (\state.blink3a~q\)) ) ) ) # ( !\LEDR[8]~reg0_q\ & ( \WideOr8~0_combout\ & ( 
-- (!\Selector50~0_combout\) # ((\state.blink2a~q\) # (\state.blink3a~q\)) ) ) ) # ( \LEDR[8]~reg0_q\ & ( !\WideOr8~0_combout\ & ( (!\Selector50~0_combout\) # ((\state.blink2a~q\) # (\state.blink3a~q\)) ) ) ) # ( !\LEDR[8]~reg0_q\ & ( !\WideOr8~0_combout\ & 
-- ( (!\Selector50~0_combout\) # ((\state.blink2a~q\) # (\state.blink3a~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101111111111101110111111111110111011111111111111101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector50~0_combout\,
	datab => \ALT_INV_state.blink3a~q\,
	datac => \ALT_INV_state.blink1a~DUPLICATE_q\,
	datad => \ALT_INV_state.blink2a~q\,
	datae => \ALT_INV_LEDR[8]~reg0_q\,
	dataf => \ALT_INV_WideOr8~0_combout\,
	combout => \Selector50~1_combout\);

-- Location: FF_X43_Y3_N31
\LEDR[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Selector50~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LEDR[8]~reg0_q\);

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

-- Location: LABCELL_X36_Y4_N0
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


