library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use iEEE.NUMERIC_STD.ALL;


entity CONTADOR is
	 Generic (
				 p_DATA			: integer := 28;
				 p_CONTAGEM		: integer:= 50000000;
				 p_DIGITOS		: integer := 9
	 );
	 Port ( 
				i_RST 			: in  STD_LOGIC;
				i_CLK 			: in  STD_LOGIC;
				i_CONTAGEM		: in  STD_LOGIC_VECTOR(p_DATA-1 DOWNTO 0);
			   o_NUMERO  		: out STD_LOGIC_VECTOR(3 DOWNTO 0)
	 );
end CONTADOR;


architecture Behavioral of CONTADOR is

	signal w_LIMITE : STD_LOGIC_VECTOR(i_CONTAGEM'RANGE);
	
begin

	w_LIMITE <= std_logic_vector(to_unsigned(p_CONTAGEM, w_LIMITE'length));
	
	process(i_RST, i_CLK)
		variable v_NUMERO : STD_LOGIC_VECTOR (o_NUMERO'RANGE);
	begin
		if (i_RST = '1') then
			v_NUMERO := (others => '0');
		elsif rising_edge (i_CLK) then
			if (i_CONTAGEM = w_LIMITE) then
				v_NUMERO := v_NUMERO + 1;
			end if;
			
			if (v_NUMERO > std_logic_vector(to_unsigned(p_DIGITOS, v_NUMERO'length))) then
				v_NUMERO := (others => '0');
				o_NUMERO <= v_NUMERO;
			else
			   o_NUMERO <= v_NUMERO;
			end if;	
		end if;
	end process;

	
end Behavioral;
