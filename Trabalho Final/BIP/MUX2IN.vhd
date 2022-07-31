LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX2IN is 
port (
		i_A: in std_logic_vector(11 DOWNTO 0);
		i_B: in std_logic_vector(11 DOWNTO 0);
		i_S: in std_logic;
		o_Q: out std_logic_vector(11 DOWNTO 0)

);
end MUX2IN;

architecture Behavioral of MUX2IN is
BEGIN
    PROCESS(i_S)
    BEGIN
    if (i_S = '1') then 
		o_Q<=i_B;
    else 
		o_Q<=i_A;
    end if;
    END PROCESS;
end architecture;