library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity TB_SINC_UART is
end TB_SINC_UART;

architecture Behavioral of TB_SINC_UART is

	component SINC_UART is port
		(
			i_RST   			: in std_logic;
			i_CLK 			: in std_logic;
			i_CLK_UART 		: in std_logic;
			o_EDGE_UP		: out std_logic;
			o_EDGE_DOWN		: out std_logic
		);
	end component;
	
	signal w_RST 			: STD_LOGIC;
	signal w_CLK 			: STD_LOGIC;
	signal w_CLK_UART 	: STD_LOGIC;
	signal w_EDGE_UP 		: STD_LOGIC;
	signal w_EDGE_DOWN 	: STD_LOGIC;
	
begin
	UUT: SINC_UART 
	port map
		(
			i_RST   			=> w_RST,
			i_CLK 			=> w_CLK,
			i_CLK_UART 		=> w_CLK_UART,
			o_EDGE_UP		=> w_EDGE_UP,
			o_EDGE_DOWN		=> w_EDGE_DOWN
		);
		
	PROCESS
	BEGIN	
		w_RST <= '1';
		WAIT FOR 40 NS;
		w_RST <= '0';
		WAIT;
	END PROCESS;
	
	PROCESS
	BEGIN
		w_CLK <= '1';
		WAIT FOR 10 NS;
		w_CLK <= '0';
		WAIT FOR 10 NS;
	END PROCESS;
	
	PROCESS
	BEGIN
		w_CLK_UART <= '1';
		WAIT FOR 90 NS;
		w_CLK_UART <= '0';
		WAIT FOR 90 NS;
	END PROCESS;
	
end Behavioral;
