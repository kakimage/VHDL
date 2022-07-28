library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ACC is
	Port ( 	
			i_CLK : IN STD_LOGIC;
			i_RST : IN STD_LOGIC;
			i_WR_ACC : IN STD_LOGIC;
			i_ACC : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			o_ACC : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
			);
end ACC;


architecture Behavioral of ACC is
	signal w_ACC : STD_LOGIC_VECTOR (15 DOWNTO 0);
begin

	process (i_RST, i_CLK)
	begin
		if i_RST = '1' then

			o_ACC <= (others=>'0');
			w_ACC <= (others=>'0');

		elsif rising_edge(i_CLK) then
			if i_WR_ACC = '1' then

				w_ACC <= w_ACC + i_ACC;

			end if;
		end if;
		o_ACC <= w_ACC;
	end process;
end Behavioral;