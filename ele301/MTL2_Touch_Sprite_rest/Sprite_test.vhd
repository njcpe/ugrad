library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Sprite_test is
	port( 
		CLOCK_50: in std_logic;
		KEY: in std_logic_vector(3 downto 0);
		SW: in std_logic_vector(9 downto 0);
		hex0, hex1, hex2, hex3, hex4, hex5: out std_logic_vector(6 downto 0);
		ledr: out std_logic_vector(3 downto 0);
		GPIO_1: out std_logic_vector(31 downto 0);
		MTL_TOUCH_INT_n : in std_logic;
		MTL_TOUCH_I2C_SCL : out std_logic;
		MTL_TOUCH_I2C_SDA : inout std_logic
		);
end Sprite_test;

architecture DE1_SoC of Sprite_test is 
	alias clock : std_logic is Clock_50;
	alias reset : std_logic is KEY(0);
	constant screen_width:  integer := 100;
	constant screen_height: integer := 60;

	signal mem_in, mem_out: std_logic_vector(1 downto 0);
	signal mem_adr: std_logic_vector(12 downto 0);
	signal mem_wr: std_logic;
	signal x, old_x : unsigned(6 downto 0);
	signal y, old_y : unsigned(5 downto 0);
	signal num: unsigned(1 downto 0);
	signal move_clock : std_logic;
	signal forward: Boolean;
	
	type state is ( clean0, clean1, clean2, clean3, home0, home1,
						move0, move1, ws0, ws1, ws2, ws3,
						anime0, anime1, anime2,
						update0, update1, update2);
	signal SV : state;
	
	signal VGA_R, VGA_G, VGA_B : std_logic_vector(7 downto 0);
	alias  VGA_HS : std_logic is GPIO_1(30); --HSD
	alias  VGA_VS : std_logic is GPIO_1(31); --VSD
	alias  DCLK : std_logic is GPIO_1(1);	--pixel clock = 33.3MHz
	-----------------------------------------------------	
		component i2c_touch_config is port(
		iCLK : in std_logic;
		iRSTN : in std_logic;
		oREADY : out std_logic;
		INT_n : in std_logic;
		oREG_X1 : out std_logic_vector(9 downto 0);
		oREG_Y1 : out std_logic_vector(8 downto 0);
		oREG_X2 : out std_logic_vector(9 downto 0);
		oREG_Y2 : out std_logic_vector(8 downto 0);
		oREG_X3 : out std_logic_vector(9 downto 0);
		oREG_Y3 : out std_logic_vector(8 downto 0);
		oREG_X4 : out std_logic_vector(9 downto 0);
		oREG_Y4 : out std_logic_vector(8 downto 0);
		oREG_X5 : out std_logic_vector(9 downto 0);
		oREG_Y5 : out std_logic_vector(8 downto 0);
		oREG_GESTURE : out std_logic_vector(7 downto 0);
		oREG_TOUCH_COUNT : out std_logic_vector(3 downto 0);
		I2C_SDAT : inout std_logic;
		I2C_SCLK : out std_logic
	); end component i2c_touch_config;
	
	signal ready: std_logic;
	signal X1: std_logic_vector(9 downto 0);
	signal Y1: std_logic_vector(8 downto 0);
	signal TX: unsigned(9 downto 0);
	signal TY: unsigned(8 downto 0);
	signal speed, old_speed: unsigned(3 downto 0);
	signal queue: std_logic_vector(1 downto 0);
	-----------------------------------------------------	
	TYPE Touch_state IS (wait_for_ready, get_code, examine);
	SIGNAL TS : Touch_state;

