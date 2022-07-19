-- megafunction wizard: %ALTMEMMULT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altmemmult 

-- ============================================================
-- File Name: MULTIPLEX.vhd
-- Megafunction Name(s):
-- 			altmemmult
--
-- Simulation Library Files(s):
-- 			altera_mf;fiftyfivenm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 21.1.0 Build 842 10/21/2021 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2021  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


--altmemmult CBX_AUTO_BLACKBOX="ALL" COEFF_REPRESENTATION="SIGNED" COEFFICIENT0="2" DATA_REPRESENTATION="SIGNED" DEVICE_FAMILY="MAX 10" MAX_CLOCK_CYCLES_PER_RESULT=2 RAM_BLOCK_TYPE="AUTO" TOTAL_LATENCY=5 WIDTH_C=2 WIDTH_D=16 WIDTH_R=18 clock data_in result result_valid sload_data
--VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_altera_syncram_nd_impl 2021:10:21:11:03:22:SJ cbx_altmemmult 2021:10:21:11:03:22:SJ cbx_altsyncram 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_lpm_compare 2021:10:21:11:03:21:SJ cbx_lpm_counter 2021:10:21:11:03:21:SJ cbx_lpm_decode 2021:10:21:11:03:21:SJ cbx_lpm_mux 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_stratixiii 2021:10:21:11:03:22:SJ cbx_stratixv 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END


--alt_abs CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="MAX 10" LPM_WIDTH=8 abs clock data result sign_bit sload sload_data
--VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_altera_syncram_nd_impl 2021:10:21:11:03:22:SJ cbx_altmemmult 2021:10:21:11:03:22:SJ cbx_altsyncram 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_lpm_compare 2021:10:21:11:03:21:SJ cbx_lpm_counter 2021:10:21:11:03:21:SJ cbx_lpm_decode 2021:10:21:11:03:21:SJ cbx_lpm_mux 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_stratixiii 2021:10:21:11:03:22:SJ cbx_stratixv 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END

 LIBRARY fiftyfivenm;
 USE fiftyfivenm.all;

--synthesis_resources = lut 8 reg 9 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  MULTIPLEX_abs_9ca IS 
	 PORT 
	 ( 
		 a_abs	:	IN  STD_LOGIC;
		 clock	:	IN  STD_LOGIC;
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 sign_bit	:	IN  STD_LOGIC := '0';
		 sload	:	IN  STD_LOGIC := '0';
		 sload_data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0)
	 ); 
 END MULTIPLEX_abs_9ca;

 ARCHITECTURE RTL OF MULTIPLEX_abs_9ca IS

	 SIGNAL  wire_abs_cella_combout	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_abs_cella_0cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_1cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_2cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_3cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_4cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_5cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_6cout	:	STD_LOGIC;
	 SIGNAL  wire_abs_cella_dataa	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_abs_cella_datad	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL	 dffe8a	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 inv_reg	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 COMPONENT  fiftyfivenm_lcell_comb
	 GENERIC 
	 (
		DONT_TOUCH	:	STRING := "off";
		LUT_MASK	:	STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
		SUM_LUTC_INPUT	:	STRING := "datac";
		lpm_type	:	STRING := "fiftyfivenm_lcell_comb"
	 );
	 PORT
	 ( 
		cin	:	IN STD_LOGIC := '0';
		combout	:	OUT STD_LOGIC;
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC := '0';
		datab	:	IN STD_LOGIC := '0';
		datac	:	IN STD_LOGIC := '0';
		datad	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
 BEGIN

	result <= dffe8a;
	wire_abs_cella_dataa <= data;
	wire_abs_cella_datad <= (OTHERS => '1');
	abs_cella_0 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1010101010101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		combout => wire_abs_cella_combout(0),
		cout => wire_abs_cella_0cout,
		dataa => wire_abs_cella_dataa(0),
		datab => inv_reg,
		datad => wire_abs_cella_datad(0)
	  );
	abs_cella_1 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_0cout,
		combout => wire_abs_cella_combout(1),
		cout => wire_abs_cella_1cout,
		dataa => wire_abs_cella_dataa(1),
		datab => inv_reg,
		datad => wire_abs_cella_datad(1)
	  );
	abs_cella_2 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_1cout,
		combout => wire_abs_cella_combout(2),
		cout => wire_abs_cella_2cout,
		dataa => wire_abs_cella_dataa(2),
		datab => inv_reg,
		datad => wire_abs_cella_datad(2)
	  );
	abs_cella_3 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_2cout,
		combout => wire_abs_cella_combout(3),
		cout => wire_abs_cella_3cout,
		dataa => wire_abs_cella_dataa(3),
		datab => inv_reg,
		datad => wire_abs_cella_datad(3)
	  );
	abs_cella_4 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_3cout,
		combout => wire_abs_cella_combout(4),
		cout => wire_abs_cella_4cout,
		dataa => wire_abs_cella_dataa(4),
		datab => inv_reg,
		datad => wire_abs_cella_datad(4)
	  );
	abs_cella_5 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_4cout,
		combout => wire_abs_cella_combout(5),
		cout => wire_abs_cella_5cout,
		dataa => wire_abs_cella_dataa(5),
		datab => inv_reg,
		datad => wire_abs_cella_datad(5)
	  );
	abs_cella_6 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_5cout,
		combout => wire_abs_cella_combout(6),
		cout => wire_abs_cella_6cout,
		dataa => wire_abs_cella_dataa(6),
		datab => inv_reg,
		datad => wire_abs_cella_datad(6)
	  );
	abs_cella_7 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "0110101011101010",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_abs_cella_6cout,
		combout => wire_abs_cella_combout(7),
		dataa => wire_abs_cella_dataa(7),
		datab => inv_reg,
		datad => wire_abs_cella_datad(7)
	  );
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN dffe8a <= sload_data;
				ELSE dffe8a <= wire_abs_cella_combout;
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN inv_reg <= (a_abs AND sign_bit);
		END IF;
	END PROCESS;

 END RTL; --MULTIPLEX_abs_9ca


