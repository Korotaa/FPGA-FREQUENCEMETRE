-- Quartus II VHDL Template
-- Unsigned Multiply-Accumulate

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--******************************************************
entity AFFI1 is
	port 
	(
		B0    : in std_logic_vector(3 downto 0);
		S0    : out std_logic_vector(6 downto 0)
	);
end AFFI1;
--************************************************
architecture rtl of AFFI1 is
begin
  WITH B0 SELECT
	S0 <= "1111001" when "0001",
		   "0100100" when "0010",
		   "0110000" when "0011",
		   "0011001" when "0100",
		   "0010010" when "0101",
		   "0000010" when "0110",
		   "1111000" when "0111",
		   "0000000" when "1000",
		   "0010000" when "1001",
		   "1000000" when others;
end rtl;
