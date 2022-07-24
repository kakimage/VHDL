LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MUX2X1 is 
port (A: in std_logic_vector(15 downto 0);
		B: in std_logic_vector(15 downto 0);
		S: in std_logic;
		Q: out std_logic_vector(15 downto 0)

);
end MUX2X1;

architecture Behavioral of MUX2X1 is
BEGIN
    PROCESS(S)
    BEGIN
    if (S = '1') then 
		Q<=B;
    else 
		Q<=A;
    end if;
    END PROCESS;
end architecture;