--altaccumulate CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="MAX 10" LPM_REPRESENTATION="SIGNED" RIGHT_SHIFT_DISTANCE=8 WIDTH_IN=10 WIDTH_OUT=11 add_sub clock data result sload
--VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ  VERSION_END

 LIBRARY fiftyfivenm;
 USE fiftyfivenm.all;

--synthesis_resources = lut 11 reg 11 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  MULTIPLEX_accum_mff IS 
	 PORT 
	 ( 
		 add_sub	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC;
		 data	:	IN  STD_LOGIC_VECTOR (9 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (10 DOWNTO 0);
		 sload	:	IN  STD_LOGIC := '0'
	 ); 
 END MULTIPLEX_accum_mff;

 ARCHITECTURE RTL OF MULTIPLEX_accum_mff IS

	 SIGNAL  wire_acc_cella_0cin	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_combout	:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 SIGNAL  wire_acc_cella_0cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_1cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_2cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_3cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_4cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_5cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_6cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_7cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_8cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_9cout	:	STD_LOGIC;
	 SIGNAL  wire_acc_cella_datab	:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 SIGNAL  wire_acc_cella_datad	:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 SIGNAL	 wire_acc_ffa_asdata	:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 SIGNAL	 acc_ffa	:	STD_LOGIC_VECTOR(10 DOWNTO 0)
	 -- synopsys translate_off
	  := "00000000000"
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_accum6_w_lg_add_sub52w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_accum6_w_lg_data_wire53w	:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 SIGNAL  data_wire :	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 COMPONENT  fiftyfivenm_lcell_comb
	 GENERIC 
	 (
		DONT_TOUCH	:	STRING := "off";
		LUT_MASK	:	STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
		SUM_LUTC_INPUT	:	STRING := "datac";
		lpm_type	:	STRING := "fiftyfivenm_lcell_comb"
	 );
	 PORT
	 ( 
		cin	:	IN STD_LOGIC := '0';
		combout	:	OUT STD_LOGIC;
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC := '0';
		datab	:	IN STD_LOGIC := '0';
		datac	:	IN STD_LOGIC := '0';
		datad	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
 BEGIN

	wire_accum6_w_lg_add_sub52w(0) <= NOT add_sub;
	loop0 : FOR i IN 0 TO 10 GENERATE 
		wire_accum6_w_lg_data_wire53w(i) <= data_wire(i) XOR wire_accum6_w_lg_add_sub52w(0);
	END GENERATE loop0;
	data_wire <= ( data(9) & data);
	result <= acc_ffa;
	wire_acc_cella_datab <= wire_accum6_w_lg_data_wire53w;
	wire_acc_cella_datad <= (OTHERS => '1');
	wire_acc_cella_0cin <= wire_accum6_w_lg_add_sub52w(0);
	acc_cella_0 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_0cin,
		combout => wire_acc_cella_combout(0),
		cout => wire_acc_cella_0cout,
		dataa => acc_ffa(8),
		datab => wire_acc_cella_datab(0),
		datad => wire_acc_cella_datad(0)
	  );
	acc_cella_1 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_0cout,
		combout => wire_acc_cella_combout(1),
		cout => wire_acc_cella_1cout,
		dataa => acc_ffa(9),
		datab => wire_acc_cella_datab(1),
		datad => wire_acc_cella_datad(1)
	  );
	acc_cella_2 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_1cout,
		combout => wire_acc_cella_combout(2),
		cout => wire_acc_cella_2cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(2),
		datad => wire_acc_cella_datad(2)
	  );
	acc_cella_3 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_2cout,
		combout => wire_acc_cella_combout(3),
		cout => wire_acc_cella_3cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(3),
		datad => wire_acc_cella_datad(3)
	  );
	acc_cella_4 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_3cout,
		combout => wire_acc_cella_combout(4),
		cout => wire_acc_cella_4cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(4),
		datad => wire_acc_cella_datad(4)
	  );
	acc_cella_5 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_4cout,
		combout => wire_acc_cella_combout(5),
		cout => wire_acc_cella_5cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(5),
		datad => wire_acc_cella_datad(5)
	  );
	acc_cella_6 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_5cout,
		combout => wire_acc_cella_combout(6),
		cout => wire_acc_cella_6cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(6),
		datad => wire_acc_cella_datad(6)
	  );
	acc_cella_7 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_6cout,
		combout => wire_acc_cella_combout(7),
		cout => wire_acc_cella_7cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(7),
		datad => wire_acc_cella_datad(7)
	  );
	acc_cella_8 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_7cout,
		combout => wire_acc_cella_combout(8),
		cout => wire_acc_cella_8cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(8),
		datad => wire_acc_cella_datad(8)
	  );
	acc_cella_9 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_8cout,
		combout => wire_acc_cella_combout(9),
		cout => wire_acc_cella_9cout,
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(9),
		datad => wire_acc_cella_datad(9)
	  );
	acc_cella_10 :  fiftyfivenm_lcell_comb
	  GENERIC MAP (
		LUT_MASK => "1001011011101000",
		SUM_LUTC_INPUT => "cin"
	  )
	  PORT MAP ( 
		cin => wire_acc_cella_9cout,
		combout => wire_acc_cella_combout(10),
		dataa => acc_ffa(10),
		datab => wire_acc_cella_datab(10),
		datad => wire_acc_cella_datad(10)
	  );
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(0) <= wire_acc_ffa_asdata(0);
				ELSE acc_ffa(0) <= wire_acc_cella_combout(0);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(1) <= wire_acc_ffa_asdata(1);
				ELSE acc_ffa(1) <= wire_acc_cella_combout(1);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(2) <= wire_acc_ffa_asdata(2);
				ELSE acc_ffa(2) <= wire_acc_cella_combout(2);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(3) <= wire_acc_ffa_asdata(3);
				ELSE acc_ffa(3) <= wire_acc_cella_combout(3);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(4) <= wire_acc_ffa_asdata(4);
				ELSE acc_ffa(4) <= wire_acc_cella_combout(4);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(5) <= wire_acc_ffa_asdata(5);
				ELSE acc_ffa(5) <= wire_acc_cella_combout(5);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(6) <= wire_acc_ffa_asdata(6);
				ELSE acc_ffa(6) <= wire_acc_cella_combout(6);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(7) <= wire_acc_ffa_asdata(7);
				ELSE acc_ffa(7) <= wire_acc_cella_combout(7);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(8) <= wire_acc_ffa_asdata(8);
				ELSE acc_ffa(8) <= wire_acc_cella_combout(8);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(9) <= wire_acc_ffa_asdata(9);
				ELSE acc_ffa(9) <= wire_acc_cella_combout(9);
				END IF;
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN 
				IF (sload = '1') THEN acc_ffa(10) <= wire_acc_ffa_asdata(10);
				ELSE acc_ffa(10) <= wire_acc_cella_combout(10);
				END IF;
		END IF;
	END PROCESS;
	wire_acc_ffa_asdata <= ( data(9) & data);

 END RTL; --MULTIPLEX_accum_mff


