library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use iEEE.NUMERIC_STD.ALL;


entity PC is
	 Port ( 
			i_RST 			: IN  STD_LOGIC;
			i_CLK 			: IN  STD_LOGIC;
			i_EN_PC			: IN STD_LOGIC;
			o_PC				: OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	 );
end PC;

architecture Behavioral of PC is

	signal w_PC : STD_LOGIC_VECTOR(11 DOWNTO 0);
	
begin
	o_PC <= w_PC;
	process(i_RST, i_CLK)
	begin
		if (i_RST = '1') then
			w_PC <= (others => '0');
		elsif rising_edge (i_CLK) then
				w_PC <= w_PC + 1;
			end if;
	end process;

	
end Behavioral;
