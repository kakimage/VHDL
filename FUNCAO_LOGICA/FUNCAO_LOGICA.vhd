library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity FUNCAO_LOGICA is
    Port ( 
				i_A		: in  STD_LOGIC;
				i_B 		: in  STD_LOGIC;
				i_C 		: in  STD_LOGIC;
				i_D 		: in  STD_LOGIC;
				i_E 		: in  STD_LOGIC;
				o_F   	: out STD_LOGIC;
			   o_G   	: out STD_LOGIC
	 );
end FUNCAO_LOGICA;



architecture Behavioral of FUNCAO_LOGICA is

	-- Declarando componentes externos
	COMPONENT LOGICA_AND is
		 Port ( 
					i_A		: in  STD_LOGIC;
					i_B 		: in  STD_LOGIC;
					i_C		: in  STD_LOGIC;
					i_D 		: in  STD_LOGIC;
					i_E 		: in  STD_LOGIC;
					o_C   	: out STD_LOGIC
		 );
	end COMPONENT;
	
	-- Declarando sinais internos.
	SIGNAL w_F	: STD_LOGIC;


begin

	-- Instancializando component 01.
		U01 : LOGICA_AND 
		 PORT MAP ( 
						i_A		=> i_A,
						i_B 		=> i_B,
						i_C		=> i_C,
						i_D 		=> i_D,
						i_E 		=> i_E,
						o_C   	=> w_F
		 );

		-- Instancializando component 02.
		U02 : LOGICA_AND 
		 PORT MAP ( 
						i_A		=> i_B,
						i_B 		=> i_C,
						i_C		=> i_D,
						i_D 		=> i_E,
						i_E 		=> w_F,
						o_C   	=> o_G
		 );
	 
		o_F <= w_F;
	
end Behavioral;
