--Second two-layer Counter example from Figure 3.28
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity freq_gen is
		port (
			clock:		in std_logic;
			reset:		in std_logic;
			inputSRC:	in std_logic_vector(7 downto 0);
			clk:			out std_logic
				);
end entity;

architecture lab02 of freq_gen is 
			signal count : std_logic_vector(3 downto 0);
begin

clk <= count(0);

Counter_UDT: process(clock, reset)
	variable loopcount : integer range 0 to 1000000;
begin
		if(reset = '0') then
			loopcount := 0;
			count <= "0000";
		elsif(clock'event and clock='1') then
			if(loopcount >= 999999) then
				loopcount := 0;
				count <= std_logic_vector(unsigned(count) + unsigned(inputSRC(3 downto 0)));
			else
				loopcount := loopcount + to_integer(unsigned(inputSRC(7 downto 4)));
			end if;
		end if;
end process;
end architecture;