begin
	GPIO_1(10 downto 3) <= VGA_R;
	GPIO_1(21) <= VGA_G(7);
	GPIO_1(19 downto 18) <= VGA_G(6 downto 5);
	GPIO_1(15 downto 11) <= VGA_G(4 downto 0);
	GPIO_1(28 downto 22) <= VGA_B(7 downto 1);
	GPIO_1(20) <= VGA_B(0);
	
	vga : entity work.vga_sprite2 port map(	
		clock => clock, 
		reset => not reset,
		mem_adr => mem_adr,
		mem_out => mem_out,
		mem_in => mem_in,
		mem_wr => mem_wr, 
		vga_hs => vga_hs,
		vga_vs => vga_vs,
		pclock => DCLK,
		r => vga_r,
		g => vga_g,
		b => vga_b
	);

	mem_adr <= std_logic_vector(y) & std_logic_vector(x);	
	-----------------------------------------------------
	Terasic_Touch_IP: i2c_touch_config port map(
		iclk => clock,
		iRSTN => reset,
		int_n => MTL_TOUCH_INT_n,
		oready => ready,
		oREG_X1 => X1,
		oREG_Y1 => Y1,
		i2c_sclk => MTL_TOUCH_I2C_SCL,
		i2c_sdat =>	MTL_TOUCH_I2C_SDA
	);
	--------------------------------------------------------------
	--The six 7-segment LED displays are labelled hex0 to hex5
	--------------------------------------------------------------
	display0:	entity work.sevenseg port map (X1(3 downto 0), HEX0);
	display1:	entity work.sevenseg port map (X1(7 downto 4), HEX1);
	display2:	entity work.sevenseg port map ("00"&X1(9 downto 8), HEX2);
	display3:	entity work.sevenseg port map (Y1(3 downto 0), HEX3);
	display4:	entity work.sevenseg port map (Y1(7 downto 4), HEX4);
	display5:	entity work.sevenseg port map ("000" & Y1(8), HEX5);
	lEDR <= std_logic_vector(speed);
	------------------------ -----------------------------
	Touch_Sensor_Interface: PROCESS(CLOCK, reset)
	BEGIN
		IF(reset = '0') THEN			
			TS <= wait_for_ready;
			speed <= x"1";		
		ELSIF(clock'event AND clock = '1') THEN
			CASE TS IS
				WHEN wait_for_ready =>
					if(ready='1') then
						TS <= get_code;
					end if;
				WHEN get_code =>	
					TX <= unsigned(X1);	--convert X1 and Y1 to unsigned numbers
					TY <= unsigned(Y1);	--Convenient for comparisons
					TS <= examine;
				WHEN examine =>	--TX and TY are based on 800x480 resolution
					if(TX >= 368 and TX <= 375 and TY >= 80 and TY <= 87) then speed <= x"8";
						elsif(TX >= 384 and TX <= 391 and TY >= 80 and TY <= 87) then speed <= x"4";
							elsif(TX >= 400 and TX <= 407 and TY >= 80 and TY <= 87) then speed <= x"2";
								elsif(TX >= 416 and TX <= 423 and TY >= 80 and TY <= 87) then speed <= x"1";
					end if;
					TS <= wait_for_ready;
				WHEN OTHERS =>
					TS <= wait_for_ready;
			END CASE;
		END IF;		
	END PROCESS;
	-----------------------------------------------------
	display_clock: process(clock, reset)
		variable loopcount : integer range 0 to 500000;
		variable switchcount : integer range 0 to 15;
   begin
		if(reset = '0') then	
			loopcount := 0;
			switchcount := 0;
			move_clock <= '0';
		elsif(clock'event AND clock = '1') then
			if(loopcount >= 199999) then
				loopcount := 0;
				if(switchcount >= speed) then
					move_clock <= not move_clock;
					switchcount := 0;
				else
					switchcount := switchcount + 1;
				end if;
			else
				loopcount := loopcount + 1;
			end if;
		end if;		
	end process;
	------------------------------------------------------	
	Sprite_Animation: process(Clock, reset)
		variable count : integer range 0 to 4;
	begin
		if(reset = '0') then		
			mem_wr <= '0';	
			x <= "0000000";
			y <= "000000";	
			num <= "11";
			forward <= true;
			old_speed <= x"0";	
			SV <= clean0;	
		elsif(clock_50'event AND clock_50 = '1') then
			case SV is
				when clean0 =>	
					mem_wr <= '1';	
					mem_in <= "00";
					SV <= clean1;		
				when clean1 =>
					x <= x+1;
					SV <= clean2;
				when clean2 =>
					mem_wr <= '0';	
					if(x> screen_width-1) then 
						x<= "0000000";
						y <= y+1;
						SV <= clean3;
					else
						SV <= clean0;
					end if;
				when clean3 =>
					if(y > screen_height-1) then	
						SV <= home0;
					else
						SV <= clean0;
					end if;			
				when home0 =>
					x <= "0000000";	-- Display at x=0, y=32
					y <= "100000";
					mem_wr <= '1';	
					num <= "11";
					mem_in <= "11";	-- Sprite#3 first
					SV <= home1;
				when home1 =>
					mem_wr <= '0';
					SV <= move0;
				----------------------------------------------
--				when move0 =>			
--					if(move_clock = '0') then SV <= move1; end if;
--				when move1 =>
--					if(move_clock = '1') then SV <= anime0; end if;
				when move0 =>
					queue <= queue(0) & move_clock;
					SV <= move1;
				when move1 =>
					if (speed /= old_speed) then
						old_speed <= speed;
						SV <= ws0;				--update speed button sprites
					elsif(queue = "01") then
						SV <= anime0;			--move_clock rising edge detected
					else
						SV <= move0;
					end if;
				----------------------------------------------
				when ws0 =>
					count := 0;
					old_x <= x;
					old_y <= y;
					SV <= ws1;
				when ws1 =>	
					case count is
						when 0 =>
							X <= to_unsigned(46, 7);
							Y <= to_unsigned(10, 6);
							if(speed = x"8") then
								mem_in <= "11";
							else
								mem_in <= "01";
							end if;
						when 1 =>
							X <= to_unsigned(48, 7);
							Y <= to_unsigned(10, 6);
							if(speed = x"4") then
								mem_in <= "11";
							else
								mem_in <= "01";
							end if;
						when 2 =>
							X <= to_unsigned(50, 7);
							Y <= to_unsigned(10, 6);
							if(speed = x"2") then
								mem_in <= "11";
							else
								mem_in <= "01";
							end if;
						when 3 =>
							X <= to_unsigned(52, 7);
							Y <= to_unsigned(10, 6);
							if(speed = x"1") then
								mem_in <= "11";
							else
								mem_in <= "01";
							end if;
						when others =>
							null;
					end case;
					mem_wr <= '1';	
					SV <= ws2;	
				when ws2 =>
					count := count + 1;
					SV <= ws3;
				when ws3 =>
					mem_wr <= '0';	
					if(count <= 3) then 
						SV <= ws1;
					else
						X <= old_x;
						Y <= old_y;
						SV <= move0;
					end if;
				----------------------------------------------
				when anime0 =>
					if(forward) then
						if(num >= 2) then 	-- 3 to 2 to 1
							num <= num -1; 
							SV <= anime1;
						else						--stay at 1 for one cycle
							forward <= false;	--but change Boolean
							SV <= anime1;
						end if;
					else
						if(num = 3) then		--stay at 3 for one cycle
							forward <= true;	--change Boolean
							SV <= update0;
						else
							num <= num + 1;	-- 1 to 2 to 3
							SV <= anime1;
						end if;
					end if;
				when anime1 =>
					mem_wr <= '1';		
					mem_in <= std_logic_vector(num);	--draw new sprite
					SV <= anime2;
				when anime2 =>
					mem_wr <= '0';
					SV <= move0;
				when update0 =>
					mem_wr <= '1';		
					mem_in <= "00";		--erase old sprite
					SV <= update1;
				when update1 =>
					mem_wr <= '0';
					x <= x + 1;				--advanced to right
					SV <= update2;
				when update2 =>
					if(x = to_unsigned(screen_width, 7)) then 
						x <= "0000000"; end if;
					SV <= anime1;
				when others =>
					SV <= home0;
			end case;
		end if;		
	end process;
end architecture DE1_SoC;
