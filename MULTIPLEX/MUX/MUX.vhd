-- Quartus II VHDL Template
-- Unsigned Multiply
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--**********************************************************
entity MUX is
	port 
	(
		E0, E1, E2, E3 : in  std_logic;
		SEL            : in std_logic_vector(1 downto 0);
		MUX            : out std_logic
	);
end entity MUX;
--******************************************************
architecture rtl of MUX is
begin
	with SEL select
	 MUX <= E0 when "00",
	       E1 when "01",
		    E2 when "10",
		    E3 when others;
end rtl;
