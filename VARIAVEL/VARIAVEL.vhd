library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity VARIAVEL is
    Port ( i_CLK 			: in  STD_LOGIC;
           i_RST 			: in  STD_LOGIC;
			  o_SINAL_1		: out STD_LOGIC;
			  o_SINAL_2		: out STD_LOGIC
	 );
end VARIAVEL;

architecture Behavioral of VARIAVEL is
----------------------------------------------------------------------------------
-- Internal signals.
----------------------------------------------------------------------------------
 type Estado is (st_IDLE, st_ATUALIZA); 

	attribute syn_encoding : string;
	attribute syn_encoding of Estado : type is "safe";
	
   signal w_STATE 		: Estado;
	signal w_CONTADOR		: STD_LOGIC_VECTOR(3 downto 0);
	signal w_SINAL			: std_logic;
	
	
begin

----------------------------------------------------------------------------------
-- State machine.

--	process(i_RST, i_CLK)
--		variable v_SINAL : std_logic;
--		
--	begin
--		
--		if (i_RST = '1') then
--			w_CONTADOR <= (OTHERS => '0');
--			w_SINAL <= '0';
--			v_SINAL := '0';
--			o_SINAL_1 <= '0';
--			o_SINAL_2 <= '0';
--			w_STATE <= st_IDLE;
--			
--		elsif rising_edge (i_CLK) then
--			case w_STATE is
--				when st_IDLE => 
--					if (w_CONTADOR < X"A") then
--						w_CONTADOR <= w_CONTADOR + 1;
--						w_STATE <= st_IDLE;
--					else
--						w_CONTADOR <= (OTHERS => '0');
--						w_STATE <= st_ATUALIZA;
--					end if;
--					
--				when st_ATUALIZA =>
--				
--					w_SINAL <= NOT w_SINAL;
--					o_SINAL_1 <= w_SINAL;
--					
--					v_SINAL := NOT v_SINAL;
--					o_SINAL_2 <= v_SINAL;
--					
--					w_STATE <= st_IDLE;
--			
--				when others =>
--					w_STATE <= st_IDLE;
--					
--				end case;
--			end if;
--		end process;	
	
	process(i_RST, i_CLK)
		variable v_SINAL : std_logic;
		
	begin
		
		if (i_RST = '1') then
			w_CONTADOR <= (OTHERS => '0');
			w_SINAL <= '0';
			v_SINAL := '0';
			o_SINAL_1 <= '0';
			o_SINAL_2 <= '0';
			
		elsif rising_edge (i_CLK) then
			
					w_SINAL <= NOT w_SINAL;
					o_SINAL_1 <= w_SINAL;
					
					v_SINAL := NOT v_SINAL;
					o_SINAL_2 <= v_SINAL;
					
					w_STATE <= st_IDLE;

		end if;
	end process;		
	
end Behavioral;

