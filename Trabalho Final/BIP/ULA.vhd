-- VHDL project: VHDL code for 16-bit ULA 
-- Top level VHDL code for 16-bit ULA 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- 16-bit ULA 
entity ULA is
 port (
   ABUS: in std_logic_vector(15 downto 0); -- ABUS data input of the 16-bit ULA
   BBUS: in std_logic_vector(15 downto 0); -- BBUS data input of the 16-bit ULA
   ULActrl: in std_logic_vector(3 downto 0); -- ULActrl control input of the 16-bit ULA 
   ULAOUT: out std_logic_vector(15 downto 0)  -- 16-bit data output of the 16-bit ULA 
   );
end ULA;

architecture Behavioral of ULA is
-- N-bit Adder in Verilog 
component N_bit_adder is
generic (
    N: integer:=32
   );
port( input1: in std_logic_vector(N-1 downto 0);
  input2: in std_logic_vector(N-1 downto 0);
  answer: out std_logic_vector(N-1 downto 0)
 );
end component N_bit_adder;

signal BBUS_not: std_logic_vector(16-1 downto 0);
signal tmp_out1: std_logic_vector(16-1 downto 0);
signal tmp_out2: std_logic_vector(16-1 downto 0);
signal tmp: std_logic_vector(16-1 downto 0);

begin
-- instantiate Verilog N-bit Adder in VHDL code 
u1_N_bit_adder: N_bit_adder generic map ( N => 16) -- ABUS + BBUS
     port map( input1 => ABUS, input2 => BBUS,answer => tmp_out1 ); 
u2_N_bit_adder: N_bit_adder generic map ( N => 16) -- ABUS + (~BBUS)
     port map( input1 => ABUS, input2 => BBUS_not,answer => tmp_out2 ); 
u3_N_bit_adder: N_bit_adder generic map ( N => 16) -- ABUS + (~BBUS) + 1 = ABUS - BBUS
     port map( input1 => tmp_out2, input2 => x"0001",answer => tmp ); 
BBUS_not <= not BBUS;  


-- Other instructions of the 16-bit ULA in VHDL 
process(ULActrl,ABUS,BBUS,tmp_out1,tmp)
begin 
case(ULActrl) is
 when "0000" =>  ULAOUT <= tmp_out1;  -- ADD
 when "0001" =>  ULAOUT <= tmp ;-- SUB 
 when "0010" =>  ULAOUT <= ABUS and BBUS; -- AND
 when "0011" =>  ULAOUT <= ABUS or BBUS; -- OR
 when "0100" =>  ULAOUT <= ABUS xor BBUS; -- XOR
 when "0101" =>  ULAOUT <= not ABUS; -- NOT
 when "0110" =>  ULAOUT <= ABUS; -- MOVE
 when others => ULAOUT <= tmp_out1; 
 end case;
end process;

end Behavioral;