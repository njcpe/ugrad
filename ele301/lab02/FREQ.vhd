library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity FREQ is
		port (
			clock_50:	in std_logic;
			KEY:	in std_logic_vector(3 downto 0);
			SW:	in std_logic_vector(9 downto 0);
			HEX3, HEX2, HEX1, HEX0 :	out std_logic_vector(6 downto 0)
				);
end entity;

architecture lab02 of FREQ is 
			signal enable, UDT : std_logic; 
			signal freq : unsigned (15 downto 0);
			signal count : std_logic_vector(3 downto 0);
begin

	display0: entity work.sevenseg port map
			(std_logic_vector(freq(3 downto 0)), hex0);
	display1: entity work.sevenseg port map
			(std_logic_vector(freq(7 downto 4)), hex1);
	display2: entity work.sevenseg port map
			(std_logic_vector(freq(11 downto 8)), hex2);
	display3: entity work.sevenseg port map
			(std_logic_vector(freq(15 downto 12)), hex3);
			
	clock_gen: entity work.freq_gen port map
			(clock_50, key(0),SW(7 downto 0),UDT);

--This is based on the two-level counter from Figure 3.27

Half_Hertz: process(clock_50, key(0))
	variable loopcount : integer range 0 to 50000000;

begin
	if(key(0) = '0') then
				loopcount := 0;
				enable <= '0';
	elsif(clock_50'event and clock_50='1') then
		if(loopcount < 49999999) then
			loopcount := loopcount + 1;
			enable <= '1';
		else
			enable <= '0';
		end if;
	end if;
end process;

--This is based on the Counter example with enable from Figure 3.26
Binary_counter: process (UDT, key(2))
begin
		if(key(2)='0') then
			freq <= x"0000";
		elsif(UDT'event and UDT='1') then
			if(enable = '1') then
				freq <= freq + 1;
			end if;
		end if;
end process;

end architecture lab02;