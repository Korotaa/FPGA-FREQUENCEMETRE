-- Quartus II VHDL Template
-- Basic Shift Register
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity memoire_unit is
	port 
	(
	latch: in std_logic;
	clk_m: in std_logic;
	unite: in std_logic_vector(3 downto 0);
	B0   : out std_logic_vector(3 downto 0)
	);
end entity memoire_unit;
--*********************************************
architecture rtl of memoire_unit is
begin
	process (latch,clk_m)
	begin
		if (clk_m' event and clk_m = '1') then
		    IF latch='1' THEN
		      B0 <=unite;
		      ELSE
		       B0 <= "0000";
		      END IF;
		  end if;
	end process;
end rtl;
