LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY BIP IS
	PORT
	(
	  i_CLK : IN  STD_LOGIC;
     i_RST : IN  STD_LOGIC;
	  i_SWITCHS: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	  o_LEDS: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END BIP;


architecture Behavioral of BIP IS

	component PLL is
		PORT
		(
			areset		: IN STD_LOGIC  := '0';
			inclk0		: IN STD_LOGIC  := '0';
			c0				: OUT STD_LOGIC ;
			locked		: OUT STD_LOGIC 
		);
	end component;
	
	component RAM is
		PORT(
			--i_EN_RAM: IN STD_LOGIC;
			--i_RST: IN STD_LOGIC;
			address: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			wren: IN STD_LOGIC;
			clock: IN STD_LOGIC;
			q: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
	end component;
	
	component ROM is
		PORT(
			--i_EN_ROM: IN STD_LOGIC;
			--i_RST: IN STD_LOGIC;
			address: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			clock: IN STD_LOGIC;
			
			q: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
	end component;
	
	component MUX2OP2 is
		PORT(
			i_A: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_S: IN STD_LOGIC;
			
			o_Q: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
	end component;
	
	component MUX2IN is
		PORT(
			i_A: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			i_B: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			i_S: IN STD_LOGIC;
			
			o_Q: OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
	end component;
	
	component MUX3X1 is
		PORT(
			i_A: IN STD_LOGIC_VECTOR(15 downto 0);
			i_B: IN STD_LOGIC_VECTOR(15 downto 0);
			i_C: IN STD_LOGIC_VECTOR(15 downto 0);
			i_S: IN STD_LOGIC_VECTOR(1 downto 0);
			
			o_Q: OUT STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;
	
	component ULA is
		PORT(
			i_INPUT_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_INPUT_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_SEL_ULA: IN STD_LOGIC;
			
			o_OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
	end component;
	
	component CONTROL is
		PORT(
			i_OPCODE: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			
			o_WR_RAM: OUT STD_LOGIC;
			o_EN_RAM: OUT STD_LOGIC;
			o_EN_PC: OUT STD_LOGIC;
			o_EN_ROM: OUT STD_LOGIC;
			o_WR_ACC: OUT STD_LOGIC;
			o_SEL_OP1: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			o_SEL_OP2: OUT STD_LOGIC;
			o_SEL_ULA: OUT STD_LOGIC;
			o_EN_IN: OUT STD_LOGIC
			);
	end component;
	
	component PC is
		PORT(
			i_RST 			: IN  STD_LOGIC;
			i_CLK 			: IN  STD_LOGIC;
			i_EN_PC			: IN STD_LOGIC;
			
			o_PC				: OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
	end component;
	
	component IR is
		PORT(
			i_IR :IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
			i_RST: IN STD_LOGIC;
			i_CLK: IN STD_LOGIC;
			
			o_IR: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			o_OPCODE: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	end component;
	
	component ACC is
		PORT(
			i_CLK : IN STD_LOGIC;
			i_RST : IN STD_LOGIC;
			i_WR_ACC : IN STD_LOGIC;
			i_ACC : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			o_ACC : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
			);
	end component;
	
	SIGNAL w_CLK: STD_LOGIC;
	SIGNAL w_RST: STD_LOGIC;
	SIGNAL w_LOCKED: STD_LOGIC;
	
	SIGNAL w_OPCODE: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL w_WR_RAM: STD_LOGIC;
	SIGNAL w_EN_RAM: STD_LOGIC;
	SIGNAL w_EN_PC: STD_LOGIC;
	SIGNAL w_EN_ROM: STD_LOGIC;
	SIGNAL w_WR_ACC: STD_LOGIC;
	SIGNAL w_SEL_OP1: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL w_SEL_OP2: STD_LOGIC;
	SIGNAL w_SEL_ULA: STD_LOGIC;
	SIGNAL w_EN_IN: STD_LOGIC;
	
	SIGNAL w_ADD_ROM: STD_LOGIC_VECTOR(11 DOWNTO 0);
	
	SIGNAL w_DATA_ROM: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL w_IR: STD_LOGIC_VECTOR(11 DOWNTO 0);

	SIGNAL w_QIN: STD_LOGIC_VECTOR(11 DOWNTO 0);
	
	SIGNAL w_ACC: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL w_ULA: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL w_MUX3: STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	SIGNAL w_MUX2OP2: STD_LOGIC_VECTOR(15 DOWNTO 0);
	
begin
	U01: PLL
		PORT MAP(
			areset 	=> NOT i_RST,
			inclk0 	=> i_CLK,
			c0			=> w_CLK,
			locked 	=> w_LOCKED
				);
	
	uCONTROL: CONTROL
		PORT MAP(
			i_OPCODE 	=> w_OPCODE,
			o_WR_RAM 	=> w_WR_RAM,
			o_EN_RAM 	=> w_EN_RAM,
			o_EN_PC 		=> w_EN_PC,
			o_EN_ROM 	=> w_EN_ROM,
			o_WR_ACC 	=> w_WR_ACC,
			o_SEL_OP1 	=> w_SEL_OP1,
			o_SEL_OP2 	=> w_SEL_OP2,
			o_SEL_ULA 	=> w_SEL_ULA,
			o_EN_IN 		=> w_EN_IN
				);

	uPC: PC
		PORT MAP(
			i_RST 		=> w_RST,
			i_CLK 		=> w_CLK,
			i_EN_PC		=> w_EN_PC,
			o_PC			=> w_ADD_ROM
				);
	uIR: IR
	PORT MAP(
			i_IR 			=> w_DATA_ROM,
			i_RST 		=> w_RST,
			i_CLK 		=> w_CLK,
			o_IR			=> w_IR,
			o_OPCODE		=> w_OPCODE
				);
	uMUX2IN: MUX2IN
		PORT MAP(
			i_A			=> w_IR,
			i_B			=> "00" & i_SWITCHS,
			i_S			=> w_EN_IN,
			o_Q			=> w_QIN
				);
	uMUX3X1: MUX3X1
		PORT MAP(
			i_A			=> w_ACC,
			i_B			=> "0000" & w_QIN,
			i_C 			=> w_ULA,
			i_S			=> w_SEL_OP1,
			o_Q			=> w_MUX3
				);
	
	uACC: ACC
		PORT MAP(
			i_CLK 		=> w_CLK,
			i_RST 		=> w_RST,
			i_WR_ACC 	=> w_WR_ACC,
			i_ACC 		=> w_MUX3,
			o_ACC 		=> w_ACC
				);
	uMUX2OP2: MUX2OP2
		PORT MAP(
			i_A			=> w_ACC,
			i_B			=> w_MUX3,
			i_S			=> w_SEL_OP2,
			o_Q			=> w_MUX2OP2
				);
				
	uULA: ULA
		PORT MAP(
			i_INPUT_A 	=> w_MUX2OP2,
			i_INPUT_B 	=> w_ACC,
			i_SEL_ULA	=> w_SEL_ULA,
			o_OUTPUT 	=> W_ULA
				);
				
	U02: ROM
		PORT MAP(
			address		=> w_ADD_ROM,
			clock			=> w_CLK,
			q				=> W_DATA_ROM
				);
	U03: RAM
		PORT MAP(
			address		=> w_IR,
			wren			=> w_WR_RAM,
			clock			=> w_CLK
				);
				
	w_RST <= NOT w_LOCKED;
	o_LEDS <= w_ACC(9 DOWNTO 0);
end Behavioral;