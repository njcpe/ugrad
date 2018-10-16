library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Rhody_CPU is 
  port (	clk		: in	std_logic;
			rst		: in	std_logic;
			MEM_ADR	: out	std_logic_vector(31 downto 0);
			MEM_IN	: in  std_logic_vector(31 downto 0);
			MEM_OUT	: out std_logic_vector(31 downto 0);
	      mem_wr	: out std_logic;
			mem_rd	: out std_logic;
			key 		: in	std_logic;
			LEDR 		: out std_logic_vector(3 downto 0)
		);
end;

architecture Behaviour of Rhody_CPU is
	-- state machine: CPU_state
	type State_type is (S1, S2, S3, S4, S5, S6, S7, S8);
	signal CPU_state: State_type;
	-- Register File: 8x32
	type reg_file_type is array (0 to 7) of std_logic_vector(31 downto 0);
	signal register_file : reg_file_type;
	-- Internal registers
	signal MDR_in, MDR_out, MAR, IR, PSW: std_logic_vector(31 downto 0);
	signal PC, SP: unsigned(31 downto 0);  --unsigned for arithemtic operations
	-- Internal control signals
	signal operand0, operand1, ALU_out : std_logic_vector(31 downto 0);
	signal carry, overflow, zero : std_logic;	
--	signal quotient, remain : std_logic_vector(31 downto 0);
--	signal dzero, mzero : std_logic;
	--Rhody Instruction Format
	alias Opcode: std_logic_vector(5 downto 0)  is IR(31 downto 26);
	alias	RX		: std_logic_vector(2 downto 0)  is IR(25 downto 23); 
	alias	RY		: std_logic_vector(2 downto 0)  is IR(22 downto 20);
	alias RZ		: std_logic_vector(2 downto 0)  is IR(19 downto 17);
	alias I		: std_logic_vector(15 downto 0) is IR(15 downto 0);
	alias M		: std_logic_vector(19 downto 0) is IR(19 downto 0);
	--Condition Codes
	alias Z: std_logic is PSW(0);
	alias C: std_logic is PSW(1);
	alias S: std_logic is PSW(2);
	alias V: std_logic is PSW(3);
	--Instruction Opcodes
	constant NOP  : std_logic_vector(5 downto 0) := "000000";
	constant LDM  : std_logic_vector(5 downto 0) := "000100";
	constant LDR  : std_logic_vector(5 downto 0) := "000101";
	constant LDH  : std_logic_vector(5 downto 0) := "001000";
	constant LDL  : std_logic_vector(5 downto 0) := "001001";
	constant LDI  : std_logic_vector(5 downto 0) := "001010";
	constant MOV  : std_logic_vector(5 downto 0) := "001011";
	constant STM  : std_logic_vector(5 downto 0) := "001100";
	constant STR  : std_logic_vector(5 downto 0) := "001101";
	constant ADD  : std_logic_vector(5 downto 0) := "010000";
	constant ADI  : std_logic_vector(5 downto 0) := "010001";
	constant SUB  : std_logic_vector(5 downto 0) := "010010";
	constant MUL  : std_logic_vector(5 downto 0) := "010011";
	constant IAND : std_logic_vector(5 downto 0) := "010100"; --AND; avoid keyword
	constant IOR  : std_logic_vector(5 downto 0) := "010101"; --OR; avoid keyword
	constant IXOR : std_logic_vector(5 downto 0) := "010110"; --XOR; avoid keyword
	constant IROR : std_logic_vector(5 downto 0) := "010111"; --ROR; avoid keyword
	constant CMP  : std_logic_vector(5 downto 0) := "101010";
	constant CMPI : std_logic_vector(5 downto 0) := "110010";
	constant JNZ  : std_logic_vector(5 downto 0) := "100000";
	constant JNC  : std_logic_vector(5 downto 0) := "100011";
	constant JNS  : std_logic_vector(5 downto 0) := "100001";
	constant JNV  : std_logic_vector(5 downto 0) := "100010";
	constant JZ   : std_logic_vector(5 downto 0) := "100100";
	constant JC   : std_logic_vector(5 downto 0) := "100111";
	constant JS   : std_logic_vector(5 downto 0) := "100101";
	constant JV   : std_logic_vector(5 downto 0) := "100110";
	constant JMP  : std_logic_vector(5 downto 0) := "101000";
	constant CALL : std_logic_vector(5 downto 0) := "110000";
	constant RET  : std_logic_vector(5 downto 0) := "110100";
	constant RETI : std_logic_vector(5 downto 0) := "110101";
	constant PUSH : std_logic_vector(5 downto 0) := "111000";
	constant POP  : std_logic_vector(5 downto 0) := "111001";
	constant SYS  : std_logic_vector(5 downto 0) := "111100";
	constant LDIX : std_logic_vector(5 downto 0) := "000110";
	constant STIX : std_logic_vector(5 downto 0) := "000111";
	constant MTX  : std_logic_vector(5 downto 0) := "011010";