--altshiftreg CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="RIGHT" LPM_WIDTH=8 SHIFT_DISTANCE=8 clock data load shiftout
--VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_altera_syncram_nd_impl 2021:10:21:11:03:22:SJ cbx_altmemmult 2021:10:21:11:03:22:SJ cbx_altsyncram 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_lpm_compare 2021:10:21:11:03:21:SJ cbx_lpm_counter 2021:10:21:11:03:21:SJ cbx_lpm_decode 2021:10:21:11:03:21:SJ cbx_lpm_mux 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_stratixiii 2021:10:21:11:03:22:SJ cbx_stratixv 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END

--synthesis_resources = reg 8 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  MULTIPLEX_altshiftreg_fca IS 
	 PORT 
	 ( 
		 clock	:	IN  STD_LOGIC;
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 load	:	IN  STD_LOGIC := '0';
		 q	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 shiftout	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0)
	 ); 
 END MULTIPLEX_altshiftreg_fca;

 ARCHITECTURE RTL OF MULTIPLEX_altshiftreg_fca IS

	 SIGNAL	 dffe9a	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_altshiftreg1_w_lg_w_lg_load55w56w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_w_lg_w_lg_sclr59w60w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_w_lg_load54w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_w_lg_load55w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_w_lg_sclr59w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_w_lg_w_lg_w_lg_load55w56w57w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_w_lg_sset58w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  sclr	:	STD_LOGIC;
	 SIGNAL  shift_node :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  shiftin_wire :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  sset	:	STD_LOGIC;
 BEGIN

	loop1 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg1_w_lg_w_lg_load55w56w(i) <= wire_altshiftreg1_w_lg_load55w(0) AND shift_node(i);
	END GENERATE loop1;
	loop2 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg1_w_lg_w_lg_sclr59w60w(i) <= wire_altshiftreg1_w_lg_sclr59w(0) AND wire_altshiftreg1_w_lg_sset58w(i);
	END GENERATE loop2;
	loop3 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg1_w_lg_load54w(i) <= load AND data(i);
	END GENERATE loop3;
	wire_altshiftreg1_w_lg_load55w(0) <= NOT load;
	wire_altshiftreg1_w_lg_sclr59w(0) <= NOT sclr;
	loop4 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg1_w_lg_w_lg_w_lg_load55w56w57w(i) <= wire_altshiftreg1_w_lg_w_lg_load55w56w(i) OR wire_altshiftreg1_w_lg_load54w(i);
	END GENERATE loop4;
	loop5 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg1_w_lg_sset58w(i) <= sset OR wire_altshiftreg1_w_lg_w_lg_w_lg_load55w56w57w(i);
	END GENERATE loop5;
	q <= dffe9a;
	sclr <= '0';
	shift_node <= shiftin_wire;
	shiftin_wire <= (OTHERS => '0');
	shiftout <= dffe9a(7 DOWNTO 0);
	sset <= '0';
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe9a <= wire_altshiftreg1_w_lg_w_lg_sclr59w60w;
		END IF;
	END PROCESS;

 END RTL; --MULTIPLEX_altshiftreg_fca


