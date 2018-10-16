library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Text_screen_test is
	port( CLOCK_50	: in std_logic;
			KEY		: in std_logic_vector(3 downto 0);
			GPIO_1: out std_logic_vector(31 downto 0)
			);
end Text_screen_test;

architecture DE1_SoC of Text_screen_test is 
	alias clock : std_logic is Clock_50;
	alias reset : std_logic is KEY(0);
	constant screen_width:  integer := 100;
	constant screen_height: integer := 60;
	
	signal mem_in, mem_out, data: std_logic_vector(6 downto 0);
	signal mem_adr: std_logic_vector(12 downto 0);
	signal mem_wr: std_logic;
	signal x : unsigned(6 downto 0);
	signal y : unsigned(5 downto 0);
	
	type state is ( clean0, clean1, clean2, clean3, done);
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
	
	vga : entity work.vga_font port map(	--VGA with font table. 
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
	
	screen_test: process(clock, reset)
	begin
		if(reset = '0') then	
			mem_wr <= '0';				-----------------
			x <= to_unsigned(0, 7);	--initialization
			y <= to_unsigned(0, 6);	-- x=0 and y=0
			data <= "0000000";
			SV <= clean0;			
		elsif(clock'event AND clock = '1') then
			case SV is
				when clean0 =>	
					mem_wr <= '1';	
					mem_in <= data;
					SV <= clean1;		
				when clean1 =>
					x <= x+1;
					data <= std_logic_vector(unsigned(data) + 1);
					SV <= clean2;
				when clean2 =>
					mem_wr <= '0';	
					if(x> screen_width-1) then 
						x<= to_unsigned(0, 7);
						y <= y+1;
						SV <= clean3;
					else
						SV <= clean0;
					end if;
				when clean3 =>
					if(y > screen_height-1) then	
						SV <= done;	
					else
						SV <= clean0;
					end if;
				when done =>
					null;
				when others =>
					SV <= clean0;
			end case;
		end if;		
	end process;
end architecture DE1_SoC;
