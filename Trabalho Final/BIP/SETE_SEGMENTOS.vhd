library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity SETE_SEGMENTOS is
	 Port ( 
				i_NUMERO		: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
				i_RST 		: in  STD_LOGIC;
			   o_DISPLAY  	: out STD_LOGIC_VECTOR(6 DOWNTO 0)
	 );
end SETE_SEGMENTOS;


architecture Behavioral of SETE_SEGMENTOS is

--	constant w_ON : std_logic := '0';

	signal w_ON	: std_logic := '0';
	signal w_OFF : std_logic := '1';
	
begin

	process(i_RST, w_ON, w_OFF)
	begin
		if (i_RST = '1') then
			o_DISPLAY <= (OTHERS => w_OFF);
		
		else
			case i_NUMERO is 
				when x"0" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_ON;
					o_DISPLAY(4) <= w_ON;
					o_DISPLAY(5) <= w_ON;
					o_DISPLAY(6) <= w_OFF;
					
				when x"1" => 
					o_DISPLAY(0) <= w_OFF;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_OFF;
					o_DISPLAY(4) <= w_OFF;
					o_DISPLAY(5) <= w_OFF;
					o_DISPLAY(6) <= w_OFF;
					
				when x"2" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_OFF;
					o_DISPLAY(3) <= w_ON;
					o_DISPLAY(4) <= w_ON;
					o_DISPLAY(5) <= w_OFF;
					o_DISPLAY(6) <= w_ON;
					
				when x"3" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_ON;
					o_DISPLAY(4) <= w_OFF;
					o_DISPLAY(5) <= w_OFF;
					o_DISPLAY(6) <= w_ON;
					
				when x"4" => 
					o_DISPLAY(0) <= w_OFF;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_OFF;
					o_DISPLAY(4) <= w_OFF;
					o_DISPLAY(5) <= w_ON;
					o_DISPLAY(6) <= w_ON;
					
				when x"5" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_OFF;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_ON;
					o_DISPLAY(4) <= w_OFF;
					o_DISPLAY(5) <= w_ON;
					o_DISPLAY(6) <= w_ON;
					
				when x"6" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_OFF;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_ON;
					o_DISPLAY(4) <= w_ON;
					o_DISPLAY(5) <= w_ON;
					o_DISPLAY(6) <= w_ON;
					
				when x"7" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_OFF;
					o_DISPLAY(4) <= w_OFF;
					o_DISPLAY(5) <= w_OFF;
					o_DISPLAY(6) <= w_OFF;
					
				when x"8" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_ON;
					o_DISPLAY(4) <= w_ON;
					o_DISPLAY(5) <= w_ON;
					o_DISPLAY(6) <= w_ON;
					
				when x"9" => 
					o_DISPLAY(0) <= w_ON;
					o_DISPLAY(1) <= w_ON;
					o_DISPLAY(2) <= w_ON;
					o_DISPLAY(3) <= w_OFF;
					o_DISPLAY(4) <= w_OFF;
					o_DISPLAY(5) <= w_ON;
					o_DISPLAY(6) <= w_ON;
				
				when others => null;
			end case;
		end if;
	end process;

	
end Behavioral;
