LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
  
ENTITY MUX3X1_TB IS
END MUX3X1_TB;
  
ARCHITECTURE Behavioral OF MUX3X1_TB IS
  
	COMPONENT MUX3X1 is
	PORT(
		i_A: in std_logic_vector(15 downto 0);
		i_B: in std_logic_vector(15 downto 0);
		i_C: in std_logic_vector(15 downto 0);
		i_S: in std_logic_vector(1 downto 0);
		o_Q: out std_logic_vector(15 downto 0)
	);
	END COMPONENT;
  
 
 signal w_INPUT_A : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
 signal w_INPUT_B : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
 signal w_INPUT_C : STD_LOGIC_VECTOR(15 DOWNTO 0) := (others => '0');
 signal w_S : STD_LOGIC_VECTOR(1 DOWNTO 0);
 
 signal w_Q : STD_LOGIC_VECTOR(15 DOWNTO 0);
  
BEGIN
  
	UUT: MUX3X1 PORT MAP (
		i_A => w_INPUT_A,
		i_B => w_INPUT_B,
		i_C => w_INPUT_C,
		i_S => w_S,
		o_Q => w_Q
	);

	PROCESS
	BEGIN
	
		WAIT FOR 100 ns;

		w_INPUT_A <= "0000000000000001";
		w_INPUT_B <= "0000000000000010";
		w_INPUT_C <= "0000000000000011";

		w_S <= "00";
		WAIT FOR 100 ns;
		w_S <= "01";
		WAIT FOR 100 ns;
		w_S <= "10";
		WAIT FOR 100 ns;

	END PROCESS;
 
END;

