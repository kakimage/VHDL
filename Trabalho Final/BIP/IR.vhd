library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IR is
port ( 
	i_IR :IN STD_LOGIC_VECTOR(15 DOWNTO 0) ;
	i_RST: IN STD_LOGIC;
	i_CLK: IN STD_LOGIC;
	o_IR: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
	o_OPCODE: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
 );
end IR;

architecture Behavioral of IR is
begin
	process(i_CLK, i_RST) is
		begin
		if(i_RST = '1') then
			o_IR <= (others=>'0');
		elsif rising_edge(i_CLK) then
				o_OPCODE <= i_IR(15 DOWNTO 12);
				o_IR <= i_IR(11 DOWNTO 0);
		end if;
	end process;
end Behavioral;