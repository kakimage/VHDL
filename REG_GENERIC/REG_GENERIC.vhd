library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity REG_GENERIC is
	 Generic (
					N		: integer := 16
	 );
    Port ( 
				i_RST		: in STD_LOGIC;
				i_CLK		: in STD_LOGIC;
				
				i_LOAD	: in STD_LOGIC;
				i_DATA	: in STD_LOGIC_VECTOR((n-1) DOWNTO 0);
				o_DATA	: out STD_LOGIC_VECTOR((n-1) DOWNTO 0)
	 );
end REG_GENERIC;




architecture Behavioral of REG_GENERIC is

	component REGISTRADOR is
		 Generic (
						n		: integer := 16
		 );
		 Port ( 
					i_RST		: in STD_LOGIC;
					i_CLK		: in STD_LOGIC;
					
					i_LOAD	: in STD_LOGIC;
					i_DATA	: in STD_LOGIC_VECTOR((n-1) DOWNTO 0);
					o_DATA	: out STD_LOGIC_VECTOR((n-1) DOWNTO 0)
		 );
	end component;

begin


		U01 : REGISTRADOR 
		 Generic Map(
						n			=>  8
		 )
		 Port Map ( 
						i_RST		=> i_RST,
						i_CLK		=> I_CLK,
						
						i_LOAD	=> i_LOAD,
						i_DATA	=> i_DATA(15 downto 8),
						o_DATA	=> o_DATA(15 downto 8)
		 );
		 
	U02 : REGISTRADOR 
		 Generic Map(
						n			=>  8
		 )
		 Port Map ( 
						i_RST		=> i_RST,
						i_CLK		=> I_CLK,
						
						i_LOAD	=> i_LOAD,
						i_DATA	=> i_DATA(7 downto 0),
						o_DATA	=> o_DATA(7 downto 0)
		 );	 
	
end Behavioral;
