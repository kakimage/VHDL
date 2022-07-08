--*************************************************************************************
--
-- Module   :  PAR2SER
-- Inputs   :
--			      i_CLK			--> Global system clock.
--			      i_RST 		--> Assynchronous reset for the FPGA.
--			      i_DATA    	--> Eight bits word to be serialized.
--					i_LOAD		--> Pulse to load the serializer with an 8 bit word.
--					i_ND			--> Pulse informing the serializer to send a new bit into 
--                             the serial uart (TX).
-- Outputs:
--         		o_TX     	--> Serialized data.
--
--*************************************************************************************


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity PAR2SER is port
	(
		i_RST 	  	: in std_logic;
		i_CLK 		: in std_logic;
		--
  	 	i_LOAD    	: in std_logic;
      i_ND  	 	: in std_logic;
		i_DATA		: in std_logic_vector(7 downto 0);
		o_TX    		: out std_logic
	);
end PAR2SER;

architecture Behavioral of PAR2SER is
----------------------------------------------------------------------------------------------
-- Internal signals.
----------------------------------------------------------------------------------------------
    signal w_DATA : std_logic_vector (i_DATA'range);
    signal w_ND   : std_logic;

----------------------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------------------
-- Serializer (MSB first).
----------------------------------------------------------------------------------------------
	U1 : process (i_CLK, i_RST)        						    		
	begin										         	         		    			
	   if(i_RST = '1') then 							          	         		 
			w_ND <= '0';		
			
	   elsif falling_edge(i_CLK) then             					    	
   	   if(i_ND = '1') then 					         	    		   
			   o_TX <= w_DATA(7);						       	   	         	
      	   w_ND <= '1';					             				      	
			else							              	         					
      	   w_ND <= '0';			    			      		         		
	      end if; 				             							         	
		end if;		
		
	end process U1;		   
	
   --
	-- Loading (or Shifting) the data into the serializer.
	--
	U2 : process (i_CLK)   	
	begin					
	
	   if rising_edge(i_CLK) then  		         					   
			if(i_LOAD = '1') then 					         				   	   
   	       w_DATA <= i_DATA;			      			              			
				 
   	   elsif(w_ND = '1') then 					      		      			
      	    w_DATA <= w_DATA(6 downto 0) & '0';   			            	
	      end if; 						                  							
      end if;						
		
	end process U2;			               								
                                                                      
----------------------------------------------------------------------------------------------
end Behavioral;
