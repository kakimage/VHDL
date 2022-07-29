LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX3X1 is 
port (
		i_A: in std_logic_vector(15 downto 0);
		i_B: in std_logic_vector(15 downto 0);
		i_C: in std_logic_vector(15 downto 0);
		i_S: in std_logic_vector(1 downto 0);
		o_Q: out std_logic_vector(15 downto 0)

);
end MUX3X1;

architecture Behavioral of MUX3X1 is
BEGIN
    PROCESS(i_S)
    BEGIN
		 	case i_S is
				when "00" => o_Q <= i_A;
				when "01" => o_Q <= i_B;
				when "10" => o_Q <= i_C;
				when others => report "unreachable" severity failure;
	end case;
	END PROCESS;
end architecture;