library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity IF_GENERATE is
	 Generic(
				N			: integer := 8;
				TIPO		: string := "AND"
	 );
    Port ( 
				i_A		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				i_B 		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			   o_C   	: out STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	 );
end IF_GENERATE;



architecture Behavioral of IF_GENERATE is

	component PORTA_AND is
		 Generic(
					N			: integer := 32
		 );
		 Port ( 
					i_A		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					i_B 		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
					o_C   	: out STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		 );
	end component;

	
	component PORTA_OR is
	 Generic(
				N			: integer := 64
	 );
    Port ( 
				i_A		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				i_B 		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			   o_C   	: out STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	 );
	end component;

	
	
begin
	
	--
	-- Inst^ancia AND.
	--
   U_AND : IF (TIPO = "AND") GENERATE
			U01 : PORTA_AND 
				 Generic Map(
									N		=> N
				 )
				 Port Map( 
									i_A	=> i_A,
									i_B 	=> i_B,
									o_C   => o_C
				 );
	END GENERATE;
		 
	--
	-- Inst^ancia OR.
	--
	U_OR : IF (TIPO = "OR") GENERATE
			U02 : PORTA_OR 
				 Generic Map(
									N		=> N
				 )
				 Port Map( 
									i_A	=> i_A,
									i_B 	=> i_B,
									o_C   => o_C
				 );
	END GENERATE;	 
	
end Behavioral;