--altshiftreg CBX_AUTO_BLACKBOX="ALL" LPM_DIRECTION="RIGHT" LPM_WIDTH=8 SHIFT_DISTANCE=8 clock q shiftin
--VERSION_BEGIN 21.1 cbx_altaccumulate 2021:10:21:11:03:22:SJ cbx_altera_syncram_nd_impl 2021:10:21:11:03:22:SJ cbx_altmemmult 2021:10:21:11:03:22:SJ cbx_altsyncram 2021:10:21:11:03:22:SJ cbx_cycloneii 2021:10:21:11:03:22:SJ cbx_lpm_add_sub 2021:10:21:11:03:22:SJ cbx_lpm_compare 2021:10:21:11:03:21:SJ cbx_lpm_counter 2021:10:21:11:03:21:SJ cbx_lpm_decode 2021:10:21:11:03:21:SJ cbx_lpm_mux 2021:10:21:11:03:22:SJ cbx_mgl 2021:10:21:11:03:46:SJ cbx_nadder 2021:10:21:11:03:22:SJ cbx_stratix 2021:10:21:11:03:22:SJ cbx_stratixii 2021:10:21:11:03:22:SJ cbx_stratixiii 2021:10:21:11:03:22:SJ cbx_stratixv 2021:10:21:11:03:22:SJ cbx_util_mgl 2021:10:21:11:03:22:SJ  VERSION_END

