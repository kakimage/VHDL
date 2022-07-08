library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;



entity TB_CRONOMETRO is
end TB_CRONOMETRO;


architecture Behavioral of TB_CRONOMETRO is
	
	component CRONOMETRO is
    Port ( i_CLK 			: in  STD_LOGIC;
           i_RST 			: in  STD_LOGIC;
			  i_START		: in  STD_LOGIC;
			  i_STOP 		: in  STD_LOGIC;
			  i_CLEAR   	: in  STD_LOGIC;
			  o_CONTADOR	: out STD_LOGIC_VECTOR(16 downto 0);
			  o_LED			: out STD_LOGIC
	 );
	end component;
	
	signal w_CLK		: std_logic;
	signal w_RST		: std_logic;
	signal w_START		: std_logic;
	signal w_STOP 		: std_logic;
	signal w_CLEAR  	: std_logic;
	signal w_CONTADOR	: STD_LOGIC_VECTOR(16 downto 0);
	signal w_LED		: std_logic;
	
begin

	UUT : CRONOMETRO 
    Port Map ( 
				  i_CLK 			=> w_CLK,
				  i_RST 			=> w_RST,
				  i_START		=> w_START,
				  i_STOP 		=> w_STOP,
				  i_CLEAR   	=> w_CLEAR,
				  o_CONTADOR	=> w_CONTADOR,
				  o_LED			=> w_LED
	 );
	 
	 --
	 -- PROCESSO DE RELÓGICO.
	 --
	 PROCESS
	 BEGIN
		w_CLK <= '0';
		WAIT FOR 10 NS;
		w_CLK <= '1';
		WAIT FOR 10 NS;
	 END PROCESS;
	 
	 --
	 -- CIRCUITO DE RESET.
	 --
	 PROCESS
	 BEGIN
		w_RST <= '1';
		WAIT FOR 100 NS;
		w_RST <= '0';
		WAIT;
	 END PROCESS;
	 
	 --
	 -- TESTE DO CRONOMETRO.
	 --
	 PROCESS
	 BEGIN
		w_START <= '0';
		w_STOP <= '0';
		w_CLEAR <= '0';
		WAIT FOR 150 NS;
		
		w_START <= '1';
		WAIT;
		
	 END PROCESS;
		
	 
	
end Behavioral;
