library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Text_Terminal is
	port( 
		CLOCK_50	: in std_logic;
		KEY		: in std_logic_vector(3 downto 0);
		SW			: in std_logic_vector(9 downto 0);
		GPIO_1: out std_logic_vector(31 downto 0);
		ps2_clk	:  in std_logic;
		ps2_dat	: in std_logic
		);
end Text_Terminal;

architecture DE1_SoC of Text_Terminal is 
	alias clock : std_logic is Clock_50;
	alias reset : std_logic is KEY(0);
	constant space : std_logic_vector(6 downto 0) := "0100000"; 
	constant cursor : std_logic_vector(6 downto 0) := "1111111";
	constant screen_width:  integer := 100;
	constant screen_height: integer := 60;
	
	signal mem_in, mem_out, data: std_logic_vector(6 downto 0);
	signal mem_adr: std_logic_vector(12 downto 0);
	signal mem_wr: std_logic;
	signal x, xt : unsigned(6 downto 0);
	signal y, yt : unsigned(5 downto 0);
	signal scan_code, ascii: std_logic_vector(7 downto 0);
	signal code_buf: std_logic_vector(15 downto 0);
	signal ready, ack: std_logic;
	
	type state is ( clean0, clean1, clean2, clean3, home0, home1,
						home2, home3, wait_for_KB_ready, shift_code, new_key, 
						new0, new1, new2, new3, new4, new5, cr0, cr1, cr2, 
						s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12,
						BS, TAB, ESC);
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
		pclock => DCLK,
		reset => not reset,
		mem_adr => mem_adr,
		mem_out => mem_out,
		mem_in => mem_in,
		mem_wr => mem_wr,   
		vga_hs => vga_hs,
		vga_vs => vga_vs,
--		blank => VGA_BLANK_N,
		r => vga_r,
		g => vga_g,
		b => vga_b
	);
	mem_adr <= std_logic_vector(y) & std_logic_vector(x);	
	
	ps2keyboard: entity work.keyboard port map(
		clock => clock,
		reset => not reset,     
		scan_code => scan_code,
		ascii_code => ascii,
		ready => ready,
		ack => ack,     
		ps2clk => ps2_clk,
		ps2data => ps2_dat
	);
	
	Terminal: process(clock, reset)
	begin
		if(reset = '0') then		
			code_buf <= "11110000--------";
			ack <= '0';
			mem_wr <= '0';				
			x <= to_unsigned(0, 7);	--initialization
			y <= to_unsigned(0, 6);	-- x=0 and y=0
			SV <= clean0;			
		elsif(clock'event AND clock = '1') then
			case SV is
				when clean0 =>	
					mem_wr <= '1';
					mem_in <= space;
					SV <= clean1;		
				when clean1 =>
					x <= x+1;
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
						SV <= home0;
					else
						SV <= clean0;
					end if;
				----------------------------------------------
				when home0 =>
					xt <= to_unsigned(0, 7);
					yt <= to_unsigned(0, 6);
					SV <= home1;
				when home1 =>
					x <= xt;
					y <= yt;
					mem_wr <= '1';		
					mem_in <= cursor;	
					SV <= home2;
				when home2 =>
					SV <= home3;
				when home3 =>
					mem_wr <= '0';
					SV <= wait_for_KB_ready;
				------------------------------------------
				when wait_for_KB_ready =>	
					if (ready = '1') then
						SV <= shift_code;
					else
						ack <= '0';
						SV <= home1;
					end if;
				-------------------------------------------------	
				when shift_code =>
					code_buf <= code_buf(7 downto 0) & scan_code;
					SV <= new_key;
				when new_key =>
					ack <= '1';
					if(code_buf(15 downto 8)/= X"F0" and 
						code_buf(7 downto 0) /= X"E0" and
						code_buf(7 downto 0) /= X"F0") then
						SV <= new0;		--valid ASCII received
					else
						SV <= wait_for_KB_ready;
					end if;
				------------------------------------------------	
				when new0 =>
					if(ascii=X"0D") then		-- CR
						SV <= cr0;
					elsif(ascii=X"08") then	-- Backspace
						SV <= BS;
					elsif(ascii=X"09") then	-- TAB
						SV <= TAB;
					elsif(ascii=X"1B") then	-- ESC
						SV <= ESC;
					else
						SV <= new1;
					end if;
				when new1 =>
					x <= xt;
					y <= yt;
					mem_in <= ascii(6 downto 0);
					mem_wr <= '1';
					SV <= new2;
				when new2 =>			
					SV <= new3;
				when new3 =>
					mem_wr <= '0';
					xt <= xt+1;
					SV <= new4;
				when new4 =>		-- End of line?
					if(xt> screen_width-1) then 
						xt <= to_unsigned(0, 7);
						yt <= yt+1;
						SV <= new5;
					else
						SV <= home1;
					end if;
				when new5 =>	-- End of field (display area)?
					if(yt>screen_height-1) then
						SV <= s0;
					else
						SV <= home1;
					end if;
				--------------------------------------------------
				-- Carriage Retuern (CR)
				--------------------------------------------------
				when cr0 =>
					x <= xt;
					y <= yt;
					mem_wr <= '1';		
					mem_in <= space;
					SV <= cr1;
				when cr1 =>
					SV <= cr2;
				when cr2 =>
					mem_wr <= '0';			
					xt<= to_unsigned(0, 7);
					yt <= yt+1;
					SV <= new5;
				-----------------------------------------------
				-- Scrolling
				-----------------------------------------------
				when s0 =>
					x <= to_unsigned(0, 7);	
					y <= to_unsigned(1, 6);
					SV <= s1;
				when s1 =>
					mem_wr <= '0';
					SV <= s2;
				when s2 =>
					data <= mem_out;	-- Read back the character
					y <= y - 1;
					SV <= s3;
				when s3 =>
					mem_in <= data;	-- Write to the line above
					mem_wr <= '1';
					SV <= s4;
				when s4 =>
					SV <= s5;
				when s5 =>
					mem_wr <= '0';
					y <= y + 1;
					x <= x + 1;
					SV <= s6;
				when s6 =>
					if(x > screen_width-1) then 
						x <= to_unsigned(0, 7);
						y <= y + 1;
						SV <= s7;
					else
						SV <= s1;
					end if;
				when s7 =>
					if(y > screen_height-1) then
						SV <= s8;
					else
						SV <= s1;
					end if;
				when s8 =>				-- Clear the last line
					x <= to_unsigned(0, 7);
					y <= y - 1;
					SV <= s9;
				when s9 =>
					mem_wr <= '1';
					mem_in <= space; -- filled with space X"20"
					SV <= s10;
				when s10 =>
					SV <= s11;
				when s11 =>
					mem_wr <= '0';
					x <= x + 1;
					SV <= s12;
				when s12 =>
					if(x > screen_width-1) then
						xt <= to_unsigned(0, 7); -- last line
						yt <= to_unsigned(59, 6);
						SV <= home1;
					else
						SV <= s9;
					end if;	
				when BS | TAB | ESC =>
					SV <= wait_for_KB_ready;
				when others =>
					SV <= wait_for_KB_ready;
			end case;
		end if;		
	end process;
end architecture DE1_SoC;
