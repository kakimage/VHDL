library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity TOP_CRONOMETRO is
    Port ( i_CLK 			: in  STD_LOGIC;
           i_RST 			: in  STD_LOGIC;
			  i_START		: in  STD_LOGIC;
			  i_STOP 		: in  STD_LOGIC;
			  i_CLEAR   	: in  STD_LOGIC;
			  o_SEG_0		: out STD_LOGIC_VECTOR(6 downto 0);
			  o_SEG_1		: out STD_LOGIC_VECTOR(6 downto 0);
			  o_SEG_2		: out STD_LOGIC_VECTOR(6 downto 0);
			  o_SEG_3		: out STD_LOGIC_VECTOR(6 downto 0);
			  o_SEG_4		: out STD_LOGIC_VECTOR(6 downto 0);
			  o_SEG_5		: out STD_LOGIC_VECTOR(6 downto 0);			  
			  o_LED			: out STD_LOGIC
	 );
end TOP_CRONOMETRO;

architecture Behavioral of TOP_CRONOMETRO is
----------------------------------------------------------------------------------
-- Internal signals.
----------------------------------------------------------------------------------

	
	component CRONOMETRO is
    Port ( i_CLK 			: in  STD_LOGIC;
           i_RST 			: in  STD_LOGIC;
			  i_START		: in  STD_LOGIC;
			  i_STOP 		: in  STD_LOGIC;
			  i_CLEAR   	: in  STD_LOGIC;
			  o_CONTADOR	: out STD_LOGIC_VECTOR(27 downto 0);
			  o_LED			: out STD_LOGIC
	 );
	end component;

	component PLL_INTEL
	PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0				: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC 
	);
	end component;
	
	signal w_CLK		: std_logic;
	signal w_RST		: std_logic;
	signal w_LOCKED 	: STD_LOGIC;
	signal w_CONTADOR	: STD_LOGIC_VECTOR(27 downto 0);

----------------------------------------------------------------------------------	
begin
	
	--
	-- Instancialização do CRONOMETRO.
	--
	
	U01 : CRONOMETRO 
    Port Map ( 
					  i_CLK 			=> w_CLK,
					  i_RST 			=> w_RST,
					  i_START		=> i_START,
					  i_STOP 		=> i_STOP,
					  i_CLEAR   	=> i_CLEAR,
					  o_CONTADOR	=> w_CONTADOR,
					  o_LED			=> o_LED
	 );

	 w_RST <= NOT w_LOCKED;
	 
	--
 	-- PLL
	--
	U02 : PLL_INTEL
	PORT MAP
	(
		areset		=> i_RST,
		inclk0		=> i_CLK,
		c0				=> w_CLK,
		locked		=> w_LOCKED
	);
	
end Behavioral;

