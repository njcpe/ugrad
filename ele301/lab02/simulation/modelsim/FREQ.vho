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

-- DATE "02/06/2017 17:31:11"

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

ENTITY 	FREQ IS
    PORT (
	clock_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(9 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0)
	);
END FREQ;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FREQ IS
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
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock_50~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \clock_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \clock|Add1~5_sumout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[0]~q\ : std_logic;
SIGNAL \clock|Add1~6\ : std_logic;
SIGNAL \clock|Add1~25_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[1]~feeder_combout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[1]~q\ : std_logic;
SIGNAL \clock|Add1~26\ : std_logic;
SIGNAL \clock|Add1~21_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[2]~q\ : std_logic;
SIGNAL \clock|Add1~22\ : std_logic;
SIGNAL \clock|Add1~17_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[3]~feeder_combout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[3]~q\ : std_logic;
SIGNAL \clock|Add1~18\ : std_logic;
SIGNAL \clock|Add1~9_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[4]~q\ : std_logic;
SIGNAL \clock|Add1~10\ : std_logic;
SIGNAL \clock|Add1~13_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[5]~feeder_combout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[5]~q\ : std_logic;
SIGNAL \clock|Add1~14\ : std_logic;
SIGNAL \clock|Add1~37_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[6]~q\ : std_logic;
SIGNAL \clock|Add1~38\ : std_logic;
SIGNAL \clock|Add1~33_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[7]~q\ : std_logic;
SIGNAL \clock|Add1~34\ : std_logic;
SIGNAL \clock|Add1~29_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[8]~feeder_combout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[8]~q\ : std_logic;
SIGNAL \clock|Add1~30\ : std_logic;
SIGNAL \clock|Add1~1_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[9]~q\ : std_logic;
SIGNAL \clock|Add1~2\ : std_logic;
SIGNAL \clock|Add1~57_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[10]~q\ : std_logic;
SIGNAL \clock|Add1~58\ : std_logic;
SIGNAL \clock|Add1~53_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[11]~q\ : std_logic;
SIGNAL \clock|Add1~54\ : std_logic;
SIGNAL \clock|Add1~49_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[12]~q\ : std_logic;
SIGNAL \clock|Add1~50\ : std_logic;
SIGNAL \clock|Add1~45_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[13]~q\ : std_logic;
SIGNAL \clock|Add1~46\ : std_logic;
SIGNAL \clock|Add1~77_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[14]~q\ : std_logic;
SIGNAL \clock|Add1~78\ : std_logic;
SIGNAL \clock|Add1~41_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[15]~feeder_combout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[15]~q\ : std_logic;
SIGNAL \clock|LessThan0~2_combout\ : std_logic;
SIGNAL \clock|LessThan0~0_combout\ : std_logic;
SIGNAL \clock|LessThan0~1_combout\ : std_logic;
SIGNAL \clock|Add1~42\ : std_logic;
SIGNAL \clock|Add1~61_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[16]~q\ : std_logic;
SIGNAL \clock|Add1~62\ : std_logic;
SIGNAL \clock|Add1~65_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[17]~q\ : std_logic;
SIGNAL \clock|Add1~66\ : std_logic;
SIGNAL \clock|Add1~69_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[18]~q\ : std_logic;
SIGNAL \clock|Add1~70\ : std_logic;
SIGNAL \clock|Add1~73_sumout\ : std_logic;
SIGNAL \clock|Counter_UDT:loopcount[19]~q\ : std_logic;
SIGNAL \clock|LessThan0~3_combout\ : std_logic;
SIGNAL \clock|LessThan0~4_combout\ : std_logic;
SIGNAL \clock|count[0]~0_combout\ : std_logic;
SIGNAL \freq[0]~0_combout\ : std_logic;
SIGNAL \freq[0]~feeder_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \One_second:loopcount[0]~0_combout\ : std_logic;
SIGNAL \One_second:loopcount[0]~q\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \One_second:loopcount[1]~q\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \One_second:loopcount[2]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \One_second:loopcount[3]~q\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \One_second:loopcount[4]~q\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \One_second:loopcount[5]~q\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \One_second:loopcount[6]~q\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \One_second:loopcount[7]~q\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \One_second:loopcount[8]~q\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \One_second:loopcount[9]~q\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \One_second:loopcount[10]~q\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \One_second:loopcount[11]~q\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \One_second:loopcount[12]~q\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \One_second:loopcount[13]~q\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \One_second:loopcount[14]~q\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \One_second:loopcount[15]~q\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \One_second:loopcount[16]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \One_second:loopcount[17]~q\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \One_second:loopcount[18]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \One_second:loopcount[19]~q\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \One_second:loopcount[20]~q\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \One_second:loopcount[21]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \One_second:loopcount[22]~q\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \One_second:loopcount[23]~q\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \One_second:loopcount[24]~q\ : std_logic;
SIGNAL \One_second:loopcount[16]~q\ : std_logic;
SIGNAL \One_second:loopcount[18]~q\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \One_second:loopcount[25]~q\ : std_logic;
SIGNAL \One_second:loopcount[21]~q\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \One_second:loopcount[1]~DUPLICATE_q\ : std_logic;
SIGNAL \One_second:loopcount[2]~q\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \One_second:loopcount[0]~DUPLICATE_q\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \enable~q\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \freq[1]~feeder_combout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~57_sumout\ : std_logic;
SIGNAL \Add1~58\ : std_logic;
SIGNAL \Add1~53_sumout\ : std_logic;
SIGNAL \Add1~54\ : std_logic;
SIGNAL \Add1~37_sumout\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~49_sumout\ : std_logic;
SIGNAL \Add1~50\ : std_logic;
SIGNAL \Add1~45_sumout\ : std_logic;
SIGNAL \Add1~46\ : std_logic;
SIGNAL \Add1~41_sumout\ : std_logic;
SIGNAL \Add1~42\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \display3|aout[0]~0_combout\ : std_logic;
SIGNAL \display3|aout[1]~1_combout\ : std_logic;
SIGNAL \display3|aout[2]~2_combout\ : std_logic;
SIGNAL \display3|aout[3]~3_combout\ : std_logic;
SIGNAL \display3|aout[4]~4_combout\ : std_logic;
SIGNAL \display3|aout[5]~5_combout\ : std_logic;
SIGNAL \display3|aout[6]~6_combout\ : std_logic;
SIGNAL \display2|aout[0]~0_combout\ : std_logic;
SIGNAL \display2|aout[1]~1_combout\ : std_logic;
SIGNAL \display2|aout[2]~2_combout\ : std_logic;
SIGNAL \display2|aout[3]~3_combout\ : std_logic;
SIGNAL \display2|aout[4]~4_combout\ : std_logic;
SIGNAL \display2|aout[5]~5_combout\ : std_logic;
SIGNAL \display2|aout[6]~6_combout\ : std_logic;
SIGNAL \display1|aout[0]~0_combout\ : std_logic;
SIGNAL \display1|aout[1]~1_combout\ : std_logic;
SIGNAL \display1|aout[2]~2_combout\ : std_logic;
SIGNAL \display1|aout[3]~3_combout\ : std_logic;
SIGNAL \display1|aout[4]~4_combout\ : std_logic;
SIGNAL \display1|aout[5]~5_combout\ : std_logic;
SIGNAL \display1|aout[6]~6_combout\ : std_logic;
SIGNAL \display0|aout[0]~0_combout\ : std_logic;
SIGNAL \display0|aout[1]~1_combout\ : std_logic;
SIGNAL \display0|aout[2]~2_combout\ : std_logic;
SIGNAL \display0|aout[3]~3_combout\ : std_logic;
SIGNAL \display0|aout[4]~4_combout\ : std_logic;
SIGNAL \display0|aout[5]~5_combout\ : std_logic;
SIGNAL \display0|aout[6]~6_combout\ : std_logic;
SIGNAL \clock|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \freq~535902\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_One_second:loopcount[21]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[1]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[16]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[18]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_freq[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~5_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[20]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[21]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[22]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[23]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[17]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[19]~q\ : std_logic;
SIGNAL \ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[12]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[13]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[14]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[15]~q\ : std_logic;
SIGNAL \ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[7]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[8]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[9]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[10]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[11]~q\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[2]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[3]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[4]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[5]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[6]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[0]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[1]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[16]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[18]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[24]~q\ : std_logic;
SIGNAL \ALT_INV_One_second:loopcount[25]~q\ : std_logic;
SIGNAL \clock|ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \clock|ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \clock|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \clock|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \clock|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \clock|ALT_INV_count\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \display0|ALT_INV_aout[2]~2_combout\ : std_logic;
SIGNAL \ALT_INV_freq~535902\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \clock|ALT_INV_Add1~41_sumout\ : std_logic;
SIGNAL \clock|ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \clock|ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \clock|ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \clock|ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[14]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[19]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[18]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[17]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[16]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[10]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[11]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[12]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[13]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[15]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[6]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[7]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[8]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[1]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[2]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[3]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[5]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[4]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[0]~q\ : std_logic;
SIGNAL \clock|ALT_INV_Counter_UDT:loopcount[9]~q\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;

BEGIN

ww_clock_50 <= clock_50;
ww_KEY <= KEY;
ww_SW <= SW;
HEX3 <= ww_HEX3;
HEX2 <= ww_HEX2;
HEX1 <= ww_HEX1;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_One_second:loopcount[21]~DUPLICATE_q\ <= NOT \One_second:loopcount[21]~DUPLICATE_q\;
\ALT_INV_One_second:loopcount[2]~DUPLICATE_q\ <= NOT \One_second:loopcount[2]~DUPLICATE_q\;
\ALT_INV_One_second:loopcount[0]~DUPLICATE_q\ <= NOT \One_second:loopcount[0]~DUPLICATE_q\;
\ALT_INV_One_second:loopcount[1]~DUPLICATE_q\ <= NOT \One_second:loopcount[1]~DUPLICATE_q\;
\ALT_INV_One_second:loopcount[16]~DUPLICATE_q\ <= NOT \One_second:loopcount[16]~DUPLICATE_q\;
\ALT_INV_One_second:loopcount[18]~DUPLICATE_q\ <= NOT \One_second:loopcount[18]~DUPLICATE_q\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\ALT_INV_freq[0]~0_combout\ <= NOT \freq[0]~0_combout\;
\ALT_INV_LessThan0~5_combout\ <= NOT \LessThan0~5_combout\;
\ALT_INV_LessThan0~4_combout\ <= NOT \LessThan0~4_combout\;
\ALT_INV_One_second:loopcount[20]~q\ <= NOT \One_second:loopcount[20]~q\;
\ALT_INV_One_second:loopcount[21]~q\ <= NOT \One_second:loopcount[21]~q\;
\ALT_INV_One_second:loopcount[22]~q\ <= NOT \One_second:loopcount[22]~q\;
\ALT_INV_One_second:loopcount[23]~q\ <= NOT \One_second:loopcount[23]~q\;
\ALT_INV_One_second:loopcount[17]~q\ <= NOT \One_second:loopcount[17]~q\;
\ALT_INV_One_second:loopcount[19]~q\ <= NOT \One_second:loopcount[19]~q\;
\ALT_INV_LessThan0~3_combout\ <= NOT \LessThan0~3_combout\;
\ALT_INV_LessThan0~2_combout\ <= NOT \LessThan0~2_combout\;
\ALT_INV_One_second:loopcount[12]~q\ <= NOT \One_second:loopcount[12]~q\;
\ALT_INV_One_second:loopcount[13]~q\ <= NOT \One_second:loopcount[13]~q\;
\ALT_INV_One_second:loopcount[14]~q\ <= NOT \One_second:loopcount[14]~q\;
\ALT_INV_One_second:loopcount[15]~q\ <= NOT \One_second:loopcount[15]~q\;
\ALT_INV_LessThan0~1_combout\ <= NOT \LessThan0~1_combout\;
\ALT_INV_One_second:loopcount[7]~q\ <= NOT \One_second:loopcount[7]~q\;
\ALT_INV_One_second:loopcount[8]~q\ <= NOT \One_second:loopcount[8]~q\;
\ALT_INV_One_second:loopcount[9]~q\ <= NOT \One_second:loopcount[9]~q\;
\ALT_INV_One_second:loopcount[10]~q\ <= NOT \One_second:loopcount[10]~q\;
\ALT_INV_One_second:loopcount[11]~q\ <= NOT \One_second:loopcount[11]~q\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
\ALT_INV_One_second:loopcount[2]~q\ <= NOT \One_second:loopcount[2]~q\;
\ALT_INV_One_second:loopcount[3]~q\ <= NOT \One_second:loopcount[3]~q\;
\ALT_INV_One_second:loopcount[4]~q\ <= NOT \One_second:loopcount[4]~q\;
\ALT_INV_One_second:loopcount[5]~q\ <= NOT \One_second:loopcount[5]~q\;
\ALT_INV_One_second:loopcount[6]~q\ <= NOT \One_second:loopcount[6]~q\;
\ALT_INV_One_second:loopcount[0]~q\ <= NOT \One_second:loopcount[0]~q\;
\ALT_INV_One_second:loopcount[1]~q\ <= NOT \One_second:loopcount[1]~q\;
\ALT_INV_One_second:loopcount[16]~q\ <= NOT \One_second:loopcount[16]~q\;
\ALT_INV_One_second:loopcount[18]~q\ <= NOT \One_second:loopcount[18]~q\;
\ALT_INV_One_second:loopcount[24]~q\ <= NOT \One_second:loopcount[24]~q\;
\ALT_INV_One_second:loopcount[25]~q\ <= NOT \One_second:loopcount[25]~q\;
\clock|ALT_INV_LessThan0~4_combout\ <= NOT \clock|LessThan0~4_combout\;
\clock|ALT_INV_LessThan0~3_combout\ <= NOT \clock|LessThan0~3_combout\;
\clock|ALT_INV_LessThan0~2_combout\ <= NOT \clock|LessThan0~2_combout\;
\clock|ALT_INV_LessThan0~1_combout\ <= NOT \clock|LessThan0~1_combout\;
\clock|ALT_INV_LessThan0~0_combout\ <= NOT \clock|LessThan0~0_combout\;
\clock|ALT_INV_count\(0) <= NOT \clock|count\(0);
\display0|ALT_INV_aout[2]~2_combout\ <= NOT \display0|aout[2]~2_combout\;
\ALT_INV_freq~535902\(2) <= NOT \freq~535902\(2);
\ALT_INV_freq~535902\(3) <= NOT \freq~535902\(3);
\ALT_INV_freq~535902\(0) <= NOT \freq~535902\(0);
\ALT_INV_freq~535902\(1) <= NOT \freq~535902\(1);
\ALT_INV_freq~535902\(5) <= NOT \freq~535902\(5);
\ALT_INV_freq~535902\(6) <= NOT \freq~535902\(6);
\ALT_INV_freq~535902\(7) <= NOT \freq~535902\(7);
\ALT_INV_freq~535902\(4) <= NOT \freq~535902\(4);
\ALT_INV_freq~535902\(9) <= NOT \freq~535902\(9);
\ALT_INV_freq~535902\(10) <= NOT \freq~535902\(10);
\ALT_INV_freq~535902\(11) <= NOT \freq~535902\(11);
\ALT_INV_freq~535902\(8) <= NOT \freq~535902\(8);
\ALT_INV_freq~535902\(13) <= NOT \freq~535902\(13);
\ALT_INV_freq~535902\(14) <= NOT \freq~535902\(14);
\ALT_INV_freq~535902\(15) <= NOT \freq~535902\(15);
\ALT_INV_freq~535902\(12) <= NOT \freq~535902\(12);
\clock|ALT_INV_Add1~41_sumout\ <= NOT \clock|Add1~41_sumout\;
\clock|ALT_INV_Add1~29_sumout\ <= NOT \clock|Add1~29_sumout\;
\clock|ALT_INV_Add1~25_sumout\ <= NOT \clock|Add1~25_sumout\;
\clock|ALT_INV_Add1~17_sumout\ <= NOT \clock|Add1~17_sumout\;
\clock|ALT_INV_Add1~13_sumout\ <= NOT \clock|Add1~13_sumout\;
\clock|ALT_INV_Counter_UDT:loopcount[14]~q\ <= NOT \clock|Counter_UDT:loopcount[14]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[19]~q\ <= NOT \clock|Counter_UDT:loopcount[19]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[18]~q\ <= NOT \clock|Counter_UDT:loopcount[18]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[17]~q\ <= NOT \clock|Counter_UDT:loopcount[17]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[16]~q\ <= NOT \clock|Counter_UDT:loopcount[16]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[10]~q\ <= NOT \clock|Counter_UDT:loopcount[10]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[11]~q\ <= NOT \clock|Counter_UDT:loopcount[11]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[12]~q\ <= NOT \clock|Counter_UDT:loopcount[12]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[13]~q\ <= NOT \clock|Counter_UDT:loopcount[13]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[15]~q\ <= NOT \clock|Counter_UDT:loopcount[15]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[6]~q\ <= NOT \clock|Counter_UDT:loopcount[6]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[7]~q\ <= NOT \clock|Counter_UDT:loopcount[7]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[8]~q\ <= NOT \clock|Counter_UDT:loopcount[8]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[1]~q\ <= NOT \clock|Counter_UDT:loopcount[1]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[2]~q\ <= NOT \clock|Counter_UDT:loopcount[2]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[3]~q\ <= NOT \clock|Counter_UDT:loopcount[3]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[5]~q\ <= NOT \clock|Counter_UDT:loopcount[5]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[4]~q\ <= NOT \clock|Counter_UDT:loopcount[4]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[0]~q\ <= NOT \clock|Counter_UDT:loopcount[0]~q\;
\clock|ALT_INV_Counter_UDT:loopcount[9]~q\ <= NOT \clock|Counter_UDT:loopcount[9]~q\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;

-- Location: IOOBUF_X89_Y16_N5
\HEX3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(0));

