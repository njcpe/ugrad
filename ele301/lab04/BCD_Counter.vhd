library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity BCD_Counter is
	port( clock: in std_logic;
			reset: in std_logic;
			enable: in std_logic;
			n0, n1, n2, n3: buffer unsigned(3 downto 0)
			);
end BCD_Counter;

architecture alone of BCD_Counter is 
begin
	Running_counter: process(clock, reset)
	begin
		if(reset = '1') then --Reset is active high
			n0 <= "0000";  -- reset the decimal number to "00000"
			n1 <= "0000";
			n2 <= "0000";
			n3 <= "0000";
		elsif(clock'event AND clock = '1' and enable='1') then
			if(n0="1001") then --when n0=9, reset it to 0
				n0 <= "0000";
				if(n1="1001") then --when n1=9, reset it to 0
					n1 <= "0000";
					if(n2="1001") then
						n2 <= "0000";
						if(n3="1001") then 
							n3 <= "0000";
						else
							n3 <= n3 + 1;
						end if;	
					else
						n2 <= n2 + 1; 
					end if;	
				else
					n1 <= n1 + 1;  --when n1 /= 9, inc n1
				end if;
			else
				n0 <= n0 + 1; --when n0 /= 9, inc n0
			end if;
		end if;
	end process;	
end architecture alone;