--synthesis_resources = reg 8 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  MULTIPLEX_altshiftreg_5h9 IS 
	 PORT 
	 ( 
		 clock	:	IN  STD_LOGIC;
		 q	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 shiftin	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '1');
		 shiftout	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0)
	 ); 
 END MULTIPLEX_altshiftreg_5h9;

 ARCHITECTURE RTL OF MULTIPLEX_altshiftreg_5h9 IS

	 SIGNAL	 dffe10a	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_altshiftreg7_w_lg_w_lg_load63w64w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_w_lg_w_lg_sclr67w68w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_w_lg_load62w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_w_lg_load63w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_w_lg_sclr67w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_w_lg_w_lg_w_lg_load63w64w65w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_w_lg_sset66w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  data	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  load	:	STD_LOGIC;
	 SIGNAL  sclr	:	STD_LOGIC;
	 SIGNAL  shift_node :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  shiftin_wire :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  sset	:	STD_LOGIC;
 BEGIN

	loop6 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg7_w_lg_w_lg_load63w64w(i) <= wire_altshiftreg7_w_lg_load63w(0) AND shift_node(i);
	END GENERATE loop6;
	loop7 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg7_w_lg_w_lg_sclr67w68w(i) <= wire_altshiftreg7_w_lg_sclr67w(0) AND wire_altshiftreg7_w_lg_sset66w(i);
	END GENERATE loop7;
	loop8 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg7_w_lg_load62w(i) <= load AND data(i);
	END GENERATE loop8;
	wire_altshiftreg7_w_lg_load63w(0) <= NOT load;
	wire_altshiftreg7_w_lg_sclr67w(0) <= NOT sclr;
	loop9 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg7_w_lg_w_lg_w_lg_load63w64w65w(i) <= wire_altshiftreg7_w_lg_w_lg_load63w64w(i) OR wire_altshiftreg7_w_lg_load62w(i);
	END GENERATE loop9;
	loop10 : FOR i IN 0 TO 7 GENERATE 
		wire_altshiftreg7_w_lg_sset66w(i) <= sset OR wire_altshiftreg7_w_lg_w_lg_w_lg_load63w64w65w(i);
	END GENERATE loop10;
	data <= (OTHERS => '0');
	load <= '0';
	q <= dffe10a;
	sclr <= '0';
	shift_node <= shiftin_wire;
	shiftin_wire <= shiftin;
	shiftout <= dffe10a(7 DOWNTO 0);
	sset <= '0';
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe10a <= wire_altshiftreg7_w_lg_w_lg_sclr67w68w;
		END IF;
	END PROCESS;

 END RTL; --MULTIPLEX_altshiftreg_5h9

 LIBRARY altera_mf;
 USE altera_mf.all;

