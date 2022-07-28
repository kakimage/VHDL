LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX3X1 is 
port (A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		C: in std_logic_vector(15 downto 0);
		S: in std_logic_vector(1 downto 0);
		Q: out std_logic_vector(15 downto 0)

);
end MUX3X1;

architecture Behavioral of MUX3X1 is
BEGIN
    PROCESS(S)
    BEGIN
		 	case S is
				when "00" => Q <= A;
				when "01" => Q <= B;
				when "10" => Q <= C;
				when others => report "unreachable" severity failure;
	end case;
	END PROCESS;
end architecture;