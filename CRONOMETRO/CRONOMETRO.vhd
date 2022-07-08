library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity CRONOMETRO is
    Port ( i_CLK 			: in  STD_LOGIC;
           i_RST 			: in  STD_LOGIC;
			  i_START		: in  STD_LOGIC;
			  i_STOP 		: in  STD_LOGIC;
			  i_CLEAR   	: in  STD_LOGIC;
			  o_CONTADOR	: out STD_LOGIC_VECTOR(27 downto 0);
			  o_LED			: out STD_LOGIC
	 );
end CRONOMETRO;

architecture Behavioral of CRONOMETRO is
----------------------------------------------------------------------------------
-- Internal signals.
----------------------------------------------------------------------------------
 type Estado is (st_IDLE, st_CONTAR, st_PARAR); 

	attribute syn_encoding : string;
	attribute syn_encoding of Estado : type is "safe";
	
   signal w_STATE 		: Estado;
	signal w_CONTADOR		: STD_LOGIC_VECTOR(27 downto 0);
	signal w_LED			: STD_LOGIC;
	
	-- 0010 1111 1010 1111 0000 1000 0000
	
begin

----------------------------------------------------------------------------------
-- State machine.

	process(i_RST, i_CLK)
	begin
		
		if (i_RST = '1') then
			w_CONTADOR <= (OTHERS => '0');
			w_LED <= '0';
			w_STATE <= st_IDLE;
			
		elsif rising_edge (i_CLK) then
			case w_STATE is
				when st_IDLE => 
					if (i_START = '1') then
						w_CONTADOR <= w_CONTADOR + 1;
						w_STATE <= st_CONTAR;
					else
						w_STATE <= st_IDLE;
					end if;
					
				when st_CONTAR =>
					if (i_STOP = '1') then
						w_STATE <= st_PARAR;
					elsif (i_CLEAR = '1') then
						w_CONTADOR <= (others => '0');
						w_STATE <= st_IDLE;
					else
						w_CONTADOR <= w_CONTADOR + 1;
						
						if (w_CONTADOR = "0010111110101111000010000000") then
							w_CONTADOR <= (OTHERS => '0');
							w_LED <= NOT w_LED;		
							w_STATE <= st_CONTAR;
						end if;
					end if;
				
				when st_PARAR => 
					if (i_START = '1') then
						w_CONTADOR <= w_CONTADOR + 1;
						W_STATE <= st_CONTAR;
					elsif (i_CLEAR = '1') then
						w_CONTADOR <= (others => '0');
						w_STATE <= st_IDLE;
					else
						w_STATE <= st_PARAR;
					end if;
			
				when others =>
					w_STATE <= st_IDLE;
					
				end case;
			end if;
		end process;	
			
	--
	-- Coloca sinal na saída.
	--
	o_CONTADOR <= w_CONTADOR;
	o_LED <= w_LED;
	
end Behavioral;

