LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TB_FULL_ADDER IS
	
END ENTITY;

ARCHITECTURE BEHAVIORAL OF TB_FULL_ADDER IS
	COMPONENT FULL_ADDER IS
		PORT(
			I_A : IN  STD_LOGIC;
			I_B : IN  STD_LOGIC;
			I_C : IN  STD_LOGIC;
			O_C : OUT STD_LOGIC;
			O_S : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL WI_A  : STD_LOGIC;
	SIGNAL WI_B  : STD_LOGIC;
	SIGNAL WI_C  : STD_LOGIC;
	SIGNAL WO_C  : STD_LOGIC;
	SIGNAL WO_S  : STD_LOGIC;
BEGIN

	TB_FA : FULL_ADDER
		PORT MAP(
			I_A => WI_A,
			I_B => WI_B,
			I_C => WI_C,
			O_C => WO_C,
			O_S => WO_S 
		);
	
	process
	begin
		WI_A  <= '0';
		WI_B 	<= '0';
		WI_C	<= '0';
		wait for 10 ms;
		
		WI_A  <= '0';
		WI_B 	<= '0';
		WI_C	<= '1';
		wait for 10 ms;
		
		WI_A  <= '0';
		WI_B 	<= '1';
		WI_C	<= '0';
		wait for 10 ms;
		
		WI_A  <= '0';
		WI_B 	<= '1';
		WI_C	<= '1';
		wait for 10 ms;
		
		WI_A  <= '1';
		WI_B 	<= '0';
		WI_C	<= '0';
		wait for 10 ms;
		
		WI_A  <= '1';
		WI_B 	<= '0';
		WI_C	<= '1';
		wait for 10 ms;
		
		WI_A  <= '1';
		WI_B 	<= '1';
		WI_C	<= '0';
		wait for 10 ms;
		
		WI_A  <= '1';
		WI_B 	<= '1';
		WI_C	<= '1';
		wait for 10 ms;
		
		
		wait;
	end process;
	
END ARCHITECTURE;