--synthesis_resources = altsyncram 1 lut 19 reg 45 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  MULTIPLEX_altmemmult_slp IS 
	 PORT 
	 ( 
		 clock	:	IN  STD_LOGIC;
		 data_in	:	IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (17 DOWNTO 0);
		 result_valid	:	OUT  STD_LOGIC;
		 sload_data	:	IN  STD_LOGIC := '0'
	 ); 
 END MULTIPLEX_altmemmult_slp;

 ARCHITECTURE RTL OF MULTIPLEX_altmemmult_slp IS

	 SIGNAL  wire_abs3_data	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_abs3_result	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_abs3_sign_bit	:	STD_LOGIC;
	 SIGNAL  wire_abs3_sload_data	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_accum6_add_sub	:	STD_LOGIC;
	 SIGNAL  wire_dffe4a_w_lg_w_q_range30w31w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_accum6_data	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_accum6_result	:	STD_LOGIC_VECTOR (10 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_data	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_q	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg1_shiftout	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_q	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altshiftreg7_shiftout	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_altsyncram5_q_a	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL	 dffe2a0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe2a1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe2a2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_dffe2a_w_lg_q9w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 dffe2a3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_dffe2a_w_lg_q10w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 dffe2a4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe4a	:	STD_LOGIC_VECTOR(3 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_w_lg_w_data_in_range17w18w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_sclr4w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  result_wire :	STD_LOGIC_VECTOR (17 DOWNTO 0);
	 SIGNAL  sclr	:	STD_LOGIC;
	 SIGNAL  wire_w_data_in_range17w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  MULTIPLEX_abs_9ca
	 PORT
	 ( 
		a_abs	:	IN  STD_LOGIC;
		clock	:	IN  STD_LOGIC;
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		result	:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		sign_bit	:	IN  STD_LOGIC := '0';
		sload	:	IN  STD_LOGIC := '0';
		sload_data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  MULTIPLEX_accum_mff
	 PORT
	 ( 
		add_sub	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC;
		data	:	IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		result	:	OUT  STD_LOGIC_VECTOR(10 DOWNTO 0);
		sload	:	IN  STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
	 COMPONENT  MULTIPLEX_altshiftreg_fca
	 PORT
	 ( 
		clock	:	IN  STD_LOGIC;
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
		load	:	IN  STD_LOGIC := '0';
		q	:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		shiftout	:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  MULTIPLEX_altshiftreg_5h9
	 PORT
	 ( 
		clock	:	IN  STD_LOGIC;
		q	:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		shiftin	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '1');
		shiftout	:	OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  altsyncram
	 GENERIC 
	 (
		ADDRESS_ACLR_A	:	STRING := "UNUSED";
		ADDRESS_ACLR_B	:	STRING := "NONE";
		ADDRESS_REG_B	:	STRING := "CLOCK1";
		BYTE_SIZE	:	NATURAL := 8;
		BYTEENA_ACLR_A	:	STRING := "UNUSED";
		BYTEENA_ACLR_B	:	STRING := "NONE";
		BYTEENA_REG_B	:	STRING := "CLOCK1";
		CLOCK_ENABLE_CORE_A	:	STRING := "USE_INPUT_CLKEN";
		CLOCK_ENABLE_CORE_B	:	STRING := "USE_INPUT_CLKEN";
		CLOCK_ENABLE_INPUT_A	:	STRING := "NORMAL";
		CLOCK_ENABLE_INPUT_B	:	STRING := "NORMAL";
		CLOCK_ENABLE_OUTPUT_A	:	STRING := "NORMAL";
		CLOCK_ENABLE_OUTPUT_B	:	STRING := "NORMAL";
		ECC_PIPELINE_STAGE_ENABLED	:	STRING := "FALSE";
		ENABLE_ECC	:	STRING := "FALSE";
		IMPLEMENT_IN_LES	:	STRING := "OFF";
		INDATA_ACLR_A	:	STRING := "UNUSED";
		INDATA_ACLR_B	:	STRING := "NONE";
		INDATA_REG_B	:	STRING := "CLOCK1";
		INIT_FILE	:	STRING := "UNUSED";
		INIT_FILE_LAYOUT	:	STRING := "PORT_A";
		MAXIMUM_DEPTH	:	NATURAL := 0;
		NUMWORDS_A	:	NATURAL := 0;
		NUMWORDS_B	:	NATURAL := 0;
		OPERATION_MODE	:	STRING := "BIDIR_DUAL_PORT";
		OUTDATA_ACLR_A	:	STRING := "NONE";
		OUTDATA_ACLR_B	:	STRING := "NONE";
		OUTDATA_REG_A	:	STRING := "UNREGISTERED";
		OUTDATA_REG_B	:	STRING := "UNREGISTERED";
		POWER_UP_UNINITIALIZED	:	STRING := "FALSE";
		RAM_BLOCK_TYPE	:	STRING := "AUTO";
		RDCONTROL_ACLR_B	:	STRING := "NONE";
		RDCONTROL_REG_B	:	STRING := "CLOCK1";
		READ_DURING_WRITE_MODE_MIXED_PORTS	:	STRING := "DONT_CARE";
		read_during_write_mode_port_a	:	STRING := "NEW_DATA_NO_NBE_READ";
		read_during_write_mode_port_b	:	STRING := "NEW_DATA_NO_NBE_READ";
		WIDTH_A	:	NATURAL;
		WIDTH_B	:	NATURAL := 1;
		WIDTH_BYTEENA_A	:	NATURAL := 1;
		WIDTH_BYTEENA_B	:	NATURAL := 1;
		WIDTH_ECCSTATUS	:	NATURAL := 3;
		WIDTHAD_A	:	NATURAL;
		WIDTHAD_B	:	NATURAL := 1;
		WRCONTROL_ACLR_A	:	STRING := "UNUSED";
		WRCONTROL_ACLR_B	:	STRING := "NONE";
		WRCONTROL_WRADDRESS_REG_B	:	STRING := "CLOCK1";
		INTENDED_DEVICE_FAMILY	:	STRING := "MAX 10";
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "altsyncram"
	 );
	 PORT
	 ( 
		aclr0	:	IN STD_LOGIC := '0';
		aclr1	:	IN STD_LOGIC := '0';
		address_a	:	IN STD_LOGIC_VECTOR(WIDTHAD_A-1 DOWNTO 0);
		address_b	:	IN STD_LOGIC_VECTOR(WIDTHAD_B-1 DOWNTO 0) := (OTHERS => '1');
		addressstall_a	:	IN STD_LOGIC := '0';
		addressstall_b	:	IN STD_LOGIC := '0';
		byteena_a	:	IN STD_LOGIC_VECTOR(WIDTH_BYTEENA_A-1 DOWNTO 0) := (OTHERS => '1');
		byteena_b	:	IN STD_LOGIC_VECTOR(WIDTH_BYTEENA_B-1 DOWNTO 0) := (OTHERS => '1');
		clock0	:	IN STD_LOGIC := '1';
		clock1	:	IN STD_LOGIC := '1';
		clocken0	:	IN STD_LOGIC := '1';
		clocken1	:	IN STD_LOGIC := '1';
		clocken2	:	IN STD_LOGIC := '1';
		clocken3	:	IN STD_LOGIC := '1';
		data_a	:	IN STD_LOGIC_VECTOR(WIDTH_A-1 DOWNTO 0) := (OTHERS => '1');
		data_b	:	IN STD_LOGIC_VECTOR(WIDTH_B-1 DOWNTO 0) := (OTHERS => '1');
		eccstatus	:	OUT STD_LOGIC_VECTOR(WIDTH_ECCSTATUS-1 DOWNTO 0);
		q_a	:	OUT STD_LOGIC_VECTOR(WIDTH_A-1 DOWNTO 0);
		q_b	:	OUT STD_LOGIC_VECTOR(WIDTH_B-1 DOWNTO 0);
		rden_a	:	IN STD_LOGIC := '1';
		rden_b	:	IN STD_LOGIC := '1';
		wren_a	:	IN STD_LOGIC := '0';
		wren_b	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
 BEGIN

	wire_w_lg_w_data_in_range17w18w(0) <= wire_w_data_in_range17w(0) AND sload_data;
	wire_w_lg_sclr4w(0) <= NOT sclr;
	result <= ( result_wire(17 DOWNTO 0));
	result_valid <= dffe2a4;
	result_wire <= ( wire_accum6_result(9 DOWNTO 0) & wire_altshiftreg7_q(7 DOWNTO 0));
	sclr <= '0';
	wire_w_data_in_range17w(0) <= data_in(15);
	wire_abs3_data <= ( wire_altshiftreg1_shiftout);
	wire_abs3_sign_bit <= wire_w_lg_w_data_in_range17w18w(0);
	wire_abs3_sload_data <= ( data_in(7 DOWNTO 0));
	abs3 :  MULTIPLEX_abs_9ca
	  PORT MAP ( 
		a_abs => sload_data,
		clock => clock,
		data => wire_abs3_data,
		result => wire_abs3_result,
		sign_bit => wire_abs3_sign_bit,
		sload => sload_data,
		sload_data => wire_abs3_sload_data
	  );
	wire_accum6_add_sub <= wire_dffe4a_w_lg_w_q_range30w31w(0);
	wire_dffe4a_w_lg_w_q_range30w31w(0) <= NOT dffe4a(3);
	wire_accum6_data <= ( wire_altsyncram5_q_a(9 DOWNTO 0));
	accum6 :  MULTIPLEX_accum_mff
	  PORT MAP ( 
		add_sub => wire_accum6_add_sub,
		clock => clock,
		data => wire_accum6_data,
		result => wire_accum6_result,
		sload => dffe2a2
	  );
	wire_altshiftreg1_data <= ( data_in(15 DOWNTO 8));
	altshiftreg1 :  MULTIPLEX_altshiftreg_fca
	  PORT MAP ( 
		clock => clock,
		data => wire_altshiftreg1_data,
		load => sload_data,
		q => wire_altshiftreg1_q,
		shiftout => wire_altshiftreg1_shiftout
	  );
	altshiftreg7 :  MULTIPLEX_altshiftreg_5h9
	  PORT MAP ( 
		clock => clock,
		q => wire_altshiftreg7_q,
		shiftin => wire_accum6_result(7 DOWNTO 0),
		shiftout => wire_altshiftreg7_shiftout
	  );
	altsyncram5 :  altsyncram
	  GENERIC MAP (
		INIT_FILE => "MULTIPLEX.hex",
		OPERATION_MODE => "ROM",
		OUTDATA_REG_A => "CLOCK0",
		RAM_BLOCK_TYPE => "AUTO",
		WIDTH_A => 10,
		WIDTHAD_A => 8,
		INTENDED_DEVICE_FAMILY => "MAX 10"
	  )
	  PORT MAP ( 
		address_a => wire_abs3_result(7 DOWNTO 0),
		clock0 => clock,
		q_a => wire_altsyncram5_q_a
	  );
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe2a0 <= (sload_data AND wire_w_lg_sclr4w(0));
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe2a1 <= (dffe2a0 AND wire_w_lg_sclr4w(0));
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe2a2 <= (dffe2a1 AND wire_w_lg_sclr4w(0));
		END IF;
	END PROCESS;
	wire_dffe2a_w_lg_q9w(0) <= NOT dffe2a2;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe2a3 <= (dffe2a2 AND wire_w_lg_sclr4w(0));
		END IF;
	END PROCESS;
	wire_dffe2a_w_lg_q10w(0) <= dffe2a3 AND wire_dffe2a_w_lg_q9w(0);
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe2a4 <= (wire_dffe2a_w_lg_q10w(0) AND wire_w_lg_sclr4w(0));
		END IF;
	END PROCESS;
	PROCESS (clock)
	BEGIN
		IF (clock = '1' AND clock'event) THEN dffe4a <= ( dffe4a(2 DOWNTO 0) & wire_w_lg_w_data_in_range17w18w);
		END IF;
	END PROCESS;

 END RTL; --MULTIPLEX_altmemmult_slp
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MULTIPLEX IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data_in		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		sload_data		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
		result_valid		: OUT STD_LOGIC 
	);
END MULTIPLEX;


ARCHITECTURE RTL OF multiplex IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (17 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC ;



	COMPONENT MULTIPLEX_altmemmult_slp
	PORT (
			clock	: IN STD_LOGIC ;
			data_in	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			sload_data	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
			result_valid	: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(17 DOWNTO 0);
	result_valid    <= sub_wire1;

	MULTIPLEX_altmemmult_slp_component : MULTIPLEX_altmemmult_slp
	PORT MAP (
		clock => clock,
		data_in => data_in,
		sload_data => sload_data,
		result => sub_wire0,
		result_valid => sub_wire1
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: COEFFICIENT0 STRING "2"
-- Retrieval info: PRIVATE: COEFF_REPRESENTATION_COMBO STRING "SIGNED"
-- Retrieval info: PRIVATE: COUNT_C_COMBO STRING "2"
-- Retrieval info: PRIVATE: COUNT_D_COMBO STRING "16"
-- Retrieval info: PRIVATE: DATA_REPRESENTATION_COMBO STRING "SIGNED"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "MAX 10"
-- Retrieval info: PRIVATE: LOADABLE_COEFF STRING "0"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
-- Retrieval info: PRIVATE: SCLR_CHECK STRING "0"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: CONSTANT: COEFFICIENT0 STRING "2"
-- Retrieval info: CONSTANT: COEFF_REPRESENTATION STRING "SIGNED"
-- Retrieval info: CONSTANT: DATA_REPRESENTATION STRING "SIGNED"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "MAX 10"
-- Retrieval info: CONSTANT: MAX_CLOCK_CYCLES_PER_RESULT NUMERIC "2"
-- Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "AUTO"
-- Retrieval info: CONSTANT: TOTAL_LATENCY NUMERIC "5"
-- Retrieval info: CONSTANT: WIDTH_C NUMERIC "2"
-- Retrieval info: CONSTANT: WIDTH_D NUMERIC "16"
-- Retrieval info: CONSTANT: WIDTH_R NUMERIC "18"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
-- Retrieval info: USED_PORT: data_in 0 0 16 0 INPUT NODEFVAL "data_in[15..0]"
-- Retrieval info: USED_PORT: result 0 0 18 0 OUTPUT NODEFVAL "result[17..0]"
-- Retrieval info: USED_PORT: result_valid 0 0 0 0 OUTPUT NODEFVAL "result_valid"
-- Retrieval info: USED_PORT: sload_data 0 0 0 0 INPUT NODEFVAL "sload_data"
-- Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @data_in 0 0 16 0 data_in 0 0 16 0
-- Retrieval info: CONNECT: @sload_data 0 0 0 0 sload_data 0 0 0 0
-- Retrieval info: CONNECT: result 0 0 18 0 @result 0 0 18 0
-- Retrieval info: CONNECT: result_valid 0 0 0 0 @result_valid 0 0 0 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL MULTIPLEX.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL MULTIPLEX.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL MULTIPLEX.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL MULTIPLEX.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL MULTIPLEX_inst.vhd TRUE
-- Retrieval info: LIB_FILE: altera_mf
-- Retrieval info: LIB_FILE: fiftyfivenm