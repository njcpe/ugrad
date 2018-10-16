library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Pedometer is
	port( 
			clock_50: in std_logic;
			KEY: in std_logic_vector(3 downto 0);
			HEX0, HEX1, HEX2, HEX3: out std_logic_vector(6 downto 0); 
			LED: out std_logic_vector(9 downto 0)
			);
end Pedometer;

architecture examples of Pedometer is \

begin

	debounce1: entity work.debounce port map( clock => clock_50,
															pin => KEY(3),
															output => a1
														);
	
	debounce2: entity work.debounce port map( clock => clock_50,
															pin => KEY(2),
															output => a2
														);
	
	contoller1: entity work.Controller port map( reset => KEY(0),
																key_in => a1,
																restart => a2,
																clk => clock_50,
																LED_ready => b1,
																LED_go => b2,
																press => b3,
																resetped => b4,
																count => b5,
																timeup => c1
															);
	
	timer1: entity work.Timer_10s port map( clock_50 => clock_50,
																start => b5,
																done => c1
														);
															
	
	step_count: entity work.BCD_Counter port map(
																clock => b3,
																reset => b4,
																enable => b5,
																n0 => d1,
																n1 => d2,
																n2 => d3,
																n3 => d4
																);
	
	sevenseg0: entity work.sevenseg port map(
																ain => d1,
																aout => HEX3
														);
														
	sevenseg1: entity work.sevenseg port map(
																ain => d2,
																aout => HEX2
														);
														
	sevenseg2: entity work.sevenseg port map(
																ain => d3,
																aout => HEX1
														);

	sevenseg3: entity work.sevenseg port map(
																ain => d4,
																aout => HEX0
														);													
end architecture;	