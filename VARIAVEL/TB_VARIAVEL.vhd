library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity TB_VARIAVEL is
end TB_VARIAVEL;

architecture Behavioral of TB_VARIAVEL is
----------------------------------------------------------------------------------
-- Internal signals.
----------------------------------------------------------------------------------
	signal w_CLK			: std_logic;
	signal w_RST			: std_logic;
	signal w_SINAL_1		: std_logic;
	signal w_SINAL_2		: std_logic;
	
	
	component VARIAVEL is
		 Port ( i_CLK 			: in  STD_LOGIC;
				  i_RST 			: in  STD_LOGIC;
				  o_SINAL_1		: out STD_LOGIC;
				  o_SINAL_2		: out STD_LOGIC
		 );
	end component;

	
begin

	UUT :  VARIAVEL 
		    Port Map ( 
						i_CLK 			=> w_CLK,
					   i_RST 			=> w_RST,
					   o_SINAL_1		=> w_SINAL_1,
				      o_SINAL_2		=> w_SINAL_2
			);

	PROCESS
	BEGIN
		w_CLK <= '0';
		WAIT FOR 10 NS;
		w_CLK <= '1';
		WAIT FOR 10 NS;
	END PROCESS;
		
	
	PROCESS
	BEGIN
		w_RST <= '1';
		WAIT FOR 40 NS;
		w_RST <= '0';
		WAIT;
	END PROCESS;	
	
end Behavioral;