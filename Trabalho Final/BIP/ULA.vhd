LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY ula IS
	PORT
	(
	  i_INPUT_A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	  i_INPUT_B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	  i_INPUT_IR: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	  o_OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	  i_SEL : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END ula;

ARCHITECTURE Behavioral OF ula IS

  constant ADD : STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
  constant ADDI  : STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
  constant SUB   : STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
  constant SUBI    : STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
  signal w_OUTPUT: STD_LOGIC_VECTOR(15 DOWNTO 0);
  
BEGIN
	process (i_INPUT_A, i_INPUT_B)
	begin
		case i_SEL is
			when "100" =>
				w_OUTPUT <= i_INPUT_A + i_INPUT_B; --add
			when "101" =>
				w_OUTPUT <= i_INPUT_A + i_INPUT_IR; --addi
			when "110" =>
				w_OUTPUT <= i_INPUT_A - i_INPUT_B; --sub
			when "111" =>
				w_OUTPUT <= i_INPUT_A - i_INPUT_IR; --subi	
			when others => 
				NULL;
		end case;
	end process;
	o_OUTPUT <= w_OUTPUT;
END Behavioral;