library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	port (
			clock_50:	in std_logic;
			KEY: 			in std_logic_vector(3 downto 0);
			SW:			in std_logic_vector(9 downto 0);
			HEX0,HEX1: 	out std_logic_vector(6 downto 0)
			);
end entity;

architecture Lab02 of counter is
		signal count, lp :	std_logic_vector(3 downto 0);
		signal newclk :		std_logic;
begin

	filter:		entity work.debounce port map(key(3), newclk, clock_50);
	display0:	entity work.sevenseg port map(count, hex0);
	display1:	entity work.sevenseg port map(lp, hex1);
----------------------------------------------------------
--Second two-layer Counter example from Figure 3.28
	Counter2: process(newclk, key(0))
		variable loopcount : integer range 0 to 16;
	begin
		if(key(0) ='0') then
				loopcount := 0;
				lp <= x"0";
				count <= "0000";
		elsif(newclk'event and newclk='1') then
				if(loopcount = 15) then
					loopcount := 0;
					count <= std_logic_vector(unsigned(count)
								+ unsigned(SW(3 downto 0)));
				else
					loopcount := loopcount 
								+ to_integer(unsigned(SW(7 downto 4)));
				end if;
				lp <= std_logic_vector(to_unsigned(loopcount, 4));
		end if;
	end process;
end architecture lab02;