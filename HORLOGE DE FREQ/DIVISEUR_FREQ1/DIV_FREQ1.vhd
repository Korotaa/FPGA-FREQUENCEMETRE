--***********************************************************
-- Used Libraries
--***********************************************************

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.all;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
--************************************************************
--        ENTITY Declaration
--************************************************************
ENTITY DIV_FREQ1 IS 
GENERIC (H: INTEGER:=100000);
PORT(
    clk: IN STD_LOGIC;
    rst: IN STD_LOGIC;
    E1: OUT STD_LOGIC);
END DIV_FREQ1;

--*************************************************************
--      ARCHITECTURE Declararation
--*************************************************************

ARCHITECTURE rtl OF DIV_FREQ1 IS
    
    COMPONENT HORLOG IS
			GENERIC(H: INTEGER:=1000000);
        PORT(
          clk: IN std_logic;
          rst: IN std_logic;
          E0: OUT std_logic);
    END COMPONENT;
	 BEGIN
	   h1: HORLOG
          GENERIC MAP(H => 100000)
          PORT MAP(
          clk => clk,
          rst => rst,
          E0 => E1);
END rtl;