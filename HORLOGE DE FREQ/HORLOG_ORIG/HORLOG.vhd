--***********************************************************
-- Used Libraries
--***********************************************************

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.all;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
--*************************************************************
--        ENTITY Declaration
--*************************************************************

ENTITY HORLOG IS 
GENERIC(H: INTEGER:=1000000);
PORT(
clk: IN std_logic;
rst: IN std_logic;
E0: OUT std_logic);
END HORLOG;
ARCHITECTURE rtl OF HORLOG IS 
  SIGNAL count : INTEGER range 0 to H;
  
  BEGIN
   PROCESS (rst, clk)
   BEGIN
   IF (rst = '1') THEN
      count <= 0;
   ELSIF(clk'event AND clk = '1') THEN
   IF(count = H) THEN
      count <= 0;
      ELSE
      count <= count + 1;
   END IF;
   END IF;
   END PROCESS;
--******************************************
PROCESS (rst, clk)
BEGIN
   IF (rst = '1') THEN
      E0 <= '0';
   ELSIF(clk'event AND clk = '1') THEN
   IF( count <= H/2) THEN
      E0 <= '1';
      ELSE
      E0 <= '0';
   END IF;
   END IF;
END PROCESS;
END rtl;
