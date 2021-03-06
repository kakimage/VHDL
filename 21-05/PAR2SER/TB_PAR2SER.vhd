library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_PAR2SER is
end TB_PAR2SER;

architecture Behavioral of TB_PAR2SER is

	component PAR2SER is port
	(
		i_RST : in std_logic;
		i_CLK : in std_logic;
		
  	 	i_LOAD : in std_logic;
      i_ND : in std_logic;
		i_DATA : in std_logic_vector(7 downto 0);
		o_TX : out std_logic;
	)
	end component;
	
	signal w_CLK: STD_LOGIC;
	signal w_RST : STD_LOGIC;
	
	signal w_LOAD : STD_LOGIC;
	signal w_ND : STD_LOGIC;
	signal w_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal w_TX : STD_LOGIC;

	begin
		UUT : PAR2SER
		port map
		(
			i_RST 	  	=> w_RST,
			i_CLK 		=> w_CLK,
			
			i_LOAD    	=> w_LOAD,
			i_ND  	 	=> w_ND,
			i_DATA		=> w_DATA,
			o_TX    		=> w_TX,
		);

		PROCESS
		BEGIN
			w_CLK <= '1';
			WAIT FOR 10 NS;
			w_CLK <= '0';
			WAIT FOR 10 NS;
		END PROCESS;
			
		PROCESS
		BEGIN
			w_RST <= '1';
			WAIT FOR 40 NS;
			w_RST <= '0';
			WAIT;
		END PROCESS;

		PROCESS
		BEGIN
			w_LOAD <= '0';
			w_ND <= '0';
			W_DATA <= (OTHERS => '0');
			
			WAIT FOR 50 NS;
			w_DATA <= x"55";
			
			w_LOAD <= '1';
			WAIT FOR 20 NS;
			w_LOAD <= '0';
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			w_ND <= '1';
			WAIT FOR 20 NS;
			w_ND <= '0';
			WAIT FOR 50 NS;
			
			WAIT;
		END PROCESS;
		
		
end Behavioral;