--	constant DIV  : std_logic_vector(5 downto 0) := "011000";
--	constant MODU : std_logic_vector(5 downto 0) := "011001";
	constant CH   : std_logic_vector(5 downto 0) := "101001";
	constant MAJ  : std_logic_vector(5 downto 0) := "101011";
	constant SUM0 : std_logic_vector(5 downto 0) := "011011";
	constant SUM1 : std_logic_vector(5 downto 0) := "111101";
	constant SIG0 : std_logic_vector(5 downto 0) := "111110";
	constant SIG1 : std_logic_vector(5 downto 0) := "111111";

begin
	--Display condition code on LEDR for debugging purpose
	LEDR(3) <= Z when key='0' else '0';
	LEDR(2) <= C when key='0' else '0';
	LEDR(1) <= S when key='0' else '0';
	LEDR(0) <= V when key='0' else '0';
	--CPU bus interface
	MEM_OUT <= MDR_out;	--Outgoing data bus
	MEM_ADR <= MAR;		--Address bus
	--One clock cycle delay in obtaining CPU_state, e.g. S1->S2
	mem_rd	<=	'1' when (CPU_state=S2) else
					'1' when ((Opcode=LDM or Opcode=LDR or Opcode=LDIX) and CPU_state=S4) else
					'1' when ((Opcode=POP or Opcode=RET) and CPU_state=S4) else
					'1' when (Opcode=RETI and (CPU_state=S4 or CPU_state=S6)) else
					'0';		--Memory read control signal
	mem_wr	<=	'1' when ((Opcode=STM or Opcode=STR or Opcode=STIX) and CPU_state=S1) else
					'1' when ((Opcode=PUSH or Opcode=CALL) and CPU_state=S1) else
					'1' when (Opcode=SYS and (CPU_state=S6 or CPU_state=S1)) else			
					'0';		--Memory write control signal

	CPU_State_Machine: process (clk, rst)
	begin
	if rst='1' then
		CPU_state <= S1;
		PC <= x"00000000";	--initialize PC
		SP <= x"000FF7FF";	--initialize SP
	elsif clk'event and clk = '1' then
		case CPU_state is
			when S1 =>
				MAR <= std_logic_vector(PC);
				CPU_state <= S2;
			when S2 =>
				IR <= MEM_IN;
				PC <= PC + 1;
				CPU_state <= S3;
			when S3 =>
				if (Opcode=LDM) then
					MAR <= x"000" & M;	CPU_state <= S4;
				elsif (Opcode=LDR) then
					MAR <= register_file(to_integer(unsigned(RY)));	CPU_state <= S4;
				elsif (Opcode=LDI) then
					register_file(to_integer(unsigned(RX)))<=(31 downto 16=>I(15)) & I;	CPU_state <= S1;
				elsif (Opcode=LDH) then
					register_file(to_integer(unsigned(RX)))(31 downto 16)<= I;	CPU_state <= S1;
				elsif (Opcode=LDL) then
					register_file(to_integer(unsigned(RX)))(15 downto 0)<= I;	CPU_state <= S1;
				elsif (Opcode=STM) then
					MAR <= x"000" & M;	MDR_out <= register_file(to_integer(unsigned(RX)));
					CPU_state <= S4;
				elsif (Opcode=STR) then
					MAR <= register_file(to_integer(unsigned(RX)));	
					MDR_out <= register_file(to_integer(unsigned(RY)));	CPU_state <= S4;
				elsif (Opcode=MOV) then
					register_file(to_integer(unsigned(RX)))<=register_file(to_integer(unsigned(RY)));	
					CPU_state <= S1;
				elsif (Opcode=ADD or Opcode=SUB or Opcode=MUL or Opcode=CMP or
						 Opcode=IAND or Opcode=IOR or Opcode=IXOR) then
					operand1 <= register_file(to_integer(unsigned(RY)));	CPU_state <= S4;
				elsif (Opcode=IROR) then
					CPU_state <= S4;
				elsif (Opcode=ADI or Opcode=CMPI) then
					operand1 <= (31 downto 16=> I(15)) & I;	CPU_state <= S4;
				elsif (Opcode=JMP or
						 (Opcode=JNZ and Z='0') or (Opcode=JZ and Z='1') or
						 (Opcode=JNS and S='0') or (Opcode=JS and S='1') or
						 (Opcode=JNV and V='0') or (Opcode=JV and V='1') or
						 (Opcode=JNC and C='0') or (Opcode=JC and C='1') ) then
					PC <= x"000" & unsigned(M);	CPU_state <= S1;
				elsif (Opcode=CALL or Opcode=PUSH or Opcode=SYS) then
					SP <= SP + 1;	CPU_state <= S4;
				elsif (Opcode=RET or Opcode=RETI or Opcode=POP) then
					MAR <= std_logic_vector(SP);	CPU_state <= S4;
				elsif (Opcode=LDIX) then
					MAR <= std_logic_vector(unsigned(register_file(to_integer(unsigned(RY)))) + unsigned(M));	
					CPU_state <= S4;
				elsif (Opcode=STIX) then
					MAR <= std_logic_vector(unsigned(register_file(to_integer(unsigned(RX)))) + unsigned(M));	
					MDR_out <= register_file(to_integer(unsigned(RY)));
					CPU_state <= S4;
				elsif(Opcode=MTX) then
					register_file(to_integer(unsigned(RX)))<= std_logic_vector(
						signed (I) * signed(register_file(to_integer(unsigned(RZ)))(15 downto 0)) 
						+ signed(register_file(to_integer(unsigned(RY)))));
					CPU_state <= S1;
				elsif (Opcode=CH) then
					register_file(to_integer(unsigned(RX))) <=
						(register_file(to_integer(unsigned(RX))) and register_file(to_integer(unsigned(RY))))xor
						(not register_file(to_integer(unsigned(RX))) and register_file(to_integer(unsigned(RZ))));
					CPU_state <= S1;
				elsif (Opcode=MAJ) then
					register_file(to_integer(unsigned(RX))) <=
						(register_file(to_integer(unsigned(RX))) and register_file(to_integer(unsigned(RY))))xor
						(register_file(to_integer(unsigned(RX))) and register_file(to_integer(unsigned(RZ))))xor
						(register_file(to_integer(unsigned(RY))) and register_file(to_integer(unsigned(RZ))));
					CPU_state <= S1;
				elsif (Opcode=SUM0) then
					register_file(to_integer(unsigned(RX))) <=
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 2)) xor
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 13)) xor
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 22));
					CPU_state <= S1;
				elsif (Opcode=SUM1) then
					register_file(to_integer(unsigned(RX))) <=
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 6)) xor
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 11)) xor
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 25));
					CPU_state <= S1;
				elsif (Opcode=SIG0) then
					register_file(to_integer(unsigned(RX))) <=
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 7)) xor
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 18)) xor
						std_logic_vector(shift_right(unsigned(register_file(to_integer(unsigned(RX)))), 3));
					CPU_state <= S1;
				elsif (Opcode=SIG1) then
					register_file(to_integer(unsigned(RX))) <=
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 17)) xor
						std_logic_vector(rotate_right(unsigned(register_file(to_integer(unsigned(RX)))), 19)) xor
						std_logic_vector(shift_right(unsigned(register_file(to_integer(unsigned(RX)))), 10));
					CPU_state <= S1;
				else	CPU_state <= S1;
				end if;
			when S4 =>
				if (Opcode=LDM or Opcode=LDR or Opcode=LDIX) then
					MDR_in <= MEM_in;	CPU_state <= S5;
				elsif (Opcode=STM or Opcode=STR or Opcode=STIX) then
					CPU_state <= S1;
				elsif (Opcode=ADD or Opcode=SUB or Opcode=IROR or Opcode=IAND or
						 Opcode=MUL or Opcode=IOR or Opcode=IXOR or Opcode=ADI) then
					register_file(to_integer(unsigned(RX))) <= ALU_out;
					Z <= zero;	S <= ALU_out(31);	V <= overflow;	C <= carry; --update CC
					CPU_state <= S1;
				elsif (Opcode=CMP or Opcode=CMPI) then
					Z <= zero;	S <= ALU_out(31);	V <= overflow;	C <= carry; --update CC only
					CPU_state <= S1;
				elsif (Opcode=CALL or Opcode=SYS) then
					MAR <= std_logic_vector(SP);	
					MDR_out <= std_logic_vector(PC);	
					CPU_state <= S5;
				elsif (Opcode=RET or Opcode=RETI or Opcode=POP) then
					MDR_in <= MEM_IN;	SP <= SP - 1;	CPU_state <= S5;
				elsif (Opcode=PUSH) then
					MAR <= std_logic_vector(SP);
					MDR_out <= register_file(to_integer(unsigned(RX)));
					CPU_state <= S5;
				else	CPU_state <= S1;
				end if;
			when S5 =>
				if (Opcode=LDM or Opcode=LDR or Opcode=LDIX or Opcode=POP) then
					register_file(to_integer(unsigned(RX))) <= MDR_in;	
					CPU_state <= S1;
				elsif (Opcode=CALL) then
					PC <= x"000" & unsigned(M); CPU_state <= S1;
				elsif (Opcode=RET) then
					PC <= unsigned(MDR_in);	CPU_state <= S1;
				elsif (Opcode=RETI) then
					PSW <= MDR_in;	MAR <= std_logic_vector(SP);	
					CPU_state <= S6;
				elsif (Opcode=PUSH) then
					CPU_state <= S1;	
				elsif (Opcode=SYS) then
					SP <= SP + 1; CPU_state <= S6;
				else	CPU_state <= S1;
				end if;
			when S6 =>
				if (Opcode=RETI) then
					MDR_in <= MEM_IN;	sp <= sp - 1;	CPU_state <= S7;
				elsif (Opcode=SYS) then
					MAR <= std_logic_vector(SP);
					MDR_out <= PSW; CPU_state <= S7;
				else	CPU_state <= S1;
				end if;
			when S7 =>
				if (Opcode=RETI) then
					PC <= unsigned(MDR_in);	CPU_state <= S1;
				elsif (Opcode=SYS) then
					PC <= X"000FFC0"&unsigned(IR(3 downto 0)); CPU_state <= S1;
				else	CPU_state <= S1;
				end if;
			when others =>
				null;
		end case;
	end if;
	end process;
	--------------------ALU----------------------------			
	Rhody_ALU: entity work.alu port map(
			alu_op => IR(28 downto 26), 
			operand0 => operand0, 
			operand1 => operand1,
			n => IR(4 downto 0), 
			alu_out => ALU_out,
			carry => carry,
			overflow => overflow);	
	zero <= '1' when alu_out = X"00000000" else '0';	
	operand0 <= register_file(to_integer(unsigned(RX)));

end Behaviour;
