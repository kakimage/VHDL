LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX2X1 is 
port (
		i_A: in std_logic_vector(15 DOWNTO 0);
		i_B: in std_logic_vector(15 DOWNTO 0);
		i_S: in std_logic;
		o_Q: out std_logic_vector(15 DOWNTO 0)

);
end MUX2X1;

architecture Behavioral of MUX2X1 is
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