-- Location: IOOBUF_X89_Y16_N22
\HEX3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(1));

-- Location: IOOBUF_X89_Y4_N45
\HEX3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(2));

-- Location: IOOBUF_X89_Y4_N62
\HEX3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(3));

-- Location: IOOBUF_X89_Y21_N39
\HEX3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(4));

-- Location: IOOBUF_X89_Y11_N62
\HEX3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(5));

-- Location: IOOBUF_X89_Y9_N5
\HEX3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display3|aout[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(6));

-- Location: IOOBUF_X89_Y9_N22
\HEX2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(0));

-- Location: IOOBUF_X89_Y23_N39
\HEX2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[1]~1_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(1));

-- Location: IOOBUF_X89_Y23_N56
\HEX2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(2));

-- Location: IOOBUF_X89_Y20_N79
\HEX2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(3));

-- Location: IOOBUF_X89_Y25_N39
\HEX2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[4]~4_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(4));

-- Location: IOOBUF_X89_Y20_N96
\HEX2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(5));

-- Location: IOOBUF_X89_Y25_N56
\HEX2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \display2|aout[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(6));

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

-- Location: LABCELL_X23_Y2_N0
\clock|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~5_sumout\ = SUM(( \clock|Counter_UDT:loopcount[0]~q\ ) + ( \SW[4]~input_o\ ) + ( !VCC ))
-- \clock|Add1~6\ = CARRY(( \clock|Counter_UDT:loopcount[0]~q\ ) + ( \SW[4]~input_o\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[4]~input_o\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[0]~q\,
	cin => GND,
	sumout => \clock|Add1~5_sumout\,
	cout => \clock|Add1~6\);

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

-- Location: FF_X24_Y2_N29
\clock|Counter_UDT:loopcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[0]~q\);

