library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga1 is
   port(	clk		: in		std_logic;
			clock_50	: in		std_logic;
			rst		: in		std_logic;
			mem_adr	: in		std_logic_vector(31 downto 0);
			vga_out	: out		std_logic_vector(31 downto 0);
			vga_in	: in		std_logic_vector(31 downto 0);
			wr			: in		std_logic;
			en_vga	: in		std_logic;
			en_text	: in		std_logic;
			en_graph	: in		std_logic;
			vga_hs	: out		std_logic;
			vga_vs	: out		std_logic;
			r, g, b	: out		std_logic_vector(7 downto 0);
			pclk		: buffer	std_logic;
			SW			: in		std_logic_vector(1 downto 0)
		);
end;

architecture vga of vga1 is
   
   signal p1, p2			:  std_logic_vector(18 downto 0);
	signal px				:	std_logic_vector(9 downto 0);
	signal py				:	std_logic_vector(8 downto 0);
   signal char_out		:  std_logic_vector(0 to 7);
   signal Q, V					:  std_logic_vector(5 downto 0);
	signal control			:	std_logic_vector(2 downto 0);
   signal hsync, vsync	:  std_logic;
	signal blank			:  std_logic;
	signal h1, v1, b0, b1, b2	:  std_logic;
	signal pdata, text_out 	:  std_logic_vector(6 downto 0);
   signal tr, tg, tb, gr, gg, gb :  std_logic_vector(7 downto 0);
	
	component VGAPLL is
		port (
			refclk   : in  std_logic; 
			rst      : in  std_logic; 
			outclk_0 : out std_logic 
		);
	end component VGAPLL;

begin
	-----------------------------------------------------------
	--Graphic video memory for MTL2: 800x480 @ 6-bit color
	--Emulating 8-bit color
	-----------------------------------------------------------
	VRAM_graphics: ENTITY work.vramg PORT MAP (
      clock_a => pclk,
		address_a => py & px,
		data_a => "000000",
		wren_a => '0',
		q_a => Q,
		clock_b => clk,
      address_b => mem_adr(18 downto 0),
      data_b => vga_in(7)&vga_in(6)&vga_in(4)&vga_in(3)&vga_in(1)&vga_in(0),
      wren_b => wr and en_graph,
		q_b => v
	);
	-----------------------------------------------------------
	--Text video memory (50x30 characters)
	--From memory bus: bit(6:0)=7-bit ASCII code		
	-----------------------------------------------------------
	VRAM_text : entity work.vramt port map(
		clock_a => pclk,
		address_a => py(8 downto 4)&px(9 downto 4),
		q_a => pdata,
		data_a => (others => '-'),	
		wren_a => '0',
		clock_b => clk,
		address_b => mem_adr(10 downto 0),
		q_b => text_out,
		data_b => vga_in(6 downto 0),
		wren_b => wr and en_text
	);
	-----------------------------------------------------------
	--Text video ASCII font table
	-----------------------------------------------------------
	font_table: entity work.VROM port map(
		clock => pclk,
		address => pdata & p1(13 downto 11),
		q => char_out
	);
	--Write process to control register
	control_register: process(rst, clk) is
	begin
		if(rst='1') then
			control<="000";
		elsif(clk'event and clk='1') then
			if(wr='1' and en_vga='1') then control <= vga_in(2 downto 0);
			end if;
		end if;
	end process control_register;
	--Interface to CPU mem/io bus	
	vga_out <=	x"000000" & v(5 downto 4) & '0' & v(3 downto 2) & '0' & v(1 downto 0)
													when en_graph='1' else
					x"000000" & '0' & text_out when en_text='1'else
					(others => '0');
	--RGB video signal generations; merging text and graphic video signals						  
	r <= 	x"00" when blank='0' else
			tr when control(2)='0' and SW="00" else
			tr when control="100" else
			gr when control(2)='0' and SW="10" else
			gr	when control="110" else
			tr and gr when control(2)='0' and SW="01" else
			tr and gr when control="101" else
			tr xor gr when control="111" else
			tr xor gr;
	g <= 	x"00" when blank='0' else
			tg when control(2)='0' and SW="00" else
			tg when control="100" else
			gg when control(2)='0' and SW="10" else
			gg when control="110" else
			tg and gg when control(2)='0' and SW="01" else
			tg and gg when control="101" else
			tg xor gg when control="111" else
			tg xor gg;
	b <= 	x"00" when blank='0' else
			tb when control(2)='0' and SW="00" else
			tb when control="100" else
			gb when control(2)='0' and SW="10" else
			gb when control="110" else
			tb and gb when control(2)='0' and SW="01" else
			tb and gb when control="101" else
			tb xor gb when control="111" else
			tb xor gb;
	-----------------------------------------------------------
	--VGA Timing circuit and signal delay buffers
	-----------------------------------------------------------
	process(pclk, rst) is
		variable hcount : integer range 0 to 1056;
		variable vcount : integer range 0 to 525;
	begin
		if(rst = '1') then
			hcount := 0;
			vcount := 0;
			hsync <= '1';
			vsync <= '1';
		elsif(pclk'event and pclk = '1') then
			if(hcount >= 0 and hcount <= 799 and vcount >= 0 and vcount <= 479) then
				px <=	std_logic_vector(to_unsigned(hcount, 10));
				py <= std_logic_vector(to_unsigned(vcount, 9));
				b0 <= '1';	-- don't blank the screen when in the zone
			else
				b0 <= '0';	-- blank the screen when not in range
			end if;
				
			if(hcount = 1055) then
				hcount := 0;
				if(vcount = 524) then	
					vcount := 0;
				else
					vcount := vcount + 1;
				end if;
			else
				hcount := hcount + 1;
			end if;
		
			if(hcount = 1010) then		hsync <= '0';
			elsif(hcount = 1050) then	hsync <= '1';
			end if;

			if(vcount = 502) then		vsync <= '0';
			elsif(vcount = 522) then	vsync <= '1';
			end if;
				
			h1 <= hsync;		-- hsync, vsync and blank signals
			v1 <= vsync;		-- are delayed by two clock cycles
			b1 <= b0;			-- to compensate for delays
			b2 <= b1;
			vga_hs <= h1;		
			vga_vs <= v1;
			blank <= b2;
			p1 <= py & px;
			p2 <= p1;
			--Generating RGB signals for the text video
			tr <= (7 downto 0 => char_out(to_integer(unsigned(p2(3 downto 1)))));
			tg <= (7 downto 0 => char_out(to_integer(unsigned(p2(3 downto 1)))));
			tb <= (7 downto 0 => char_out(to_integer(unsigned(p2(3 downto 1)))));
			--Generating RGB signals for the graphic video
			gR <= Q(5 downto 4) & Q(5 downto 4) & Q(5 downto 4) & Q(5 downto 4); 
			gG <= Q(3 downto 2) & Q(3 downto 2) & Q(3 downto 2) & Q(3 downto 2); 
			gB <= Q(1 downto 0) & Q(1 downto 0) & Q(1 downto 0) & Q(1 downto 0);       
		end if;
	end process;
--------------------------------------------
  pll: vgapll port map(
      refclk => clock_50,
		rst => rst,
      outclk_0 => pclk		--MTL2 pixel clock = 33.3MHz
   ); 
end vga;
