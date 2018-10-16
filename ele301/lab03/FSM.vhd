library IEEE;
use IEEE.std_logic_1164.all;

entity fsm is
	port( clock_50	: in std_logic;
			KEY		: in std_logic_vector(3 downto 0);
			LEDR		: buffer std_logic_vector(9 downto 0)
		);
end fsm;

architecture problem5 of fsm is 
	alias clock : std_logic is clock_50;
	alias reset : std_logic is KEY(0);
	alias LED : std_logic is LEDR(0);
	--Due to the name conflict the name "KEY" used in the book
	--was changed to "PB"
	signal PB : std_logic;
	signal start, clear, timeup: std_logic;
	
	type state_type is (wait1, wait2, wait3, wait4, wait5, wait6, wait7, wait8, blink1, blink2, blink3, blink4, blink1a, blink2a, blink3a, blink4a, timer);
	signal state: state_type;
	
	type timer_state is (standby, count, check, done);
	signal tstate: timer_state;

begin
	
   key_debounce : entity work.debounce generic map(
      CYCLES => 8
   )
   port map(
      pin => key(3),
      output => PB,
      clock => clock
   );

--------------------------------------------------
--Version 1: Two FSM in separate Process
--------------------------------------------------		
	timer_FSM: Process(clock, reset)
	variable cnt: integer range 0 to 50000000;
	begin
		if(reset='0') then
			timeup <= '0';
			cnt := 0;
			tstate <= standby;
		elsif(clock'event and clock='1') then
			case tstate is
			
				when standby =>
					timeup <= '0';
					if(start='1') then
						tstate <= count;
						cnt := 0;
					end if;
				
				when count =>
					cnt := cnt + 1;
					if(clear='1') then
						tstate <= standby;
					else
						tstate <= check;
					end if;
				
				when check =>
					if(clear='1') then
						tstate <= standby;
					elsif(cnt = 49999999) then
						tstate <= done;
					else
						tstate <= count;
					end if;
				
				when done =>
					timeup <= '1';
					tstate <= standby;
				
				when others =>
					tstate <= standby;
			
			end case;
		end if;
	end process;			
			
	problem5: Process (clock, reset)
	begin
		if(reset='0') then
			LED <= '0';
			start <= '0';
			clear <= '0';
			LEDR(9 downto 6) <= x"0";
			state <= wait1;
		elsif(clock'event and clock='1') then
			case state is
				
				when wait1 =>				--waiting for first press
					clear <= '0';
					start <= '0';
					if(PB='0') then
						state <= wait2;
					end if;
					
				when wait2 =>				--starting timer
					if(PB='1') then
						state <= timer;
					end if;
				
				when timer =>				--timer init
					start <= '1';
					state <= wait3;
				
				when wait3 =>				--waiting for second press
					start <= '0';
					if(PB='0') then		--second press HERE
						state <= wait4;
					elsif(timeup='1') then
						state <= wait1;	--time up, back 2 wait1
					end if;
				
				when wait4 =>				
					LED <= '1';		 		--LED turns on
					clear <= '1';
					if(PB='1') then		--must wait for release
						state <= wait5;
					end if;
				
				when wait5 =>				--Waiting for first "off press"
					if(PB='0') then		--FIRST OFF PRESS HERE
						state <= wait6;
					end if;
					
				when wait6 =>
					if(PB='1') then
						start <= '1';
						state <= wait7;
					end if;
					
				when wait7 =>				--Waiting for second off press
					start <= '0';
					if(PB='0') then		--SECOND OFF PRESS HERE
						clear <= '1';
						state <= wait8;
					elsif(timeup = '1') then
						clear <= '1';
						state <= wait5;	--Times up, back to wait 5
					end if;
				
				when wait8 =>				--wait for release
					if(PB='1') then
							state <= blink1;
						end if;
				
				when blink1 =>
					LED <= '0';				--OFF
					LEDR(9 downto 6) <= x"1";
					start <= '1';
					state <= blink1a;
					
				when blink1a =>
					start <= '0';
					clear <= '0';
					LEDR(9 downto 6) <= x"2";
					if(timeup = '1') then
						clear <= '1';
						state <= blink2;
					end if;
					
				when blink2 =>
					LED <= '1';				--ON
					start <= '1';
					LEDR(9 downto 6) <= x"3";
					state <= blink2a;
					
				when blink2a =>
					start <= '0';
					clear <= '0';
					LEDR(9 downto 6) <= x"4";
					if(timeup = '1') then
						clear <= '1';
						state <= blink3;
					end if;
					
					
				when blink3 =>
					LED <= '0';				--OFF
					LEDR(9 downto 6) <= x"5";
					start <= '1';
					state <= blink3a;
					
				when blink3a =>
					start <= '0';
					clear <= '0';
					LEDR(9 downto 6) <= x"6";
					if(timeup = '1') then
						clear <= '1';
						state <= blink4;
					end if;
					
				when blink4 =>
					LED <= '1';				--ON
					start <= '1';
					LEDR(9 downto 6) <= x"7";
					state <= blink4a;
					
				when blink4a =>
					start <= '0';
					clear <= '0';
					if(timeup = '1') then
						clear <= '1';
						LED <= '0';			--OFF, routine complete
						state <= wait1;
					end if;	
				
				when others =>
					state <= wait1;
			
			end case;
		end if;
	end process;	

--------------------------------------------------
--Version 2: Two FSM in the same Process
--------------------------------------------------	
--	problem5: Process (clock, reset)
--		variable cnt: integer range 0 to 50000000;
--	begin
--		-------------------------------------
--		-- FSM#1: (tstate) the time counter
--		-------------------------------------
--		if(reset='0') then
--			timeup <= '0';
--			cnt := 0;
--			tstate <= standby;
--		elsif(clock'event and clock='1') then
--			case tstate is
--				when standby =>
--					timeup <= '0';
--					if(start='1') then
--						tstate <= count;
--						cnt := 0;
--					end if;
--				when count =>
--					cnt := cnt + 1;
--					if(clear='1') then
--						tstate <= standby;
--					else
--						tstate <= check;
--					end if;
--				when check =>
--					if(clear='1') then
--						tstate <= standby;
--					elsif(cnt = 49999999) then
--						tstate <= done;
--					else
--						tstate <= count;
--					end if;
--				when done =>
--					timeup <= '1';
--					tstate <= standby;
--				when others =>
--					tstate <= standby;
--			end case;
--		end if;				
--		-------------------------------------
--		-- FSM#2: (state) the main circuit
--		-------------------------------------
--		if(reset='0') then
--			LED <= '0';
--			start <= '0';
--			clear <= '0';
--			state <= wait1;
--		elsif(clock'event and clock='1') then
--			case state is
--				when wait1 =>
--					clear <= '0';
--					start <= '0';
--					if(PB='0') then
--						state <= wait2;
--					end if;
--				when wait2 =>
--					if(PB='1') then
--						state <= timer;
--					end if;
--				when timer =>
--					start <= '1';
--					state <= wait3;
--				when wait3 =>
--					start <= '0';
--					if(PB='0') then
--						state <= press;
--					elsif(timeup='1') then
--						state <= wait1;
--					end if;
--				when press =>
--					LED <= not LED;
--					clear <= '1';
--					state <= wait4;
--				when wait4 =>
--					if(PB='1') then
--						state <= wait1;
--					end if;
--				when others =>
--					state <= wait1;
--			end case;
--		end if;
--	end process;	

--------------------------------------------------
--Version 3: Two FSM in the same "IF" clock domain
--------------------------------------------------	
--	problem5: Process (clock, reset)
--		variable cnt: integer range 0 to 50000000;
--	begin
--		if(reset='0') then
--			timeup <= '0';
--			cnt := 0;
--			tstate <= standby;
--			--------------------
--			LED <= '0';
--			start <= '0';
--			clear <= '0';
--			state <= wait1;
--		elsif(clock'event and clock='1') then
--			-------------------------------------
--			-- FSM#1: (tstate) the time counter
--			-------------------------------------
--			case tstate is
--				when standby =>
--					timeup <= '0';
--					if(start='1') then
--						tstate <= count;
--						cnt := 0;
--					end if;
--				when count =>
--					cnt := cnt + 1;
--					if(clear='1') then
--						tstate <= standby;
--					else
--						tstate <= check;
--					end if;
--				when check =>
--					if(clear='1') then
--						tstate <= standby;
--					elsif(cnt = 49999999) then
--						tstate <= done;
--					else
--						tstate <= count;
--					end if;
--				when done =>
--					timeup <= '1';
--					tstate <= standby;
--				when others =>
--					tstate <= standby;
--			end case;
--			-------------------------------------
--			-- FSM#2: (state) the main circuit
--			-------------------------------------
--			case state is
--				when wait1 =>
--					clear <= '0';
--					start <= '0';
--					if(PB='0') then
--						state <= wait2;
--					end if;
--				when wait2 =>
--					if(PB='1') then
--						state <= timer;
--					end if;
--				when timer =>
--					start <= '1';
--					state <= wait3;
--				when wait3 =>
--					start <= '0';
--					if(PB='0') then
--						state <= press;
--					elsif(timeup='1') then
--						state <= wait1;
--					end if;
--				when press =>
--					LED <= not LED;
--					clear <= '1';
--					state <= wait4;
--				when wait4 =>
--					if(PB='1') then
--						state <= wait1;
--					end if;
--				when others =>
--					state <= wait1;
--			end case;
--		end if;
--	end process;	
	
end architecture;
