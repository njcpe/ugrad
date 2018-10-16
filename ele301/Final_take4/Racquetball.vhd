library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Racquetball is
	port(	CLOCK_50 : in std_logic;
			SW : in std_logic_vector(9 downto 0);
			KEY : in std_logic_vector(3 downto 0);
			HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 DOWNTO 0);
			LEDR : buffer std_logic_vector(9 downto 0);
			GPIO_1: out std_logic_vector(31 downto 0);
			MTL_TOUCH_INT_n : in std_logic;
			MTL_TOUCH_I2C_SCL : out std_logic;
			MTL_TOUCH_I2C_SDA : inout std_logic
			);
end entity;

architecture DE1_SoC_MTL2 of Racquetball is
	alias clock : std_logic is Clock_50;
	alias reset : std_logic is KEY(0);
	
	constant background : std_logic_vector(3 downto 0) := "0000";
	constant player1sprite : std_logic_vector(3 downto 0) := "0011";
	constant player1trail : std_logic_vector(3 downto 0) := "0100";
	constant player2sprite : std_logic_vector(3 downto 0) := "0001";
	constant player2trail : std_logic_vector(3 downto 0) := "0010";
	constant livessprite : std_logic_vector(3 downto 0) := "0101";
	constant border : std_logic_vector(3 downto 0) := "0110";
	constant gameover : std_logic_vector(3 downto 0) := "0111";
	constant p2livessprite : std_logic_vector(3 downto 0) := "1000"; 
	constant Tchar : std_logic_vector(3 downto 0) := "1001"; 
	constant Rchar : std_logic_vector(3 downto 0) := "1010"; 
	constant Ochar : std_logic_vector(3 downto 0) := "1011"; 
	constant Nchar : std_logic_vector(3 downto 0) := "1100"; 
	
	constant screen_width:  integer := 50;
	constant screen_height: integer := 30;
	constant seed : std_logic_vector(31 downto 0) := x"01000001";
	
	signal TX: unsigned(9 downto 0);
	signal TY: unsigned(8 downto 0);
	signal X1 : std_logic_vector(9 downto 0);
	signal Y1 : std_logic_vector(8 downto 0);
	signal mem_in, mem_out, vdata: std_logic_vector(3 downto 0);
	signal mem_adr: std_logic_vector(10 downto 0);
	signal mem_wr: std_logic;
	signal slow_clock, led_clock: std_logic;
	signal x, p1_x, p2_x, old_x : unsigned (5 downto 0);
	signal y, p1_y, p2_y, old_y : unsigned (4 downto 0);
	signal go : Boolean;
	signal px : unsigned (5 downto 0);
	signal py : unsigned(4 downto 0);
	signal up, rt, lt, dn, p2up, p2rt, p2lt, p2dn, p2up2, p2rt2, p2lt2, p2dn2: unsigned(3 downto 0);
	signal op_num : integer range 0 to 2;
	signal speed, old_speed, AI, old_AI: unsigned(3 downto 0);
	signal rand : std_logic_vector(31 downto 0);
	signal start : std_logic;

	type state is (clean0, clean1, clean2, clean3, sync1, sync2,
					pp1trail, perase2, pupdate, pdraw1, pdraw2, update1,
					update2, update3, update4, update5, update6, update7,
					update8, update9, update10, p2update1, p2update2, p2update3, 
					p2update4, p2update5, p2update6, p2update7,	p2update8, 
					p2update9, p2update10, p2update11, p2update12, p2update13,
					p2update14, p2update15, p2update16, p2update17, p2update18,
					p2update19, p2update20, update11, p1trail, p2trail, erase2, 
					p1update, p2update, draw1, p2draw, draw2, ws0, ws1, ws2, ws3,
					aichange0, aichange1, aichange2, aichange3, AI1, AI2, AI3, prepause,
					prepause2, pause, end1,end2, end3, end4, end5, fin, gmeovr1, gmeovr2, gmeovr3);
	signal SV : state;
		
	type direction is (dir_up, dir_dn, dir_rt, dir_lt);
	signal dir: direction;
	signal p2dir: direction;

	signal VGA_R, VGA_G, VGA_B : std_logic_vector(7 downto 0);
	alias  VGA_HS : std_logic is GPIO_1(30); --HSD
	alias  VGA_VS : std_logic is GPIO_1(31); --VSD
	alias  DCLK : std_logic is GPIO_1(1);	--pixel clock = 33.3MHz

	TYPE Touch_state IS (wait_for_ready, get_code, examine);
	SIGNAL TS : Touch_state;	
	signal gesture : std_logic_vector(7 downto 0);
	signal ready: std_logic;
	
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

