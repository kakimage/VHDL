LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
  
ENTITY ULA_TB IS
END ULA_TB;
  
ARCHITECTURE Behavioral OF ULA_TB IS
  
	COMPONENT ULA is
	PORT(
		i_INPUT_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		i_INPUT_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		i_SEL_ULA : IN STD_LOGIC;
		o_OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
	END COMPONENT;
  
 
 signal w_INPUT_A : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
 signal w_INPUT_B : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
 signal w_SEL_ULA : STD_LOGIC;
 
 signal w_OUTPUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
  
BEGIN
  
	UUT: ULA PORT MAP (
		i_INPUT_A => w_INPUT_A,
		i_INPUT_B => w_INPUT_B,
		i_SEL_ULA => w_SEL_ULA,
		o_OUTPUT => w_OUTPUT
	);

	PROCESS
	BEGIN
	
		WAIT FOR 100 ns;

		w_INPUT_A <= "0000000000000010";
		w_INPUT_B <= "0000000000000010";

		w_SEL_ULA <= '0';
		WAIT FOR 100 ns;
		w_SEL_ULA <= '1';
		WAIT FOR 100 ns;

	END PROCESS;
 
END;

