-- Used Libraries
--***********************************************************

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.all;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
--************************************************************
--        ENTITY Declaration
--************************************************************
ENTITY DIVISEUR_FREQ IS 
GENERIC(H: INTEGER:= 1000000);
PORT(
    clk: IN STD_LOGIC;
    rst: IN STD_LOGIC;
     E0, E1, E2, E3: OUT STD_LOGIC);
END DIVISEUR_FREQ;

--*************************************************************
--      ARCHITECTURE Declararation
--*************************************************************

ARCHITECTURE rtl OF DIVISEUR_FREQ IS
    COMPONENT HORLOG IS
		GENERIC(H: INTEGER:=1000000);
        PORT(
        clk: IN std_logic;
        rst: IN std_logic;
        E0: OUT std_logic);
    END COMPONENT;
	    COMPONENT DIV_FREQ1 IS
		GENERIC(H: INTEGER:=100000);
        PORT(
        clk: IN std_logic;
        rst: IN std_logic;
        E1: OUT std_logic);
    END COMPONENT;
	    COMPONENT DIV_FREQ2 IS
		GENERIC(H: INTEGER:=10000);
        PORT(
        clk: IN std_logic;
        rst: IN std_logic;
        E2: OUT std_logic);
    END COMPONENT;
	    COMPONENT DIV_FREQ3 IS
		GENERIC(H: INTEGER:=1000);
        PORT(
        clk: IN std_logic;
        rst: IN std_logic;
        E3: OUT std_logic);
    END COMPONENT;
    BEGIN
			h1: HORLOG
			  GENERIC MAP(H=>1000000)
			  PORT MAP(
			    clk => clk,
			    rst => rst,
			    E0 => E0);
			    
			 h2: DIV_FREQ1
			  GENERIC MAP(H=>100000)
			  PORT MAP(
			    clk => clk,
			    rst => rst,
			    E1 => E1);
			    
			  h3: DIV_FREQ2
			  GENERIC MAP(H=>10000)
			  PORT MAP(
			    clk => clk,
			    rst => rst,
			    E2 => E2);
			   
			   h4: DIV_FREQ3
			  GENERIC MAP(H =>1000)
			  PORT MAP(
			    clk => clk,
			    rst => rst,
			    E3 => E3);
END rtl;