--*************************************************************************************
--
-- Module   :  SER2PAR
-- Inputs   :
--			      i_CLK			--> Global system clock.
--			      i_RST 		--> Assynchronous reset for the FPGA.
--					i_ND			--> Pulse informing the serializer to receive a new bit into 
--                             the serial uart (RX).
-- 				i_RX			--> Serial data received (uart interface).
-- Outputs:
--			      o_DATA    	--> Eight bits word received in the serializer.
--
--*************************************************************************************


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity SER2PAR is port
	(
		i_RST 	  	: in std_logic;
		i_CLK 		: in std_logic;
		--
      i_ND  	 	: in std_logic;
		o_DATA		: out std_logic_vector(7 downto 0);
		i_RX    		: in std_logic
	);
end SER2PAR;

architecture Behavioral of SER2PAR is
----------------------------------------------------------------------------------------------
-- Internal signals.
----------------------------------------------------------------------------------------------
    signal w_DATA : std_logic_vector (o_DATA'range);


----------------------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------------------

	U1 : process (i_RST, i_CLK)	   			
	begin								
		if (i_RST = '1') then
			w_DATA <= (others => '1');
			
		else
			if rising_edge (i_CLK) then  								  
   	       if(i_ND = '1') then 				      				
      	       w_DATA <= w_DATA(6 downto 0) & i_RX;  
				 end if;
	      end if; 						         				   		
   	end if;			
		
	end process U1;						         	   		

   o_DATA <= w_DATA;					               								
                                                                      
----------------------------------------------------------------------------------------------
end Behavioral;