begin
	GPIO_1(10 downto 3) <= VGA_R;
	GPIO_1(21) <= VGA_G(7);
	GPIO_1(19 downto 18) <= VGA_G(6 downto 5);
	GPIO_1(15 downto 11) <= VGA_G(4 downto 0);
	GPIO_1(28 downto 22) <= VGA_B(7 downto 1);
	GPIO_1(20) <= VGA_B(0);
	
  vga_interface : entity work.vga_sprite port map(
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

	Terasic_Touch_IP: i2c_touch_config port map(
		iclk => clock_50,
		iRSTN => key(0),
		int_n => MTL_TOUCH_INT_n,
		oready => ready,
		oreg_gesture => gesture,
		oREG_X1 => X1,
		oREG_Y1 => Y1, 
		i2c_sclk => MTL_TOUCH_I2C_SCL,
		i2c_sdat =>	MTL_TOUCH_I2C_SDA
	);
   ------------------------------------------------------
	Touch_gesture_handler: process(CLOCK, reset)
   begin
		if(reset = '0') then	
			go <= false;		--paddle not moving
			TS <= wait_for_ready;
			speed <= x"1";
		elsif(clock'event AND clock = '1') then
			CASE TS IS
				WHEN wait_for_ready =>
					if(ready='1') then
						TS <= get_code;
					end if;
				WHEN get_code =>	
					TX <= unsigned(X1);	--convert X1 and Y1 to unsigned numbers
					TY <= unsigned(Y1);	--Convenient for comparisons
					TS <= examine;
				WHEN examine =>	
					if(gesture = x"10") then		--Move Up
						go <= true;
						dir <= dir_up;
					elsif(gesture = x"18") then	--Move Down
						go <= true;
						dir <= dir_dn;
					elsif(gesture = x"14") then	--Move Left
						go <= true;
						dir <= dir_lt;
					elsif(gesture = x"1C") then	--Move Right
						go <= true;
						dir <= dir_rt;				
					elsif(gesture = x"48") then	--Zoom TODO add state condition
						go <= false;					
					end if;
					if(TX >= 8 and TX <= 39 and TY >= 152 and TY <= 183) then speed <= x"8";
						elsif(TX >= 8 and TX <= 39 and TY >= 184 and TY <= 215) then speed <= x"4";
							elsif(TX >= 8 and TX <= 39 and TY >= 216 and TY <= 247) then speed <= x"2";
								elsif(TX >= 8 and TX <= 39 and TY >= 248 and TY <= 279) then speed <= x"1";
					end if;
					
					if(TX >= 760 and TX <= 791 and TY >= 152 and TY <= 183) then AI <= x"0";
						elsif(TX >= 760 and TX <= 791 and TY >= 184 and TY <= 215) then AI <= x"1";
							elsif(TX >= 760 and TX <= 791 and TY >= 216 and TY <= 247) then AI <= x"2";
								elsif(TX >= 760 and TX <= 791 and TY >= 248 and TY <= 279) then AI <= x"3";
					end if;
					TS <= wait_for_ready;
				WHEN OTHERS =>
					TS <= wait_for_ready;
			END CASE;
		end if;		
   end process;
   ------------------------------------------------------
   display_clock: process(clock, reset)
		variable loopcount : integer range 0 to 500000;
		variable switchcount : integer range 0 to 15;
		variable ledcount : integer range 0 to 10;
		
   begin
		if(reset = '0') then	
			loopcount := 0;
			switchcount := 0;
			slow_clock <= '0';
			ledcount := 0;
		elsif(clock'event AND clock = '1') then
			if(loopcount >= 499999) then
				loopcount := 0;
				if(switchcount >= speed) then
					slow_clock <= not slow_clock;
					switchcount := 0;
					if(ledcount > 7) then
						led_clock <= not led_clock;
						ledcount := 0;
					else
						ledcount := ledcount + 1;
					end if;
				else
					switchcount := switchcount + 1;
				end if;
			else
				loopcount := loopcount + 1;
			end if;
		end if;		
		end process;
		----------------------------------------------------------
		main: process(clock, reset)
			variable lives : integer range 0 to 3 := 3;
			variable p2lives : integer range 0 to 3 := 3;
			variable ret : integer range 0 to 3 := 0;
			variable count : integer range 0 to 8;
		begin
		if(reset = '0') then			
			mem_wr <= '0';		------------------------------
			x <= "000000";	--initialization Video RAM
			y <= "00000";	--address: x=0 and y=0
			SV <= clean0;		------------------------------
			p1_x <= "000101"; -- put p1's position
			p1_y <= "01110";  -- at {5, 5}		
			p2_x <= "101011"; -- put p1's position
			p2_y <= "01110";  -- at {5, 5}		
			lives := 3;
			p2lives := 3;
			p2dir <= dir_lt;
			old_AI <= x"2";
			old_speed <= x"2";
			start <= '0';
		elsif(clock'event AND clock = '1') then
			case SV is
				when clean0 =>	
					mem_wr <= '1';		
					if((x = 3 and y > 0) or (x = screen_width-4 and y > 0) or ((y = 1 or y = 29) and x > 2 and x < 47)) then
						mem_in <= border;		--border color
					elsif(lives = 1 and y = 0 and x = 3)  then
						mem_in <= livessprite;
					elsif(lives = 2 and (y = 0 and (x = 3 or x = 5))) then
						mem_in <= livessprite;
					elsif(lives = 3 and (y = 0 and (x = 3 or x = 5 or x = 7))) then
						mem_in <= livessprite;
					elsif(p2lives = 1 and y = 0 and x = 46)  then
						mem_in <= p2livessprite;
					elsif(p2lives = 2 and (y = 0 and (x = 46 or x = 44))) then
						mem_in <= p2livessprite;
					elsif(p2lives = 3 and (y = 0 and (x = 46 or x = 44 or x = 42))) then
						mem_in <= p2livessprite;
					elsif(x = 1 and y = 0 and speed = x"8") then	
						mem_in <= player2trail;
					elsif(x = 1 and y = 12 and speed = x"4") then	
						mem_in <= player2trail;
					elsif(x = 1 and y = 14 and speed = x"2") then	
						mem_in <= player2trail;
					elsif(x = 1 and y = 16 and speed = x"1") then	
						mem_in <= player2trail;
						
					elsif(x = 48 and y = 10 and AI = x"0") then	
						mem_in <= player2trail;
					elsif(x = 48 and y = 12 and AI = x"1") then	
						mem_in <= player2trail;
					elsif(x = 48 and y = 14 and AI = x"2") then	
						mem_in <= player2trail;
					elsif(x = 48 and y = 16 and AI = x"3") then	
						mem_in <= player2trail;
					elsif((x = 1 or x = 48) and (y=10 or y=12 or y=14 or y=16)) then
						mem_in <= border;
					elsif(y = 0 and x = 23) then
						mem_in <= Tchar;
					elsif(y = 0 and x = 24) then
						mem_in <= Rchar;
					elsif(y = 0 and x = 25) then
						mem_in <= Ochar;
					elsif(y = 0 and x = 26) then
						mem_in <= Nchar;
					else	
						mem_in <= background;	--screen size is 160x120
					end if;
					SV <= clean1;
				when clean1 =>
					x <= x+1;
					SV <= clean2;
				when clean2 =>
					mem_wr <= '0';		-- disable the write enable
					if(x> screen_width - 1) then 
						x<= "000000";
						y <= y+1;
						SV <= clean3;
					else
						SV <= clean0;
					end if;
				when clean3 =>
					if(y > screen_height - 1) then
						SV <= sync1;
					else
						SV <= clean0;
					end if;
				--------------------------------------------------
				when sync1 =>			--Sync1 and sync2 wait
					mem_wr <= '0';		--for the rising edge
					if (speed /= old_speed) then
						old_speed <= speed;
						SV <= ws0;
						ret := 1;
					elsif (AI /= old_AI) then
						old_AI <= AI;
						SV <= aichange0;
						ret := 1;	
					elsif(slow_clock = '0') then	--of slow_clock
						SV <= sync2;
					end if;
				when sync2 =>
					if(slow_clock = '1') then
						SV <= update1;
					end if;				
------------------------------------------------------------get p1 Screen vals					
				when update1 =>		--check up screen value
					x <= p1_x;	
					y <= p1_y - 1;
					mem_wr <= '0';	--read from video RAM
					SV <= update2;
				when update2 =>
					SV <= update3;
				when update3 =>
					up <= unsigned(mem_out);	--read screen
					x <= x - 1;
					y <= y + 1;	
					SV <= update4;
				when update4 =>		--check left
					SV <= update5;
				when update5 =>
					lt <= unsigned(mem_out);
					x <= x + 2;
					SV <= update6;		
				when update6 =>		--check  right
					SV <= update7;
				when update7 =>
					rt <= unsigned(mem_out);
					y <= y + 1;
					x <= x - 1;
					SV <= update8;	
				when update8 =>		--check down
					SV <= update9;
				when update9 =>
					dn <= unsigned(mem_out);
					SV <= update10;	
-------------------------------------------------------------------------------------P1 Update
				when update10 =>
					case dir is
						when dir_up =>
							if(go and up/=0) then SV <= prepause; --DIE
										else 
												SV <= p2update1; --DONT DIE
							end if;
						when dir_dn =>
							if(go and dn/=0) then SV <= prepause; --DIE
										else
												SV <= p2update1; --DONT DIE
							end if;
						when dir_lt =>
							if(go and lt/=0) then SV <= prepause; --DIE
										else
												SV <= p2update1; --DONT DIE
							end if;
						when dir_rt =>
							if(go and rt/=0) then SV <= prepause; --DIE
										else 
												SV <= p2update1; --DONT DIE
							end if;
					end case;
----------------------------------------------------------------------------------P2 Collision Checking
				when p2update1 =>		--check up screen value
					x <= p2_x;	
					y <= p2_y - 1;
					mem_wr <= '0';	--read from video RAM
					SV <= p2update2;
				when p2update2 =>
					SV <= p2update3;
				when p2update3 =>
					p2up <= unsigned(mem_out);	--read screen
					x <= x - 1;
					y <= y + 1;	
					SV <= p2update4;
				when p2update4 =>		--check left
					SV <= p2update5;
				when p2update5 =>
					p2lt <= unsigned(mem_out);
					x <= x + 2;
					SV <= p2update6;		
				when p2update6 =>		--check  right
					SV <= p2update7;
				when p2update7 =>
					p2rt <= unsigned(mem_out);
					y <= y + 1;
					x <= x - 1;
					SV <= p2update8;
				when p2update8 =>		--check down
					SV <= p2update9;	
				when p2update9 =>
					p2dn <= unsigned(mem_out);
					x <= x;	
					y <= y - 3;
					SV <= p2update10;
-----------------------------------------------------------------------Get p2+ vals					
				when p2update10 =>		--check up+ screen value
					SV <= p2update11;
				when p2update11 =>
					p2up2 <= unsigned(mem_out);	--read screen
					x <= x - 2;
					y <= y + 2;	
					SV <= p2update12;
				when p2update12 =>		--check left
					SV <= p2update13;
				when p2update13 =>
					p2lt2 <= unsigned(mem_out);
					x <= x + 4;
					SV <= p2update14;		
				when p2update14 =>		--check  right
					SV <= p2update15;
				when p2update15 =>
					p2rt2 <= unsigned(mem_out);
					y <= y + 2;
					x <= x - 2;
					SV <= p2update16;	
				when p2update16 =>		--check down
					SV <= p2update17;
-----------------------------------------------------------------AI choose State
				when p2update17 =>
					case AI is
						when x"0" =>
							SV <= p2update18;
						when x"1" =>
							SV <= AI1;	
						when x"2" =>
							SV <= AI2;
						when x"3" =>
							SV <= AI3;
						when others =>
							SV <= p2update18;
					end case;
-------------------------------------------------------------------rand movement (AI 1)
				when AI1 =>
					case p2dir is
						when dir_up =>
							if(go) then
								case rand(15 downto 14) is
									when "00" => p2dir <= dir_up;
									when "01" => p2dir <= dir_rt;
									when "10" => p2dir <= dir_lt;
									when others => p2dir <= dir_up;
								end case;
							end if;
						
						when dir_rt =>
							if(go) then
								case rand(15 downto 14) is
									when "00" => p2dir <= dir_up;
									when "01" => p2dir <= dir_rt;
									when "10" => p2dir <= dir_dn;
									when others => p2dir <= dir_rt;
								end case;
							end if;
						
						when dir_dn =>
							if(go) then
								case rand(15 downto 14) is
									when "00" => p2dir <= dir_lt;
									when "01" => p2dir <= dir_rt;
									when "10" => p2dir <= dir_dn;
									when others => p2dir <= dir_dn;
								end case;
							end if;
							
						when dir_lt =>
							if(go) then
								case rand(15 downto 14) is
									when "00" => p2dir <= dir_up;
									when "01" => p2dir <= dir_lt;
									when "10" => p2dir <= dir_dn;
									when others => p2dir <= dir_lt;
								end case;
							end if;
					end case;
					
					SV <= p2update18;
------------------------------------------------------------------------AI2 							
				when AI2 =>
					case p2dir is
						when dir_up =>
							if(go and p2up /= 0) then
								case rand(15) is
									when '0' =>
										if(p2lt = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_rt;
										end if;
									when '1' =>
										if(p2rt = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_lt;
										end if;
								end case;
							else
								case rand(14 downto 12) is
									when "000" =>
										if(p2lt = 0) then
											p2dir <= dir_lt;
										elsif(p2rt = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_up;
										end if;
									when "001" =>
										if(p2rt = 0) then
											p2dir <= dir_rt;
										elsif(p2lt = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_up;
										end if;
									when others => p2dir <= dir_up;
								end case;
							end if;
						
						when dir_rt =>
							if(go and p2rt /= 0) then
								case rand(15) is 
									when '0' =>
										if(p2up = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_dn;
										end if;
									when '1' =>
										if(p2dn = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_up;
										end if;
									end case;
							else
								case rand(14 downto 12) is
									when "000" =>
										if(p2up = 0) then
											p2dir <= dir_up;
										elsif(p2dn = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_rt;
										end if;
									when "001" =>
										if(p2dn = 0) then
											p2dir <= dir_dn;
										elsif(p2up = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_rt;
										end if;
									when others => p2dir <= dir_rt;
								end case;
							end if;
						
						when dir_dn =>
							if(go and p2dn /= 0) then
								case rand(15) is 
									when '0' =>
										if(p2rt = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_lt;
										end if;
									when '1' =>
										if(p2lt = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_rt;
										end if;
									end case;
							else
								case rand(14 downto 12) is
									when "000" =>
										if(p2rt = 0) then
											p2dir <= dir_rt;
										elsif(p2lt = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_dn;
										end if;
									when "001" =>
										if(p2lt = 0) then
											p2dir <= dir_lt;
										elsif(p2rt = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_dn;
										end if;
									when others => p2dir <= dir_dn;
								end case;
							end if;
							
						when dir_lt =>
							if(go and p2lt /= 0) then
								case rand(15) is 
									when '0' =>
										if(p2dn = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_up;
										end if;
									when '1' =>
										if(p2up = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_dn;
										end if;
									end case;
							else
								case rand(14 downto 12) is
									when "000" =>
										if(p2dn = 0) then
											p2dir <= dir_dn;
										elsif(p2up = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_lt;
										end if;
									when "001" =>
										if(p2up = 0) then
											p2dir <= dir_up;
										elsif(p2dn = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_lt;
										end if;
									when others => p2dir <= dir_lt;
								end case;
							end if;
					end case;
					
					SV <= p2update18;
----------------------------------------------------------------------------------AI 3				
				when AI3 =>
					case p2dir is
						when dir_up =>
							if(go and (p2up /= 0 or p2up2 /= 0)) then
								case rand(15) is
									when '0' =>
										if(p2lt = 0) then
											p2dir <= dir_lt;
										elsif(p2rt = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_up;
										end if;
									when '1' =>
										if(p2rt = 0) then
											p2dir <= dir_rt;
										elsif(p2lt = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_up;
										end if;
								end case;
							else
								case rand(14 downto 11) is
									when "0000" =>
										if(p2lt = 0 and p2lt2 = 0) then
											p2dir <= dir_lt;
										elsif(p2rt = 0 and p2rt2 = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_up;
										end if;
									when "0001" =>
										if(p2rt = 0 and p2rt2 = 0) then
											p2dir <= dir_rt;
										elsif(p2lt = 0 and p2lt2 = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_up;
										end if;
									when others => p2dir <= dir_up;
								end case;
							end if;
						
						when dir_rt =>
							if(go and (p2rt /= 0 or p2rt2 /= 0)) then
								case rand(15) is 
									when '0' =>
										if(p2up = 0) then
											p2dir <= dir_up;
										elsif(p2dn = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_rt;
										end if;
									when '1' =>
										if(p2dn = 0) then
											p2dir <= dir_dn;
										elsif(p2up = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_rt;
										end if;
									end case;
							else
								case rand(14 downto 11) is
									when "0000" =>
										if(p2up = 0 and p2up2 = 0) then
											p2dir <= dir_up;
										elsif(p2dn = 0  and p2dn2 = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_rt;
										end if;
									when "0001" =>
										if(p2dn = 0 and p2dn2 = 0) then
											p2dir <= dir_dn;
										elsif(p2up = 0 and p2up2 = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_rt;
										end if;
									when others => p2dir <= dir_rt;
								end case;
							end if;
						
						when dir_dn =>
							if(go and (p2dn /= 0 or p2dn2 /= 0)) then
								case rand(15) is 
									when '0' =>
										if(p2rt = 0) then
											p2dir <= dir_rt;
										elsif(p2lt = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_dn;
										end if;
									when '1' =>
										if(p2lt = 0) then
											p2dir <= dir_lt;
										elsif(p2rt = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_dn;
										end if;
									end case;
							else
								case rand(14 downto 11) is
									when "0000" =>
										if(p2rt = 0 and p2rt2 = 0) then
											p2dir <= dir_rt;
										elsif(p2lt = 0 and p2lt2 = 0) then
											p2dir <= dir_lt;
										else
											p2dir <= dir_dn;
										end if;
									when "0001" =>
										if(p2lt = 0 and p2lt2 = 0) then
											p2dir <= dir_lt;
										elsif(p2rt = 0 and p2rt2 = 0) then
											p2dir <= dir_rt;
										else
											p2dir <= dir_dn;
										end if;
									when others => p2dir <= dir_dn;
								end case;
							end if;
							
						when dir_lt =>
							if(go and (p2lt /= 0 or p2lt2 /= 0)) then
								case rand(15) is 
									when '0' =>
										if(p2dn = 0) then
											p2dir <= dir_dn;
										elsif(p2up = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_lt;
										end if;
									when '1' =>
										if(p2up = 0) then
											p2dir <= dir_up;
										elsif(p2dn = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_lt;
										end if;
									end case;
							else
								case rand(14 downto 11) is
									when "0000" =>
										if(p2dn = 0 and p2dn2 = 0) then
											p2dir <= dir_dn;
										elsif(p2up = 0 and p2up2 = 0) then
											p2dir <= dir_up;
										else
											p2dir <= dir_lt;
										end if;
									when "0001" =>
										if(p2up = 0 and p2up2 = 0) then
											p2dir <= dir_up;
										elsif(p2dn = 0 and p2dn2 = 0) then
											p2dir <= dir_dn;
										else
											p2dir <= dir_lt;
										end if;
									when others => p2dir <= dir_lt;
								end case;
							end if;
					end case;
					
					SV <= p2update18;

-----------------------------------------------------------------P2 Update				
				when p2update18 =>
					case p2dir is
						when dir_up =>
							if(go and p2up/=0) then SV <= prepause2; --DIE
										else
												--dir <= dir_up; 
												SV <= p1trail; --DONT DIE
							end if;
						when dir_dn =>
							if(go and p2dn/=0) then SV <= prepause2; --DIE
										else
												--dir <= dir_dn; 
												SV <= p1trail; --DONT DIE
							end if;
						when dir_lt =>
							if(go and p2lt/=0) then SV <= prepause2; --DIE
										else
												--dir <= dir_lt; 
												SV <= p1trail; --DONT DIE
							end if;
						when dir_rt =>
							if(go and p2rt/=0) then SV <= prepause2; --DIE
										else
												--dir <= dir_rt; 
												SV <= p1trail; --DONT DIE
							end if;
					end case;
					
---------------------------------------------------------------------------Trail Drawing
				when p1trail =>
					x <= p1_x;
					y <= p1_y;
					mem_wr <= '1';	
					mem_in <= player1trail;
					SV <= p2trail;
				when p2trail =>
					x <= p2_x;
					y <= p2_y;
					mem_wr <= '1';	
					mem_in <= player2trail;
					SV <= erase2;
				when erase2 =>
					SV <= p1update;
-----------------------------------------------------------------------------------P1 UPDATING
				when p1update =>
					mem_wr <= '0';		
					case dir is		
						when dir_up =>
							if(go) then	p1_y <= p1_y - 1;
							end if;
						when dir_dn =>
							if(go) then p1_y <= p1_y + 1;
							end if;
						when dir_lt =>
							if(go) then p1_x <= p1_x - 1;
							end if;
						when dir_rt =>
							if(go) then p1_x <= p1_x + 1;
							end if;
					end case;
					SV <= p2update;				
					
				when p2update =>
					mem_wr <= '0';		
					case p2dir is		
						when dir_up =>
							if(go) then	p2_y <= p2_y - 1;
							end if;
						when dir_dn =>
							if(go) then p2_y <= p2_y + 1;
							end if;
						when dir_lt =>
							if(go) then p2_x <= p2_x - 1;
							end if;
						when dir_rt =>
							if(go) then p2_x <= p2_x + 1;
							end if;
					end case;
					SV <= draw1;				
----------------------------------------------------------------Sprite Drawing			
				when draw1 =>
					x <= p1_x;
					y <= p1_y;
					mem_wr <= '1';		
					mem_in <= player1sprite;
					SV <= p2draw;	
					
				when p2draw =>
					x <= p2_x;
					y <= p2_y;
					mem_wr <= '1';		
					mem_in <= player2sprite;
					SV <= draw2;	
				when draw2 =>
					SV <= sync1;
----------------------------------------------------------------Speed Change Checking
				when ws0 =>
					count := 0;
					old_x <= x;
					old_y <= y;
					SV <= ws1;
				when ws1 =>	
					case count is
						when 0 =>
							X <= to_unsigned(1, 6);
							Y <= to_unsigned(10, 5);
							if(speed = x"8") then
								mem_in <= player2trail;
							else
								mem_in <= border;
							end if;
						when 1 =>
							X <= to_unsigned(1, 6);
							Y <= to_unsigned(12, 5);
							if(speed = x"4") then
								mem_in <= player2trail;
							else
								mem_in <= border;
							end if;
						when 2 =>
							X <= to_unsigned(1, 6);
							Y <= to_unsigned(14, 5);
							if(speed = x"2") then
								mem_in <= player2trail;
							else
								mem_in <= border;
							end if;
						when 3 =>
							X <= to_unsigned(1, 6);
							Y <= to_unsigned(16, 5);
							if(speed = x"1") then
								mem_in <= player2trail;
							else
								mem_in <= border;
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
						if(ret = 1) then
							SV <= sync1;
						elsif(ret = 2) then
							SV <= pause;
						else
							SV <= fin;
						end if;	
					end if;
-----------------------------------------------------------AI Change Checking					
				when aichange0 =>
					count := 0;
					old_x <= x;
					old_y <= y;
					SV <= aichange1;
				when aichange1 =>	
					case count is
						when 0 =>
							X <= to_unsigned(48, 6);
							Y <= to_unsigned(10, 5);
							if(AI = x"0") then
								mem_in <= player2trail;
								p2dir <= dir_lt;
							else
								mem_in <= border;
							end if;
						when 1 =>
							X <= to_unsigned(48, 6);
							Y <= to_unsigned(12, 5);
							if(AI = x"1") then
								mem_in <= player2trail;
							else
								mem_in <= border;
							end if;
						when 2 =>
							X <= to_unsigned(48, 6);
							Y <= to_unsigned(14, 5);
							if(AI = x"2") then
								mem_in <= player2trail;
							else
								mem_in <= border;
							end if;
						when 3 =>
							X <= to_unsigned(48, 6);
							Y <= to_unsigned(16, 5);
							if(AI = x"3") then
								mem_in <= player2trail;
							else
								mem_in <= border;
							end if;
						when others =>
							null;
					end case;
					mem_wr <= '1';	
					SV <= aichange2;	
				when aichange2 =>
					count := count + 1;
					SV <= aichange3;
				when aichange3 =>
					mem_wr <= '0';	
					if(count <= 3) then
						SV <= aichange1;
					else
						X <= old_x;
						Y <= old_y;
						if(ret = 1) then
							SV <= sync1;
						elsif(ret = 2) then
							SV <= pause;
						else
							SV <= fin;
						end if;	
					end if;
--------------------------------------------------------LIFE LOST/GAME OVER
				when prepause => 
					lives := lives - 1;
					mem_wr <= '0';
					SV <= pause;
				when prepause2 => 
					p2lives := p2lives - 1;
					mem_wr <= '0';
					SV <= pause;
				when pause =>
					p1_x <= "000101"; -- put ball's position
					p1_y <= "01110";  -- at {5, 5}	
					p2_x <= "101011"; -- put p1's position
					p2_y <= "01110";  -- at {5, 5}		
					x <= "000000";	--initialization Video RAM
					y <= "00000";	--address: x=0 and y=0
					if (speed /= old_speed) then
						old_speed <= speed;
						SV <= ws0;
						ret := 2;	
					elsif (AI /= old_AI) then
						old_AI <= AI;
						SV <= aichange0;
						ret := 2;	
					elsif(lives = 0 or p2lives = 0) then
						SV <= end1;
					elsif(gesture = x"48") then
						SV <= clean0;
					end if;	
						
-----------------------------------------------------GAME OVER
				when end1 =>
						start <= '1';
						y <=  "10000";
						x <= "010101";
						mem_wr <= '1';
						mem_in <= gameover;
						SV <= gmeovr1;
						
				when gmeovr1 =>
						SV <= end2;
						
				when end2 =>
					x <= "011001";
					mem_wr <= '1';
					mem_in <= gameover;
					SV <= gmeovr2;
					
				when gmeovr2 =>
					SV <= end3;
					
				when end3 =>
					x <= "011101";
					mem_wr <= '1';
					mem_in <= gameover;
					SV <= gmeovr3;
					
				when gmeovr3 =>
					SV <= end4;
					
				when end4 =>			--end4 and end5 wait
					mem_wr <= '0';		--for the rising edge
					if(slow_clock = '0') then	--of slow_clock
							SV <= end5;
						end if;
				when end5 =>
					if(slow_clock = '1') then
						SV <= fin;
					end if;	
				when fin =>
					if (speed /= old_speed) then
						old_speed <= speed;
						SV <= ws0;
						ret := 3;
					elsif (AI /= old_AI) then
						old_AI <= AI;
						SV <= aichange0;
						ret := 3;		
					elsif(gesture = x"48") then
						mem_wr <= '0';		------------------------------
						x <= "000000";	--initialization Video RAM
						y <= "00000";	--address: x=0 and y=0
						SV <= clean0;		------------------------------
						p1_x <= "000101"; -- put ball's position
						p1_y <= "01110";  -- at {5, 5}	
						p2_x <= "101011"; -- put p1's position
						p2_y <= "01110";  -- at {5, 5}		
						--px <= to_unsigned(35, 6);	
						lives := 3;
						p2lives := 3;
						start <= '0';
						
					end if;		
				--------------------------------------------------
				when others =>
					SV <= clean0;
			end case;
		end if;		
   end process;
	
	Psuedo_random: process(clock, reset)
	begin
		if(reset = '0') then			
		   rand <= x"545F713C"; --hardware initial seed
		elsif(rising_edge(clock)) then
		   rand <= rand(30 downto 0) & 
			(rand(31) xor rand(30) xor rand(28) xor rand(0));
		end if;
	end process;
	
	gameover_blinking: process(clock, reset, start)
	begin
		if(reset = '0' or start = '0') then
			LEDR <= (others =>'0');
			HEX0 <= (others =>'1');
			HEX1 <= (others =>'1');
			HEX2 <= (others =>'1');
			HEX3 <= (others =>'1');
			HEX4 <= (others =>'1');
			HEX5 <= (others =>'1');
		elsif(start = '1') then
			LEDR(9) <= led_clock;
			LEDR(7) <= led_clock;
			LEDR(5) <= led_clock;
			LEDR(3) <= led_clock;
			LEDR(1) <= led_clock;
			LEDR(8) <= not led_clock;
			LEDR(6) <= not led_clock;
			LEDR(4) <= not led_clock;
			LEDR(2) <= not led_clock;
			LEDR(0) <= not led_clock;
			if(rising_edge(slow_clock)) then
				HEX0 <= rand(6 downto 0);
				HEX1 <= rand(7 downto 1);
				HEX2 <= rand(8 downto 2);
				HEX3 <= rand(9 downto 3);
				HEX4 <= rand(10 downto 4);
				HEX5 <= rand(11 downto 5);
			end if;
		end if;
	end process;

end architecture DE1_SoC_MTL2;