LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY ula IS
	PORT
	(
	  i_INPUT_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	  i_INPUT_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	  i_SEL_ULA: IN STD_LOGIC;
	  o_OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END ula;

ARCHITECTURE Behavioral OF ula IS
  
BEGIN
	process (i_INPUT_A, i_INPUT_B, i_SEL_ULA)
	begin
	if(i_SEL_ULA = '0') then
				o_OUTPUT <= i_INPUT_A + i_INPUT_B; --add
	else
				o_OUTPUT <= i_INPUT_A - i_INPUT_B; --sub
	end if;
	end process;
END Behavioral;