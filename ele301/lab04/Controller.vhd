library IEEE;
use IEEE.std_logic_1164.all;

entity Controller is
	port( 
			reset: in std_logic;
			key_restart: in std_logic;
			clock: in std_logic;
			key_in: in std_logic;
			LED_ready: 	out std_logic;
			LED_go: 	out std_logic;
			press: out std_logic;
			resetped: out std_logic;
			count: out std_logic;
			timeup: in std_logic
			);
end Controller;

architecture Controller_example of Controller is 
	-- The state names for the Controller FSM
	type Controller_state_type is (wait1, wait2, wait3, count1, count2, hold, finish);
	signal state : Controller_state_type;	
begin
	---------------------------------------------------------
	-- This process creates a finite state machine (FSM)
	-- with state variable FSM defined above. It examines the
	-- filtered KEY3 (INPUT) and control the BCD_counter
	-- so it behaves like a stopwatch
	---------------------------------------------------------
	Controller_behaviour: process(clock, reset)
	begin
		if(reset = '0') then	--Master reset		
			LED_ready <= '1';
			LED_go <= '0';
			press <= '0';
			count <= '0';
			resetped <= '1';
			state <= wait1;
			
		elsif(clock'event AND clock = '1') then
			case state is
				when wait1 =>	
					LED_ready <= '1';
					LED_go <= '0';
					press <= '0';
					count <= '0';
					resetped <= '1';
					state <= wait2;
					
				when wait2 =>	
					resetped <= '1';
					if(key_in = '0') then
						state <= wait3;					
					else
						state <= wait2;
					end if;
						
				when wait3 =>
					if(key_in = '1') then
						state <= count1;					
					else
						state <= wait3;
					end if;
				
				when count1 =>
					LED_go <= '1';
					LED_ready <= '0';
					press <= '1';
					count <= '1';
					state <= count2;
				
				when count2 =>
					press <= '0';
					if(timeup = '1') then
						state <= hold;					
					else
						state <= wait2;
					end if;
				
				when hold =>
					count <= '0';
					LED_ready <= '1';
					if(key_restart = '0') then
						state <= finish;					
					else
						state <= hold;
					end if;
				
				when finish =>
					LED_go <= '0';
					if(key_restart = '1') then
						state <= wait1;					
					else
						state <= finish;
					end if;
					
				when others =>
					state <= wait1;
			
			end case;
		end if;		
	end process;
end architecture Controller_example;
