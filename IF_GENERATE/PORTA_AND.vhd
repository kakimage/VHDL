library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity PORTA_AND is
	 Generic(
				N			: integer := 32
	 );
    Port ( 
				i_A		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				i_B 		: in  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			   o_C   	: out STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	 );
end PORTA_AND;



architecture Behavioral of PORTA_AND is


begin
		o_C <= i_A AND i_B;
	
end Behavioral;