-- Location: LABCELL_X23_Y2_N3
\clock|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~25_sumout\ = SUM(( \clock|Counter_UDT:loopcount[1]~q\ ) + ( \SW[5]~input_o\ ) + ( \clock|Add1~6\ ))
-- \clock|Add1~26\ = CARRY(( \clock|Counter_UDT:loopcount[1]~q\ ) + ( \SW[5]~input_o\ ) + ( \clock|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[5]~input_o\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[1]~q\,
	cin => \clock|Add1~6\,
	sumout => \clock|Add1~25_sumout\,
	cout => \clock|Add1~26\);

-- Location: LABCELL_X24_Y2_N15
\clock|Counter_UDT:loopcount[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Counter_UDT:loopcount[1]~feeder_combout\ = ( \clock|Add1~25_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \clock|ALT_INV_Add1~25_sumout\,
	combout => \clock|Counter_UDT:loopcount[1]~feeder_combout\);

-- Location: FF_X24_Y2_N17
\clock|Counter_UDT:loopcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Counter_UDT:loopcount[1]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[1]~q\);

-- Location: LABCELL_X23_Y2_N6
\clock|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~21_sumout\ = SUM(( \clock|Counter_UDT:loopcount[2]~q\ ) + ( \SW[6]~input_o\ ) + ( \clock|Add1~26\ ))
-- \clock|Add1~22\ = CARRY(( \clock|Counter_UDT:loopcount[2]~q\ ) + ( \SW[6]~input_o\ ) + ( \clock|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[6]~input_o\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[2]~q\,
	cin => \clock|Add1~26\,
	sumout => \clock|Add1~21_sumout\,
	cout => \clock|Add1~22\);

-- Location: FF_X24_Y2_N11
\clock|Counter_UDT:loopcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[2]~q\);

-- Location: LABCELL_X23_Y2_N9
\clock|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~17_sumout\ = SUM(( \clock|Counter_UDT:loopcount[3]~q\ ) + ( \SW[7]~input_o\ ) + ( \clock|Add1~22\ ))
-- \clock|Add1~18\ = CARRY(( \clock|Counter_UDT:loopcount[3]~q\ ) + ( \SW[7]~input_o\ ) + ( \clock|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_SW[7]~input_o\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[3]~q\,
	cin => \clock|Add1~22\,
	sumout => \clock|Add1~17_sumout\,
	cout => \clock|Add1~18\);

-- Location: LABCELL_X24_Y2_N42
\clock|Counter_UDT:loopcount[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Counter_UDT:loopcount[3]~feeder_combout\ = ( \clock|Add1~17_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \clock|ALT_INV_Add1~17_sumout\,
	combout => \clock|Counter_UDT:loopcount[3]~feeder_combout\);

-- Location: FF_X24_Y2_N44
\clock|Counter_UDT:loopcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Counter_UDT:loopcount[3]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[3]~q\);

-- Location: LABCELL_X23_Y2_N12
\clock|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~9_sumout\ = SUM(( \clock|Counter_UDT:loopcount[4]~q\ ) + ( GND ) + ( \clock|Add1~18\ ))
-- \clock|Add1~10\ = CARRY(( \clock|Counter_UDT:loopcount[4]~q\ ) + ( GND ) + ( \clock|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \clock|ALT_INV_Counter_UDT:loopcount[4]~q\,
	cin => \clock|Add1~18\,
	sumout => \clock|Add1~9_sumout\,
	cout => \clock|Add1~10\);

-- Location: FF_X24_Y2_N23
\clock|Counter_UDT:loopcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[4]~q\);

-- Location: LABCELL_X23_Y2_N15
\clock|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~13_sumout\ = SUM(( \clock|Counter_UDT:loopcount[5]~q\ ) + ( GND ) + ( \clock|Add1~10\ ))
-- \clock|Add1~14\ = CARRY(( \clock|Counter_UDT:loopcount[5]~q\ ) + ( GND ) + ( \clock|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[5]~q\,
	cin => \clock|Add1~10\,
	sumout => \clock|Add1~13_sumout\,
	cout => \clock|Add1~14\);

-- Location: LABCELL_X24_Y2_N12
\clock|Counter_UDT:loopcount[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Counter_UDT:loopcount[5]~feeder_combout\ = ( \clock|Add1~13_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \clock|ALT_INV_Add1~13_sumout\,
	combout => \clock|Counter_UDT:loopcount[5]~feeder_combout\);

-- Location: FF_X24_Y2_N14
\clock|Counter_UDT:loopcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Counter_UDT:loopcount[5]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[5]~q\);

-- Location: LABCELL_X23_Y2_N18
\clock|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~37_sumout\ = SUM(( \clock|Counter_UDT:loopcount[6]~q\ ) + ( GND ) + ( \clock|Add1~14\ ))
-- \clock|Add1~38\ = CARRY(( \clock|Counter_UDT:loopcount[6]~q\ ) + ( GND ) + ( \clock|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \clock|ALT_INV_Counter_UDT:loopcount[6]~q\,
	cin => \clock|Add1~14\,
	sumout => \clock|Add1~37_sumout\,
	cout => \clock|Add1~38\);

-- Location: FF_X24_Y2_N5
\clock|Counter_UDT:loopcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[6]~q\);

-- Location: LABCELL_X23_Y2_N21
\clock|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~33_sumout\ = SUM(( \clock|Counter_UDT:loopcount[7]~q\ ) + ( GND ) + ( \clock|Add1~38\ ))
-- \clock|Add1~34\ = CARRY(( \clock|Counter_UDT:loopcount[7]~q\ ) + ( GND ) + ( \clock|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \clock|ALT_INV_Counter_UDT:loopcount[7]~q\,
	cin => \clock|Add1~38\,
	sumout => \clock|Add1~33_sumout\,
	cout => \clock|Add1~34\);

-- Location: FF_X23_Y2_N23
\clock|Counter_UDT:loopcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[7]~q\);

-- Location: LABCELL_X23_Y2_N24
\clock|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~29_sumout\ = SUM(( \clock|Counter_UDT:loopcount[8]~q\ ) + ( GND ) + ( \clock|Add1~34\ ))
-- \clock|Add1~30\ = CARRY(( \clock|Counter_UDT:loopcount[8]~q\ ) + ( GND ) + ( \clock|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \clock|ALT_INV_Counter_UDT:loopcount[8]~q\,
	cin => \clock|Add1~34\,
	sumout => \clock|Add1~29_sumout\,
	cout => \clock|Add1~30\);

-- Location: LABCELL_X24_Y2_N48
\clock|Counter_UDT:loopcount[8]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Counter_UDT:loopcount[8]~feeder_combout\ = ( \clock|Add1~29_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \clock|ALT_INV_Add1~29_sumout\,
	combout => \clock|Counter_UDT:loopcount[8]~feeder_combout\);

-- Location: FF_X24_Y2_N50
\clock|Counter_UDT:loopcount[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Counter_UDT:loopcount[8]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[8]~q\);

-- Location: LABCELL_X23_Y2_N27
\clock|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~1_sumout\ = SUM(( \clock|Counter_UDT:loopcount[9]~q\ ) + ( GND ) + ( \clock|Add1~30\ ))
-- \clock|Add1~2\ = CARRY(( \clock|Counter_UDT:loopcount[9]~q\ ) + ( GND ) + ( \clock|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \clock|ALT_INV_Counter_UDT:loopcount[9]~q\,
	cin => \clock|Add1~30\,
	sumout => \clock|Add1~1_sumout\,
	cout => \clock|Add1~2\);

-- Location: FF_X23_Y2_N29
\clock|Counter_UDT:loopcount[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[9]~q\);

-- Location: LABCELL_X23_Y2_N30
\clock|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~57_sumout\ = SUM(( \clock|Counter_UDT:loopcount[10]~q\ ) + ( GND ) + ( \clock|Add1~2\ ))
-- \clock|Add1~58\ = CARRY(( \clock|Counter_UDT:loopcount[10]~q\ ) + ( GND ) + ( \clock|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[10]~q\,
	cin => \clock|Add1~2\,
	sumout => \clock|Add1~57_sumout\,
	cout => \clock|Add1~58\);

-- Location: FF_X24_Y2_N35
\clock|Counter_UDT:loopcount[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~57_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[10]~q\);

-- Location: LABCELL_X23_Y2_N33
\clock|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~53_sumout\ = SUM(( \clock|Counter_UDT:loopcount[11]~q\ ) + ( GND ) + ( \clock|Add1~58\ ))
-- \clock|Add1~54\ = CARRY(( \clock|Counter_UDT:loopcount[11]~q\ ) + ( GND ) + ( \clock|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[11]~q\,
	cin => \clock|Add1~58\,
	sumout => \clock|Add1~53_sumout\,
	cout => \clock|Add1~54\);

-- Location: FF_X24_Y2_N20
\clock|Counter_UDT:loopcount[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~53_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[11]~q\);

-- Location: LABCELL_X23_Y2_N36
\clock|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~49_sumout\ = SUM(( \clock|Counter_UDT:loopcount[12]~q\ ) + ( GND ) + ( \clock|Add1~54\ ))
-- \clock|Add1~50\ = CARRY(( \clock|Counter_UDT:loopcount[12]~q\ ) + ( GND ) + ( \clock|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \clock|ALT_INV_Counter_UDT:loopcount[12]~q\,
	cin => \clock|Add1~54\,
	sumout => \clock|Add1~49_sumout\,
	cout => \clock|Add1~50\);

-- Location: FF_X24_Y2_N38
\clock|Counter_UDT:loopcount[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \clock|Add1~49_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[12]~q\);

-- Location: LABCELL_X23_Y2_N39
\clock|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~45_sumout\ = SUM(( \clock|Counter_UDT:loopcount[13]~q\ ) + ( GND ) + ( \clock|Add1~50\ ))
-- \clock|Add1~46\ = CARRY(( \clock|Counter_UDT:loopcount[13]~q\ ) + ( GND ) + ( \clock|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[13]~q\,
	cin => \clock|Add1~50\,
	sumout => \clock|Add1~45_sumout\,
	cout => \clock|Add1~46\);

-- Location: FF_X23_Y2_N41
\clock|Counter_UDT:loopcount[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~45_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[13]~q\);

-- Location: LABCELL_X23_Y2_N42
\clock|Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~77_sumout\ = SUM(( \clock|Counter_UDT:loopcount[14]~q\ ) + ( GND ) + ( \clock|Add1~46\ ))
-- \clock|Add1~78\ = CARRY(( \clock|Counter_UDT:loopcount[14]~q\ ) + ( GND ) + ( \clock|Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clock|ALT_INV_Counter_UDT:loopcount[14]~q\,
	cin => \clock|Add1~46\,
	sumout => \clock|Add1~77_sumout\,
	cout => \clock|Add1~78\);

-- Location: FF_X23_Y2_N44
\clock|Counter_UDT:loopcount[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~77_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[14]~q\);

-- Location: LABCELL_X23_Y2_N45
\clock|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~41_sumout\ = SUM(( \clock|Counter_UDT:loopcount[15]~q\ ) + ( GND ) + ( \clock|Add1~78\ ))
-- \clock|Add1~42\ = CARRY(( \clock|Counter_UDT:loopcount[15]~q\ ) + ( GND ) + ( \clock|Add1~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clock|ALT_INV_Counter_UDT:loopcount[15]~q\,
	cin => \clock|Add1~78\,
	sumout => \clock|Add1~41_sumout\,
	cout => \clock|Add1~42\);

-- Location: LABCELL_X24_Y2_N51
\clock|Counter_UDT:loopcount[15]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Counter_UDT:loopcount[15]~feeder_combout\ = ( \clock|Add1~41_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \clock|ALT_INV_Add1~41_sumout\,
	combout => \clock|Counter_UDT:loopcount[15]~feeder_combout\);

-- Location: FF_X24_Y2_N53
\clock|Counter_UDT:loopcount[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Counter_UDT:loopcount[15]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[15]~q\);

-- Location: LABCELL_X24_Y2_N54
\clock|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|LessThan0~2_combout\ = ( !\clock|Counter_UDT:loopcount[12]~q\ & ( !\clock|Counter_UDT:loopcount[13]~q\ & ( (!\clock|Counter_UDT:loopcount[15]~q\ & (!\clock|Counter_UDT:loopcount[10]~q\ & !\clock|Counter_UDT:loopcount[11]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clock|ALT_INV_Counter_UDT:loopcount[15]~q\,
	datac => \clock|ALT_INV_Counter_UDT:loopcount[10]~q\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[11]~q\,
	datae => \clock|ALT_INV_Counter_UDT:loopcount[12]~q\,
	dataf => \clock|ALT_INV_Counter_UDT:loopcount[13]~q\,
	combout => \clock|LessThan0~2_combout\);

-- Location: LABCELL_X24_Y2_N6
\clock|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|LessThan0~0_combout\ = ( \clock|Counter_UDT:loopcount[4]~q\ & ( \clock|Counter_UDT:loopcount[5]~q\ & ( (\clock|Counter_UDT:loopcount[1]~q\ & (\clock|Counter_UDT:loopcount[2]~q\ & \clock|Counter_UDT:loopcount[3]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clock|ALT_INV_Counter_UDT:loopcount[1]~q\,
	datac => \clock|ALT_INV_Counter_UDT:loopcount[2]~q\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[3]~q\,
	datae => \clock|ALT_INV_Counter_UDT:loopcount[4]~q\,
	dataf => \clock|ALT_INV_Counter_UDT:loopcount[5]~q\,
	combout => \clock|LessThan0~0_combout\);

-- Location: LABCELL_X24_Y2_N0
\clock|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|LessThan0~1_combout\ = ( !\clock|Counter_UDT:loopcount[6]~q\ & ( !\clock|Counter_UDT:loopcount[7]~q\ & ( !\clock|Counter_UDT:loopcount[8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[8]~q\,
	datae => \clock|ALT_INV_Counter_UDT:loopcount[6]~q\,
	dataf => \clock|ALT_INV_Counter_UDT:loopcount[7]~q\,
	combout => \clock|LessThan0~1_combout\);

-- Location: LABCELL_X23_Y2_N48
\clock|Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~61_sumout\ = SUM(( \clock|Counter_UDT:loopcount[16]~q\ ) + ( GND ) + ( \clock|Add1~42\ ))
-- \clock|Add1~62\ = CARRY(( \clock|Counter_UDT:loopcount[16]~q\ ) + ( GND ) + ( \clock|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[16]~q\,
	cin => \clock|Add1~42\,
	sumout => \clock|Add1~61_sumout\,
	cout => \clock|Add1~62\);

-- Location: FF_X23_Y2_N50
\clock|Counter_UDT:loopcount[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~61_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[16]~q\);

-- Location: LABCELL_X23_Y2_N51
\clock|Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~65_sumout\ = SUM(( \clock|Counter_UDT:loopcount[17]~q\ ) + ( GND ) + ( \clock|Add1~62\ ))
-- \clock|Add1~66\ = CARRY(( \clock|Counter_UDT:loopcount[17]~q\ ) + ( GND ) + ( \clock|Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clock|ALT_INV_Counter_UDT:loopcount[17]~q\,
	cin => \clock|Add1~62\,
	sumout => \clock|Add1~65_sumout\,
	cout => \clock|Add1~66\);

-- Location: FF_X23_Y2_N53
\clock|Counter_UDT:loopcount[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~65_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[17]~q\);

-- Location: LABCELL_X23_Y2_N54
\clock|Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~69_sumout\ = SUM(( \clock|Counter_UDT:loopcount[18]~q\ ) + ( GND ) + ( \clock|Add1~66\ ))
-- \clock|Add1~70\ = CARRY(( \clock|Counter_UDT:loopcount[18]~q\ ) + ( GND ) + ( \clock|Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[18]~q\,
	cin => \clock|Add1~66\,
	sumout => \clock|Add1~69_sumout\,
	cout => \clock|Add1~70\);

-- Location: FF_X23_Y2_N56
\clock|Counter_UDT:loopcount[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~69_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[18]~q\);

-- Location: LABCELL_X23_Y2_N57
\clock|Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|Add1~73_sumout\ = SUM(( \clock|Counter_UDT:loopcount[19]~q\ ) + ( GND ) + ( \clock|Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clock|ALT_INV_Counter_UDT:loopcount[19]~q\,
	cin => \clock|Add1~70\,
	sumout => \clock|Add1~73_sumout\);

-- Location: FF_X23_Y2_N59
\clock|Counter_UDT:loopcount[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \clock|Add1~73_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \clock|LessThan0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|Counter_UDT:loopcount[19]~q\);

-- Location: LABCELL_X24_Y2_N30
\clock|LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|LessThan0~3_combout\ = ( \clock|Counter_UDT:loopcount[19]~q\ & ( \clock|Counter_UDT:loopcount[18]~q\ & ( (\clock|Counter_UDT:loopcount[16]~q\ & (\clock|Counter_UDT:loopcount[17]~q\ & ((\clock|Counter_UDT:loopcount[14]~q\) # 
-- (\clock|Counter_UDT:loopcount[15]~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clock|ALT_INV_Counter_UDT:loopcount[15]~q\,
	datab => \clock|ALT_INV_Counter_UDT:loopcount[14]~q\,
	datac => \clock|ALT_INV_Counter_UDT:loopcount[16]~q\,
	datad => \clock|ALT_INV_Counter_UDT:loopcount[17]~q\,
	datae => \clock|ALT_INV_Counter_UDT:loopcount[19]~q\,
	dataf => \clock|ALT_INV_Counter_UDT:loopcount[18]~q\,
	combout => \clock|LessThan0~3_combout\);

-- Location: LABCELL_X24_Y2_N39
\clock|LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|LessThan0~4_combout\ = ( \clock|Counter_UDT:loopcount[0]~q\ & ( \clock|LessThan0~3_combout\ & ( (!\clock|LessThan0~2_combout\) # ((\clock|Counter_UDT:loopcount[9]~q\ & ((!\clock|LessThan0~1_combout\) # (\clock|LessThan0~0_combout\)))) ) ) ) # ( 
-- !\clock|Counter_UDT:loopcount[0]~q\ & ( \clock|LessThan0~3_combout\ & ( (!\clock|LessThan0~2_combout\) # ((\clock|Counter_UDT:loopcount[9]~q\ & !\clock|LessThan0~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010111011101010101011101110101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clock|ALT_INV_LessThan0~2_combout\,
	datab => \clock|ALT_INV_Counter_UDT:loopcount[9]~q\,
	datac => \clock|ALT_INV_LessThan0~0_combout\,
	datad => \clock|ALT_INV_LessThan0~1_combout\,
	datae => \clock|ALT_INV_Counter_UDT:loopcount[0]~q\,
	dataf => \clock|ALT_INV_LessThan0~3_combout\,
	combout => \clock|LessThan0~4_combout\);

-- Location: LABCELL_X24_Y2_N24
\clock|count[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clock|count[0]~0_combout\ = ( \SW[0]~input_o\ & ( \clock|LessThan0~4_combout\ & ( !\clock|count\(0) ) ) ) # ( !\SW[0]~input_o\ & ( \clock|LessThan0~4_combout\ & ( \clock|count\(0) ) ) ) # ( \SW[0]~input_o\ & ( !\clock|LessThan0~4_combout\ & ( 
-- \clock|count\(0) ) ) ) # ( !\SW[0]~input_o\ & ( !\clock|LessThan0~4_combout\ & ( \clock|count\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100111100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clock|ALT_INV_count\(0),
	datae => \ALT_INV_SW[0]~input_o\,
	dataf => \clock|ALT_INV_LessThan0~4_combout\,
	combout => \clock|count[0]~0_combout\);

-- Location: FF_X24_Y2_N59
\clock|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~input_o\,
	asdata => \clock|count[0]~0_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock|count\(0));

-- Location: LABCELL_X83_Y8_N45
\freq[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \freq[0]~0_combout\ = ( !\freq~535902\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_freq~535902\(0),
	combout => \freq[0]~0_combout\);

-- Location: MLABCELL_X82_Y8_N57
\freq[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \freq[0]~feeder_combout\ = ( \freq[0]~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_freq[0]~0_combout\,
	combout => \freq[0]~feeder_combout\);

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

-- Location: LABCELL_X81_Y9_N27
\One_second:loopcount[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \One_second:loopcount[0]~0_combout\ = !\One_second:loopcount[0]~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[0]~q\,
	combout => \One_second:loopcount[0]~0_combout\);

-- Location: FF_X81_Y9_N29
\One_second:loopcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \One_second:loopcount[0]~0_combout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[0]~q\);

-- Location: LABCELL_X81_Y9_N30
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \One_second:loopcount[0]~q\ ) + ( \One_second:loopcount[1]~q\ ) + ( !VCC ))
-- \Add0~18\ = CARRY(( \One_second:loopcount[0]~q\ ) + ( \One_second:loopcount[1]~q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[1]~q\,
	datad => \ALT_INV_One_second:loopcount[0]~q\,
	cin => GND,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X81_Y9_N31
\One_second:loopcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[1]~q\);

-- Location: LABCELL_X81_Y9_N33
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( \One_second:loopcount[2]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~38\ = CARRY(( \One_second:loopcount[2]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_One_second:loopcount[2]~DUPLICATE_q\,
	cin => \Add0~18\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X81_Y9_N35
\One_second:loopcount[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[2]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y9_N36
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( \One_second:loopcount[3]~q\ ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( \One_second:loopcount[3]~q\ ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[3]~q\,
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X81_Y9_N38
\One_second:loopcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[3]~q\);

-- Location: LABCELL_X81_Y9_N39
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( \One_second:loopcount[4]~q\ ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~30\ = CARRY(( \One_second:loopcount[4]~q\ ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[4]~q\,
	cin => \Add0~34\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X81_Y9_N41
\One_second:loopcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[4]~q\);

-- Location: LABCELL_X81_Y9_N42
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \One_second:loopcount[5]~q\ ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~26\ = CARRY(( \One_second:loopcount[5]~q\ ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[5]~q\,
	cin => \Add0~30\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X81_Y9_N43
\One_second:loopcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[5]~q\);

-- Location: LABCELL_X81_Y9_N45
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \One_second:loopcount[6]~q\ ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( \One_second:loopcount[6]~q\ ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[6]~q\,
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X81_Y9_N47
\One_second:loopcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[6]~q\);

-- Location: LABCELL_X81_Y9_N48
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( \One_second:loopcount[7]~q\ ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~58\ = CARRY(( \One_second:loopcount[7]~q\ ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[7]~q\,
	cin => \Add0~22\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X81_Y9_N50
\One_second:loopcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[7]~q\);

-- Location: LABCELL_X81_Y9_N51
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( \One_second:loopcount[8]~q\ ) + ( GND ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( \One_second:loopcount[8]~q\ ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[8]~q\,
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X81_Y9_N52
\One_second:loopcount[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[8]~q\);

-- Location: LABCELL_X81_Y9_N54
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( \One_second:loopcount[9]~q\ ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~50\ = CARRY(( \One_second:loopcount[9]~q\ ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[9]~q\,
	cin => \Add0~54\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X81_Y9_N56
\One_second:loopcount[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[9]~q\);

-- Location: LABCELL_X81_Y9_N57
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( \One_second:loopcount[10]~q\ ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~46\ = CARRY(( \One_second:loopcount[10]~q\ ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[10]~q\,
	cin => \Add0~50\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X81_Y9_N59
\One_second:loopcount[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[10]~q\);

-- Location: LABCELL_X81_Y8_N0
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( \One_second:loopcount[11]~q\ ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~42\ = CARRY(( \One_second:loopcount[11]~q\ ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[11]~q\,
	cin => \Add0~46\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X81_Y8_N2
\One_second:loopcount[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[11]~q\);

-- Location: LABCELL_X81_Y8_N3
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( \One_second:loopcount[12]~q\ ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~74\ = CARRY(( \One_second:loopcount[12]~q\ ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[12]~q\,
	cin => \Add0~42\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X81_Y8_N5
\One_second:loopcount[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[12]~q\);

-- Location: LABCELL_X81_Y8_N6
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( \One_second:loopcount[13]~q\ ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( \One_second:loopcount[13]~q\ ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[13]~q\,
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X81_Y8_N8
\One_second:loopcount[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[13]~q\);

-- Location: LABCELL_X81_Y8_N9
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( \One_second:loopcount[14]~q\ ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~66\ = CARRY(( \One_second:loopcount[14]~q\ ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[14]~q\,
	cin => \Add0~70\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X81_Y8_N11
\One_second:loopcount[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[14]~q\);

-- Location: LABCELL_X81_Y8_N12
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( \One_second:loopcount[15]~q\ ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~62\ = CARRY(( \One_second:loopcount[15]~q\ ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[15]~q\,
	cin => \Add0~66\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X81_Y8_N14
\One_second:loopcount[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[15]~q\);

-- Location: LABCELL_X81_Y8_N15
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \One_second:loopcount[16]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~14\ = CARRY(( \One_second:loopcount[16]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[16]~DUPLICATE_q\,
	cin => \Add0~62\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X81_Y8_N17
\One_second:loopcount[16]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[16]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y8_N18
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( \One_second:loopcount[17]~q\ ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~82\ = CARRY(( \One_second:loopcount[17]~q\ ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[17]~q\,
	cin => \Add0~14\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X81_Y8_N20
\One_second:loopcount[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~81_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[17]~q\);

-- Location: LABCELL_X81_Y8_N21
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \One_second:loopcount[18]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~82\ ))
-- \Add0~10\ = CARRY(( \One_second:loopcount[18]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[18]~DUPLICATE_q\,
	cin => \Add0~82\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X81_Y8_N23
\One_second:loopcount[18]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[18]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y8_N24
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( \One_second:loopcount[19]~q\ ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~78\ = CARRY(( \One_second:loopcount[19]~q\ ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[19]~q\,
	cin => \Add0~10\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X81_Y8_N26
\One_second:loopcount[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[19]~q\);

-- Location: LABCELL_X81_Y8_N27
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( \One_second:loopcount[20]~q\ ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~98\ = CARRY(( \One_second:loopcount[20]~q\ ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_One_second:loopcount[20]~q\,
	cin => \Add0~78\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X81_Y8_N29
\One_second:loopcount[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[20]~q\);

-- Location: LABCELL_X81_Y8_N30
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( \One_second:loopcount[21]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~98\ ))
-- \Add0~94\ = CARRY(( \One_second:loopcount[21]~DUPLICATE_q\ ) + ( GND ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[21]~DUPLICATE_q\,
	cin => \Add0~98\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X81_Y8_N32
\One_second:loopcount[21]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[21]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y8_N33
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( \One_second:loopcount[22]~q\ ) + ( GND ) + ( \Add0~94\ ))
-- \Add0~90\ = CARRY(( \One_second:loopcount[22]~q\ ) + ( GND ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_One_second:loopcount[22]~q\,
	cin => \Add0~94\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X81_Y8_N35
\One_second:loopcount[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[22]~q\);

-- Location: LABCELL_X81_Y8_N36
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \One_second:loopcount[23]~q\ ) + ( GND ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( \One_second:loopcount[23]~q\ ) + ( GND ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[23]~q\,
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X81_Y8_N38
\One_second:loopcount[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[23]~q\);

-- Location: LABCELL_X81_Y8_N39
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \One_second:loopcount[24]~q\ ) + ( GND ) + ( \Add0~86\ ))
-- \Add0~6\ = CARRY(( \One_second:loopcount[24]~q\ ) + ( GND ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_One_second:loopcount[24]~q\,
	cin => \Add0~86\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X81_Y8_N41
\One_second:loopcount[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[24]~q\);

-- Location: FF_X81_Y8_N16
\One_second:loopcount[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[16]~q\);

-- Location: FF_X81_Y8_N22
\One_second:loopcount[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[18]~q\);

-- Location: LABCELL_X81_Y8_N42
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \One_second:loopcount[25]~q\ ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[25]~q\,
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\);

-- Location: FF_X81_Y8_N43
\One_second:loopcount[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[25]~q\);

-- Location: FF_X81_Y8_N31
\One_second:loopcount[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[21]~q\);

-- Location: LABCELL_X81_Y8_N48
\LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ( \One_second:loopcount[22]~q\ & ( (\One_second:loopcount[20]~q\ & (\One_second:loopcount[21]~q\ & \One_second:loopcount[23]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_One_second:loopcount[20]~q\,
	datac => \ALT_INV_One_second:loopcount[21]~q\,
	datad => \ALT_INV_One_second:loopcount[23]~q\,
	dataf => \ALT_INV_One_second:loopcount[22]~q\,
	combout => \LessThan0~4_combout\);

-- Location: LABCELL_X81_Y8_N57
\LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = ( \One_second:loopcount[18]~DUPLICATE_q\ & ( \LessThan0~4_combout\ & ( \One_second:loopcount[19]~q\ ) ) ) # ( !\One_second:loopcount[18]~DUPLICATE_q\ & ( \LessThan0~4_combout\ & ( (\One_second:loopcount[17]~q\ & 
-- \One_second:loopcount[19]~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010101010000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_One_second:loopcount[17]~q\,
	datad => \ALT_INV_One_second:loopcount[19]~q\,
	datae => \ALT_INV_One_second:loopcount[18]~DUPLICATE_q\,
	dataf => \ALT_INV_LessThan0~4_combout\,
	combout => \LessThan0~5_combout\);

-- Location: FF_X81_Y9_N32
\One_second:loopcount[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[1]~DUPLICATE_q\);

-- Location: FF_X81_Y9_N34
\One_second:loopcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[2]~q\);

-- Location: LABCELL_X81_Y9_N0
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( \One_second:loopcount[5]~q\ & ( \One_second:loopcount[2]~q\ & ( (\One_second:loopcount[6]~q\ & (\One_second:loopcount[3]~q\ & \One_second:loopcount[4]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[6]~q\,
	datac => \ALT_INV_One_second:loopcount[3]~q\,
	datad => \ALT_INV_One_second:loopcount[4]~q\,
	datae => \ALT_INV_One_second:loopcount[5]~q\,
	dataf => \ALT_INV_One_second:loopcount[2]~q\,
	combout => \LessThan0~0_combout\);

-- Location: FF_X81_Y9_N28
\One_second:loopcount[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	d => \One_second:loopcount[0]~0_combout\,
	clrn => \KEY[2]~input_o\,
	ena => \LessThan0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \One_second:loopcount[0]~DUPLICATE_q\);

-- Location: LABCELL_X81_Y8_N51
\LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ( \One_second:loopcount[14]~q\ & ( (\One_second:loopcount[13]~q\ & (\One_second:loopcount[15]~q\ & \One_second:loopcount[12]~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[13]~q\,
	datac => \ALT_INV_One_second:loopcount[15]~q\,
	datad => \ALT_INV_One_second:loopcount[12]~q\,
	dataf => \ALT_INV_One_second:loopcount[14]~q\,
	combout => \LessThan0~2_combout\);

-- Location: LABCELL_X81_Y9_N18
\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ( !\One_second:loopcount[11]~q\ & ( !\One_second:loopcount[7]~q\ & ( (!\One_second:loopcount[10]~q\ & (!\One_second:loopcount[9]~q\ & !\One_second:loopcount[8]~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[10]~q\,
	datac => \ALT_INV_One_second:loopcount[9]~q\,
	datad => \ALT_INV_One_second:loopcount[8]~q\,
	datae => \ALT_INV_One_second:loopcount[11]~q\,
	dataf => \ALT_INV_One_second:loopcount[7]~q\,
	combout => \LessThan0~1_combout\);

-- Location: LABCELL_X81_Y9_N6
\LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = ( \LessThan0~2_combout\ & ( \LessThan0~1_combout\ & ( (\One_second:loopcount[1]~DUPLICATE_q\ & (\LessThan0~0_combout\ & \One_second:loopcount[0]~DUPLICATE_q\)) ) ) ) # ( \LessThan0~2_combout\ & ( !\LessThan0~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_One_second:loopcount[1]~DUPLICATE_q\,
	datac => \ALT_INV_LessThan0~0_combout\,
	datad => \ALT_INV_One_second:loopcount[0]~DUPLICATE_q\,
	datae => \ALT_INV_LessThan0~2_combout\,
	dataf => \ALT_INV_LessThan0~1_combout\,
	combout => \LessThan0~3_combout\);

-- Location: MLABCELL_X82_Y8_N48
\LessThan0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = ( \LessThan0~5_combout\ & ( \LessThan0~3_combout\ & ( !\One_second:loopcount[25]~q\ ) ) ) # ( !\LessThan0~5_combout\ & ( \LessThan0~3_combout\ & ( (!\One_second:loopcount[24]~q\) # (!\One_second:loopcount[25]~q\) ) ) ) # ( 
-- \LessThan0~5_combout\ & ( !\LessThan0~3_combout\ & ( (!\One_second:loopcount[25]~q\) # ((!\One_second:loopcount[24]~q\ & (!\One_second:loopcount[16]~q\ & !\One_second:loopcount[18]~q\))) ) ) ) # ( !\LessThan0~5_combout\ & ( !\LessThan0~3_combout\ & ( 
-- (!\One_second:loopcount[24]~q\) # (!\One_second:loopcount[25]~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110101010111111111000000011111111101010101111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_One_second:loopcount[24]~q\,
	datab => \ALT_INV_One_second:loopcount[16]~q\,
	datac => \ALT_INV_One_second:loopcount[18]~q\,
	datad => \ALT_INV_One_second:loopcount[25]~q\,
	datae => \ALT_INV_LessThan0~5_combout\,
	dataf => \ALT_INV_LessThan0~3_combout\,
	combout => \LessThan0~6_combout\);

-- Location: FF_X82_Y8_N53
enable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputCLKENA0_outclk\,
	asdata => \LessThan0~6_combout\,
	clrn => \KEY[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \enable~q\);

-- Location: FF_X82_Y8_N59
\freq[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \freq[0]~feeder_combout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(0));

-- Location: MLABCELL_X82_Y8_N0
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( \freq~535902\(1) ) + ( \freq~535902\(0) ) + ( !VCC ))
-- \Add1~2\ = CARRY(( \freq~535902\(1) ) + ( \freq~535902\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(0),
	datad => \ALT_INV_freq~535902\(1),
	cin => GND,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: MLABCELL_X82_Y8_N54
\freq[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \freq[1]~feeder_combout\ = \Add1~1_sumout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Add1~1_sumout\,
	combout => \freq[1]~feeder_combout\);

-- Location: FF_X82_Y8_N56
\freq[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \freq[1]~feeder_combout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(1));

-- Location: MLABCELL_X82_Y8_N3
\Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~57_sumout\ = SUM(( \freq~535902\(2) ) + ( GND ) + ( \Add1~2\ ))
-- \Add1~58\ = CARRY(( \freq~535902\(2) ) + ( GND ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_freq~535902\(2),
	cin => \Add1~2\,
	sumout => \Add1~57_sumout\,
	cout => \Add1~58\);

-- Location: FF_X82_Y8_N5
\freq[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~57_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(2));

-- Location: MLABCELL_X82_Y8_N6
\Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~53_sumout\ = SUM(( \freq~535902\(3) ) + ( GND ) + ( \Add1~58\ ))
-- \Add1~54\ = CARRY(( \freq~535902\(3) ) + ( GND ) + ( \Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(3),
	cin => \Add1~58\,
	sumout => \Add1~53_sumout\,
	cout => \Add1~54\);

-- Location: FF_X82_Y8_N8
\freq[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~53_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(3));

-- Location: MLABCELL_X82_Y8_N9
\Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~37_sumout\ = SUM(( \freq~535902\(4) ) + ( GND ) + ( \Add1~54\ ))
-- \Add1~38\ = CARRY(( \freq~535902\(4) ) + ( GND ) + ( \Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_freq~535902\(4),
	cin => \Add1~54\,
	sumout => \Add1~37_sumout\,
	cout => \Add1~38\);

-- Location: FF_X82_Y8_N11
\freq[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~37_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(4));

-- Location: MLABCELL_X82_Y8_N12
\Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~49_sumout\ = SUM(( \freq~535902\(5) ) + ( GND ) + ( \Add1~38\ ))
-- \Add1~50\ = CARRY(( \freq~535902\(5) ) + ( GND ) + ( \Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_freq~535902\(5),
	cin => \Add1~38\,
	sumout => \Add1~49_sumout\,
	cout => \Add1~50\);

-- Location: FF_X82_Y8_N14
\freq[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~49_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(5));

-- Location: MLABCELL_X82_Y8_N15
\Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~45_sumout\ = SUM(( \freq~535902\(6) ) + ( GND ) + ( \Add1~50\ ))
-- \Add1~46\ = CARRY(( \freq~535902\(6) ) + ( GND ) + ( \Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_freq~535902\(6),
	cin => \Add1~50\,
	sumout => \Add1~45_sumout\,
	cout => \Add1~46\);

-- Location: FF_X82_Y8_N17
\freq[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~45_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(6));

-- Location: MLABCELL_X82_Y8_N18
\Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~41_sumout\ = SUM(( \freq~535902\(7) ) + ( GND ) + ( \Add1~46\ ))
-- \Add1~42\ = CARRY(( \freq~535902\(7) ) + ( GND ) + ( \Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(7),
	cin => \Add1~46\,
	sumout => \Add1~41_sumout\,
	cout => \Add1~42\);

-- Location: FF_X82_Y8_N20
\freq[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~41_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(7));

-- Location: MLABCELL_X82_Y8_N21
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( \freq~535902\(8) ) + ( GND ) + ( \Add1~42\ ))
-- \Add1~22\ = CARRY(( \freq~535902\(8) ) + ( GND ) + ( \Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_freq~535902\(8),
	cin => \Add1~42\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: FF_X82_Y8_N23
\freq[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~21_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(8));

-- Location: MLABCELL_X82_Y8_N24
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( \freq~535902\(9) ) + ( GND ) + ( \Add1~22\ ))
-- \Add1~34\ = CARRY(( \freq~535902\(9) ) + ( GND ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_freq~535902\(9),
	cin => \Add1~22\,
	sumout => \Add1~33_sumout\,
	cout => \Add1~34\);

-- Location: FF_X82_Y8_N26
\freq[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~33_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(9));

-- Location: MLABCELL_X82_Y8_N27
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( \freq~535902\(10) ) + ( GND ) + ( \Add1~34\ ))
-- \Add1~30\ = CARRY(( \freq~535902\(10) ) + ( GND ) + ( \Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_freq~535902\(10),
	cin => \Add1~34\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\);

-- Location: FF_X82_Y8_N29
\freq[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~29_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(10));

-- Location: MLABCELL_X82_Y8_N30
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( \freq~535902\(11) ) + ( GND ) + ( \Add1~30\ ))
-- \Add1~26\ = CARRY(( \freq~535902\(11) ) + ( GND ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_freq~535902\(11),
	cin => \Add1~30\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: FF_X82_Y8_N32
\freq[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~25_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(11));

-- Location: MLABCELL_X82_Y8_N33
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( \freq~535902\(12) ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~6\ = CARRY(( \freq~535902\(12) ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(12),
	cin => \Add1~26\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: FF_X82_Y8_N35
\freq[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~5_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(12));

-- Location: MLABCELL_X82_Y8_N36
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( \freq~535902\(13) ) + ( GND ) + ( \Add1~6\ ))
-- \Add1~18\ = CARRY(( \freq~535902\(13) ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_freq~535902\(13),
	cin => \Add1~6\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: FF_X82_Y8_N38
\freq[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~17_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(13));

-- Location: MLABCELL_X82_Y8_N39
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( \freq~535902\(14) ) + ( GND ) + ( \Add1~18\ ))
-- \Add1~14\ = CARRY(( \freq~535902\(14) ) + ( GND ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(14),
	cin => \Add1~18\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: FF_X82_Y8_N41
\freq[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~13_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(14));

-- Location: MLABCELL_X82_Y8_N42
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( \freq~535902\(15) ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(15),
	cin => \Add1~14\,
	sumout => \Add1~9_sumout\);

-- Location: FF_X82_Y8_N44
\freq[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock|count\(0),
	d => \Add1~9_sumout\,
	clrn => \KEY[2]~input_o\,
	ena => \enable~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \freq~535902\(15));

-- Location: MLABCELL_X82_Y9_N36
\display3|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[0]~0_combout\ = ( \freq~535902\(12) & ( (!\freq~535902\(15) & (!\freq~535902\(13) & !\freq~535902\(14))) # (\freq~535902\(15) & (!\freq~535902\(13) $ (!\freq~535902\(14)))) ) ) # ( !\freq~535902\(12) & ( (!\freq~535902\(15) & 
-- (!\freq~535902\(13) & \freq~535902\(14))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100000000000001010000010100101010100001010010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(15),
	datac => \ALT_INV_freq~535902\(13),
	datad => \ALT_INV_freq~535902\(14),
	dataf => \ALT_INV_freq~535902\(12),
	combout => \display3|aout[0]~0_combout\);

-- Location: MLABCELL_X82_Y9_N6
\display3|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[1]~1_combout\ = ( \freq~535902\(12) & ( (!\freq~535902\(15) & (!\freq~535902\(13) & \freq~535902\(14))) # (\freq~535902\(15) & (\freq~535902\(13))) ) ) # ( !\freq~535902\(12) & ( (\freq~535902\(14) & ((\freq~535902\(13)) # 
-- (\freq~535902\(15)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001011111000000000101111100000101101001010000010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(15),
	datac => \ALT_INV_freq~535902\(13),
	datad => \ALT_INV_freq~535902\(14),
	dataf => \ALT_INV_freq~535902\(12),
	combout => \display3|aout[1]~1_combout\);

-- Location: LABCELL_X81_Y9_N24
\display3|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[2]~2_combout\ = ( \freq~535902\(14) & ( (\freq~535902\(15) & ((!\freq~535902\(12)) # (\freq~535902\(13)))) ) ) # ( !\freq~535902\(14) & ( (!\freq~535902\(12) & (\freq~535902\(13) & !\freq~535902\(15))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000000000001000100000000000000000101110110000000010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(12),
	datab => \ALT_INV_freq~535902\(13),
	datad => \ALT_INV_freq~535902\(15),
	dataf => \ALT_INV_freq~535902\(14),
	combout => \display3|aout[2]~2_combout\);

-- Location: MLABCELL_X82_Y9_N3
\display3|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[3]~3_combout\ = ( \freq~535902\(14) & ( (!\freq~535902\(13) & (!\freq~535902\(12) & !\freq~535902\(15))) # (\freq~535902\(13) & (\freq~535902\(12))) ) ) # ( !\freq~535902\(14) & ( (!\freq~535902\(13) & (\freq~535902\(12))) # 
-- (\freq~535902\(13) & (!\freq~535902\(12) & \freq~535902\(15))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001001100110001000100110011010011001000100011001100100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(13),
	datab => \ALT_INV_freq~535902\(12),
	datad => \ALT_INV_freq~535902\(15),
	dataf => \ALT_INV_freq~535902\(14),
	combout => \display3|aout[3]~3_combout\);

-- Location: LABCELL_X81_Y9_N15
\display3|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[4]~4_combout\ = ( !\freq~535902\(15) & ( \freq~535902\(14) & ( (!\freq~535902\(13)) # (\freq~535902\(12)) ) ) ) # ( \freq~535902\(15) & ( !\freq~535902\(14) & ( (\freq~535902\(12) & !\freq~535902\(13)) ) ) ) # ( !\freq~535902\(15) & ( 
-- !\freq~535902\(14) & ( \freq~535902\(12) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010100000101000011110101111101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(12),
	datac => \ALT_INV_freq~535902\(13),
	datae => \ALT_INV_freq~535902\(15),
	dataf => \ALT_INV_freq~535902\(14),
	combout => \display3|aout[4]~4_combout\);

-- Location: LABCELL_X83_Y8_N15
\display3|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[5]~5_combout\ = ( \freq~535902\(14) & ( \freq~535902\(13) & ( (!\freq~535902\(15) & \freq~535902\(12)) ) ) ) # ( !\freq~535902\(14) & ( \freq~535902\(13) & ( !\freq~535902\(15) ) ) ) # ( \freq~535902\(14) & ( !\freq~535902\(13) & ( 
-- (\freq~535902\(15) & \freq~535902\(12)) ) ) ) # ( !\freq~535902\(14) & ( !\freq~535902\(13) & ( (!\freq~535902\(15) & \freq~535902\(12)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000001010000010110101010101010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(15),
	datac => \ALT_INV_freq~535902\(12),
	datae => \ALT_INV_freq~535902\(14),
	dataf => \ALT_INV_freq~535902\(13),
	combout => \display3|aout[5]~5_combout\);

-- Location: LABCELL_X80_Y9_N15
\display3|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display3|aout[6]~6_combout\ = ( \freq~535902\(12) & ( \freq~535902\(13) & ( (!\freq~535902\(15) & \freq~535902\(14)) ) ) ) # ( \freq~535902\(12) & ( !\freq~535902\(13) & ( (!\freq~535902\(15) & !\freq~535902\(14)) ) ) ) # ( !\freq~535902\(12) & ( 
-- !\freq~535902\(13) & ( !\freq~535902\(15) $ (\freq~535902\(14)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010010110100101101000001010000000000000000000000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(15),
	datac => \ALT_INV_freq~535902\(14),
	datae => \ALT_INV_freq~535902\(12),
	dataf => \ALT_INV_freq~535902\(13),
	combout => \display3|aout[6]~6_combout\);

-- Location: LABCELL_X88_Y12_N27
\display2|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[0]~0_combout\ = ( \freq~535902\(11) & ( \freq~535902\(8) & ( !\freq~535902\(9) $ (!\freq~535902\(10)) ) ) ) # ( !\freq~535902\(11) & ( \freq~535902\(8) & ( (!\freq~535902\(9) & !\freq~535902\(10)) ) ) ) # ( !\freq~535902\(11) & ( 
-- !\freq~535902\(8) & ( (!\freq~535902\(9) & \freq~535902\(10)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000000000000000010100000101000000101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(9),
	datac => \ALT_INV_freq~535902\(10),
	datae => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(8),
	combout => \display2|aout[0]~0_combout\);

-- Location: LABCELL_X88_Y12_N42
\display2|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[1]~1_combout\ = ( \freq~535902\(11) & ( \freq~535902\(8) & ( \freq~535902\(9) ) ) ) # ( !\freq~535902\(11) & ( \freq~535902\(8) & ( (\freq~535902\(10) & !\freq~535902\(9)) ) ) ) # ( \freq~535902\(11) & ( !\freq~535902\(8) & ( 
-- \freq~535902\(10) ) ) ) # ( !\freq~535902\(11) & ( !\freq~535902\(8) & ( (\freq~535902\(10) & \freq~535902\(9)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011001100110011001100110000001100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(10),
	datac => \ALT_INV_freq~535902\(9),
	datae => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(8),
	combout => \display2|aout[1]~1_combout\);

-- Location: LABCELL_X88_Y12_N15
\display2|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[2]~2_combout\ = ( \freq~535902\(11) & ( \freq~535902\(8) & ( (\freq~535902\(9) & \freq~535902\(10)) ) ) ) # ( \freq~535902\(11) & ( !\freq~535902\(8) & ( \freq~535902\(10) ) ) ) # ( !\freq~535902\(11) & ( !\freq~535902\(8) & ( 
-- (\freq~535902\(9) & !\freq~535902\(10)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000000011110000111100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(9),
	datac => \ALT_INV_freq~535902\(10),
	datae => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(8),
	combout => \display2|aout[2]~2_combout\);

-- Location: LABCELL_X88_Y12_N18
\display2|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[3]~3_combout\ = ( \freq~535902\(11) & ( \freq~535902\(8) & ( !\freq~535902\(10) $ (\freq~535902\(9)) ) ) ) # ( !\freq~535902\(11) & ( \freq~535902\(8) & ( !\freq~535902\(10) $ (\freq~535902\(9)) ) ) ) # ( \freq~535902\(11) & ( 
-- !\freq~535902\(8) & ( (!\freq~535902\(10) & \freq~535902\(9)) ) ) ) # ( !\freq~535902\(11) & ( !\freq~535902\(8) & ( (\freq~535902\(10) & !\freq~535902\(9)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000011000000110011000011110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(10),
	datac => \ALT_INV_freq~535902\(9),
	datae => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(8),
	combout => \display2|aout[3]~3_combout\);

-- Location: LABCELL_X88_Y12_N39
\display2|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[4]~4_combout\ = ( \freq~535902\(11) & ( \freq~535902\(8) & ( (!\freq~535902\(9) & !\freq~535902\(10)) ) ) ) # ( !\freq~535902\(11) & ( \freq~535902\(8) ) ) # ( !\freq~535902\(11) & ( !\freq~535902\(8) & ( (!\freq~535902\(9) & 
-- \freq~535902\(10)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000000000000000011111111111111111010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(9),
	datac => \ALT_INV_freq~535902\(10),
	datae => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(8),
	combout => \display2|aout[4]~4_combout\);

-- Location: LABCELL_X88_Y12_N30
\display2|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[5]~5_combout\ = ( \freq~535902\(10) & ( (\freq~535902\(8) & (!\freq~535902\(9) $ (!\freq~535902\(11)))) ) ) # ( !\freq~535902\(10) & ( (!\freq~535902\(11) & ((\freq~535902\(8)) # (\freq~535902\(9)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011100000000011101110000000000010001001000100001000100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(9),
	datab => \ALT_INV_freq~535902\(8),
	datad => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(10),
	combout => \display2|aout[5]~5_combout\);

-- Location: LABCELL_X88_Y12_N33
\display2|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display2|aout[6]~6_combout\ = ( \freq~535902\(10) & ( (!\freq~535902\(9) & (!\freq~535902\(8) & \freq~535902\(11))) # (\freq~535902\(9) & (\freq~535902\(8) & !\freq~535902\(11))) ) ) # ( !\freq~535902\(10) & ( (!\freq~535902\(9) & !\freq~535902\(11)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000000011000000110000001100000011000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(9),
	datab => \ALT_INV_freq~535902\(8),
	datac => \ALT_INV_freq~535902\(11),
	dataf => \ALT_INV_freq~535902\(10),
	combout => \display2|aout[6]~6_combout\);

-- Location: LABCELL_X88_Y12_N3
\display1|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[0]~0_combout\ = ( \freq~535902\(5) & ( (\freq~535902\(7) & (\freq~535902\(4) & !\freq~535902\(6))) ) ) # ( !\freq~535902\(5) & ( (!\freq~535902\(7) & (!\freq~535902\(4) $ (!\freq~535902\(6)))) # (\freq~535902\(7) & (\freq~535902\(4) & 
-- \freq~535902\(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110011000011000011001100001100000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(7),
	datac => \ALT_INV_freq~535902\(4),
	datad => \ALT_INV_freq~535902\(6),
	dataf => \ALT_INV_freq~535902\(5),
	combout => \display1|aout[0]~0_combout\);

-- Location: LABCELL_X88_Y12_N6
\display1|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[1]~1_combout\ = ( \freq~535902\(4) & ( (!\freq~535902\(5) & (!\freq~535902\(7) & \freq~535902\(6))) # (\freq~535902\(5) & (\freq~535902\(7))) ) ) # ( !\freq~535902\(4) & ( (\freq~535902\(6) & ((\freq~535902\(7)) # (\freq~535902\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011100000111000001110000011100011001000110010001100100011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(5),
	datab => \ALT_INV_freq~535902\(7),
	datac => \ALT_INV_freq~535902\(6),
	dataf => \ALT_INV_freq~535902\(4),
	combout => \display1|aout[1]~1_combout\);

-- Location: LABCELL_X88_Y12_N9
\display1|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[2]~2_combout\ = ( \freq~535902\(4) & ( (\freq~535902\(5) & (\freq~535902\(7) & \freq~535902\(6))) ) ) # ( !\freq~535902\(4) & ( (!\freq~535902\(7) & (\freq~535902\(5) & !\freq~535902\(6))) # (\freq~535902\(7) & ((\freq~535902\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000001111010100000000111100000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(5),
	datac => \ALT_INV_freq~535902\(7),
	datad => \ALT_INV_freq~535902\(6),
	dataf => \ALT_INV_freq~535902\(4),
	combout => \display1|aout[2]~2_combout\);

-- Location: LABCELL_X88_Y12_N48
\display1|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[3]~3_combout\ = ( \freq~535902\(4) & ( !\freq~535902\(5) $ (\freq~535902\(6)) ) ) # ( !\freq~535902\(4) & ( (!\freq~535902\(5) & (!\freq~535902\(7) & \freq~535902\(6))) # (\freq~535902\(5) & (\freq~535902\(7) & !\freq~535902\(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110001000000100011000100010101010010101011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(5),
	datab => \ALT_INV_freq~535902\(7),
	datad => \ALT_INV_freq~535902\(6),
	dataf => \ALT_INV_freq~535902\(4),
	combout => \display1|aout[3]~3_combout\);

-- Location: LABCELL_X88_Y12_N51
\display1|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[4]~4_combout\ = ( \freq~535902\(5) & ( (!\freq~535902\(7) & \freq~535902\(4)) ) ) # ( !\freq~535902\(5) & ( (!\freq~535902\(6) & ((\freq~535902\(4)))) # (\freq~535902\(6) & (!\freq~535902\(7))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111001100000011111100110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(7),
	datac => \ALT_INV_freq~535902\(4),
	datad => \ALT_INV_freq~535902\(6),
	dataf => \ALT_INV_freq~535902\(5),
	combout => \display1|aout[4]~4_combout\);

-- Location: LABCELL_X88_Y12_N54
\display1|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[5]~5_combout\ = ( \freq~535902\(5) & ( (!\freq~535902\(7) & ((!\freq~535902\(6)) # (\freq~535902\(4)))) ) ) # ( !\freq~535902\(5) & ( (\freq~535902\(4) & (!\freq~535902\(6) $ (\freq~535902\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000000011001100000000001111110011000000001111001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_freq~535902\(4),
	datac => \ALT_INV_freq~535902\(6),
	datad => \ALT_INV_freq~535902\(7),
	dataf => \ALT_INV_freq~535902\(5),
	combout => \display1|aout[5]~5_combout\);

-- Location: LABCELL_X88_Y12_N0
\display1|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display1|aout[6]~6_combout\ = ( \freq~535902\(4) & ( (!\freq~535902\(7) & (!\freq~535902\(5) $ (\freq~535902\(6)))) ) ) # ( !\freq~535902\(4) & ( (!\freq~535902\(5) & (!\freq~535902\(7) $ (\freq~535902\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000100010100010000010001010001000010001001000100001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(5),
	datab => \ALT_INV_freq~535902\(7),
	datad => \ALT_INV_freq~535902\(6),
	dataf => \ALT_INV_freq~535902\(4),
	combout => \display1|aout[6]~6_combout\);

-- Location: LABCELL_X88_Y8_N3
\display0|aout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[0]~0_combout\ = ( \freq~535902\(1) & ( \freq~535902\(3) & ( (\freq~535902\(0) & !\freq~535902\(2)) ) ) ) # ( !\freq~535902\(1) & ( \freq~535902\(3) & ( (\freq~535902\(0) & \freq~535902\(2)) ) ) ) # ( !\freq~535902\(1) & ( !\freq~535902\(3) 
-- & ( !\freq~535902\(0) $ (!\freq~535902\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110000000000000000000010001000100010100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(0),
	datab => \ALT_INV_freq~535902\(2),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(3),
	combout => \display0|aout[0]~0_combout\);

-- Location: LABCELL_X88_Y8_N42
\display0|aout[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[1]~1_combout\ = ( \freq~535902\(1) & ( \freq~535902\(2) & ( (\Add1~1_sumout\) # (\freq~535902\(3)) ) ) ) # ( !\freq~535902\(1) & ( \freq~535902\(2) & ( (!\freq~535902\(3) & (\Add1~1_sumout\)) # (\freq~535902\(3) & ((!\freq~535902\(0)))) ) ) 
-- ) # ( \freq~535902\(1) & ( !\freq~535902\(2) & ( (\freq~535902\(3) & \freq~535902\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010101110010011100100111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(3),
	datab => \ALT_INV_Add1~1_sumout\,
	datac => \ALT_INV_freq~535902\(0),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(2),
	combout => \display0|aout[1]~1_combout\);

-- Location: LABCELL_X88_Y8_N15
\display0|aout[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[2]~2_combout\ = ( \freq~535902\(1) & ( \freq~535902\(3) & ( !\freq~535902\(2) ) ) ) # ( !\freq~535902\(1) & ( \freq~535902\(3) & ( (!\freq~535902\(2)) # (\freq~535902\(0)) ) ) ) # ( \freq~535902\(1) & ( !\freq~535902\(3) & ( 
-- (\freq~535902\(2)) # (\freq~535902\(0)) ) ) ) # ( !\freq~535902\(1) & ( !\freq~535902\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111011101110111011111011101110111011100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(0),
	datab => \ALT_INV_freq~535902\(2),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(3),
	combout => \display0|aout[2]~2_combout\);

-- Location: LABCELL_X88_Y8_N54
\display0|aout[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[3]~3_combout\ = ( \freq~535902\(1) & ( \freq~535902\(2) & ( \freq~535902\(0) ) ) ) # ( !\freq~535902\(1) & ( \freq~535902\(2) & ( (!\freq~535902\(3) & !\freq~535902\(0)) ) ) ) # ( \freq~535902\(1) & ( !\freq~535902\(2) & ( (\freq~535902\(3) 
-- & !\freq~535902\(0)) ) ) ) # ( !\freq~535902\(1) & ( !\freq~535902\(2) & ( \freq~535902\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111010100000101000010100000101000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(3),
	datac => \ALT_INV_freq~535902\(0),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(2),
	combout => \display0|aout[3]~3_combout\);

-- Location: LABCELL_X88_Y8_N39
\display0|aout[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[4]~4_combout\ = ( !\freq~535902\(1) & ( \freq~535902\(3) & ( (\freq~535902\(0) & !\freq~535902\(2)) ) ) ) # ( \freq~535902\(1) & ( !\freq~535902\(3) & ( \freq~535902\(0) ) ) ) # ( !\freq~535902\(1) & ( !\freq~535902\(3) & ( 
-- (\freq~535902\(2)) # (\freq~535902\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111010101010101010101000100010001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(0),
	datab => \ALT_INV_freq~535902\(2),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(3),
	combout => \display0|aout[4]~4_combout\);

-- Location: LABCELL_X88_Y8_N30
\display0|aout[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[5]~5_combout\ = ( \freq~535902\(1) & ( \freq~535902\(2) & ( (!\freq~535902\(3) & \freq~535902\(0)) ) ) ) # ( !\freq~535902\(1) & ( \freq~535902\(2) & ( (\freq~535902\(3) & \freq~535902\(0)) ) ) ) # ( \freq~535902\(1) & ( !\freq~535902\(2) & 
-- ( !\freq~535902\(3) ) ) ) # ( !\freq~535902\(1) & ( !\freq~535902\(2) & ( (!\freq~535902\(3) & \freq~535902\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010101010101010101000000101000001010000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(3),
	datac => \ALT_INV_freq~535902\(0),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(2),
	combout => \display0|aout[5]~5_combout\);

-- Location: LABCELL_X88_Y8_N48
\display0|aout[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \display0|aout[6]~6_combout\ = ( \freq~535902\(1) & ( \freq~535902\(2) & ( (!\freq~535902\(3) & \freq~535902\(0)) ) ) ) # ( !\freq~535902\(1) & ( \freq~535902\(2) & ( (\freq~535902\(3) & !\freq~535902\(0)) ) ) ) # ( !\freq~535902\(1) & ( !\freq~535902\(2) 
-- & ( !\freq~535902\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010000000000000000001010000010100000000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_freq~535902\(3),
	datac => \ALT_INV_freq~535902\(0),
	datae => \ALT_INV_freq~535902\(1),
	dataf => \ALT_INV_freq~535902\(2),
	combout => \display0|aout[6]~6_combout\);

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

-- Location: LABCELL_X40_Y4_N0
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


