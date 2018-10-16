library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_mem is
   port(
		clock		:  in		std_logic;
		pclock	:  buffer 	std_logic;
		reset		:  in		std_logic;
		mem_adr	:  in		std_logic_vector(12 downto 0);
		mem_out	:  out	std_logic_vector(2 downto 0);
		mem_in	:  in		std_logic_vector(2 downto 0);
		mem_wr	:  in		std_logic;
		vga_hs	:  out	std_logic;
		vga_vs	:  out	std_logic;
--		blank		:  out	std_logic;
		r, g, b	:  out	std_logic_vector(7 downto 0)
   	);
end;

architecture DE1_SoC of vga_mem is
   signal hs1, hs2	: std_logic;
   signal vs1, vs2	: std_logic;
   signal b1			: std_logic;
   signal pdata   	: std_logic_vector(2 downto 0);
   signal paddr   	: std_logic_vector(12 downto 0);
	signal blank		: std_logic;
	
	component VGAPLL is
		port (
			refclk   : in  std_logic; 
			rst      : in  std_logic; 
			outclk_0 : out std_logic	
		);
	end component VGAPLL;


begin
Video_RAM: entity work.vram port map 
	(
      address_a => paddr,
      address_b => mem_adr(12 downto 0),
		clock_a => pclock,
      clock_b => clock,
      data_a => (others => '-'),	-- Don't care
      data_b => mem_in,
      wren_a => '0',
      wren_b => mem_wr,
		q_a => pdata,
      q_b => mem_out
	);

	r <= (others => '0') when blank = '0' else (others => pdata(2));
	g <= (others => '0') when blank = '0' else (others => pdata(1));
	b <= (others => '0') when blank = '0' else (others => pdata(0));
			
   Timing_Circuit: process(pclock, reset) is
      variable hcount : integer range 0 to 1056;
      variable vcount : integer range 0 to 525;
   begin
      if(reset = '1') then
         hcount := 0;      vcount := 0;
         vga_hs <= '1';    vga_vs <= '1';
         paddr <= (others => '0');
      elsif(pclock'event and pclock = '1') then		
         if(hcount >= 0 and hcount <= 799 and vcount >= 0 and vcount <= 479) then
            paddr <=  std_logic_vector(to_unsigned(vcount/8, 6))
							& std_logic_vector(to_unsigned(hcount/8, 7));
            b1 <= '1'; -- don't blank the screen when in the zone 
         else
            b1 <= '0'; -- blank the screen when not in range
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
			
			if(hcount = 1010) then	hs1 <= '0';
			elsif(hcount = 1050) then	hs1 <= '1';
			end if;

			if(vcount = 502) then	vs1 <= '0';
			elsif(vcount = 522) then	vs1 <= '1';
			end if;
			
			hs2 <= hs1;	vs2 <= vs1;	blank <= b1;
			vga_hs <= hs2;	vga_vs <= vs2;

      end if;
   end process;
  ---------------------------------------------		
  pll : VGAPLL port map (
		refclk => clock,
		rst => reset,
		outclk_0	 => pclock	--MTL2 pixel clock = 33.3MHz
	);
end DE1_SoC;	
