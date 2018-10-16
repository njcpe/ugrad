library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Sprite_test is
	port( 
		CLOCK_50: in std_logic;
		KEY: in std_logic_vector(3 downto 0);
		SW: in std_logic_vector(9 downto 0);
		GPIO_1: out std_logic_vector(31 downto 0)
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
	signal x : unsigned(6 downto 0);
	signal y : unsigned(5 downto 0);
	signal num: unsigned(1 downto 0);
	signal move_clock : std_logic;
	signal forward: Boolean;
	
	type state is ( clean0, clean1, clean2, clean3, home0, home1,
						move0, move1, anime0, anime1, anime2,
						update0, update1, update2);
	signal SV : state;
	
	signal VGA_R, VGA_G, VGA_B : std_logic_vector(7 downto 0);
	alias  VGA_HS : std_logic is GPIO_1(30); --HSD
	alias  VGA_VS : std_logic is GPIO_1(31); --VSD
	alias  DCLK : std_logic is GPIO_1(1);	--pixel clock = 33.3MHz
	
begin
	GPIO_1(10 downto 3) <= VGA_R;
	GPIO_1(21) <= VGA_G(7);
	GPIO_1(19 downto 18) <= VGA_G(6 downto 5);
	GPIO_1(15 downto 11) <= VGA_G(4 downto 0);
	GPIO_1(28 downto 22) <= VGA_B(7 downto 1);
	GPIO_1(20) <= VGA_B(0);
	
	
--	vga : entity work.vga_sprite1 port map(	
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
				if(switchcount >= UNSIGNED(SW(3 downto 0))) then
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
	begin
		if(reset = '0') then		
			mem_wr <= '0';	
			x <= "0000000";
			y <= "000000";	
			num <= "11";
			forward <= true;
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
				when move0 =>			
					if(move_clock = '0') then SV <= move1; end if;
				when move1 =>
					if(move_clock = '1') then SV <= anime0; end if;
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
