LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY BIP IS
	PORT
	(
	  i_CLK : in  STD_LOGIC;
     i_RST : in  STD_LOGIC
	);
END BIP;


architecture Behavioral of BIP IS

	component PLL_INTEL is
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
			i_ADD: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			i_EN: IN STD_LOGIC;
			i_WR: IN STD_LOGIC;
			i_RST: IN STD_LOGIC;
			i_CLK: IN STD_LOGIC;
			
			io_DATA: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
	end component;
	
	component ROM is
		PORT(
			i_ADD: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			i_EN: IN STD_LOGIC;
			i_RST: IN STD_LOGIC;
			i_CLK: IN STD_LOGIC;
			
			o_DATA: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
	end component;
	
	component MUX2X1 is
		PORT(
			i_A: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_S: IN STD_LOGIC;
			
			o_Q: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
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
			i_INPUT_IR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			i_SEL : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			
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
			i_RST_PC			: IN STD_LOGIC;
			
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
begin
	
	
	
end Behavioral;