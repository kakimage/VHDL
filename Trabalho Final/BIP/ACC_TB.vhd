library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use iEEE.NUMERIC_STD.ALL;
 
ENTITY tb_accumulator IS
END tb_accumulator;
 
ARCHITECTURE behavior OF tb_accumulator IS
 
 COMPONENT accumulator
 PORT(
	 clk : IN std_logic;
	 reset : IN std_logic;
	 Din : IN std_logic_vector(3 downto 0);
	 Q : OUT std_logic_vector(3 downto 0)
 );
 END COMPONENT;
 
 signal clk : std_logic := '0';
 signal reset : std_logic := '0';
 signal Din : std_logic_vector(3 downto 0) := (others => '0');
 
 signal Q : std_logic_vector(3 downto 0);
 
 constant clk_period : time := 20 ns;
 
BEGIN
 
 uut: accumulator PORT MAP (
	 clk => clk,
	 reset => reset,
	 Din => Din,
	 Q => Q
 );
 
 clk_process : process
 begin
	 clk <= '0';
	 wait for clk_period/2;
	 clk <= '1';
	 wait for clk_period/2;
end process;
	 
 stim_proc: process
 begin
	wait for 100 ns;

	reset <= '1';

	Din <= "0010";

	wait for 100 ns;

	reset <= '0';
	wait;

 end process;
 
END;
