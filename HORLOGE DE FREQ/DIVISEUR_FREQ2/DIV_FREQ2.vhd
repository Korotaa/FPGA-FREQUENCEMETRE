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
ENTITY DIV_FREQ2 IS 
GENERIC (H: INTEGER:=10000);
PORT(
    clk: IN STD_LOGIC;
    rst: IN STD_LOGIC;
    E2: OUT STD_LOGIC);
END DIV_FREQ2;

--*************************************************************
--      ARCHITECTURE Declararation
--*************************************************************

ARCHITECTURE rtl OF DIV_FREQ2 IS
    
    COMPONENT HORLOG IS
		GENERIC(H: INTEGER:=1000000);
        PORT(
        clk: IN std_logic;
        rst: IN std_logic;
        E0: OUT std_logic);
    END COMPONENT;
    BEGIN
      h1: HORLOG
         GENERIC MAP(H => 10000)
         PORT MAP(
         clk => clk,
         rst => rst,
         E0 => E2);
END rtl;