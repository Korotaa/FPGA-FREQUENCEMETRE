-- Quartus II VHDL Template
-- Unsigned Multiply
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--*********************************
entity MUX2 is
	port 
	(
		ma, auto : in std_logic_vector(1 downto 0);
		ma_au    : in std_logic;
		SEL      : out std_logic_vector(1 downto 0)
	);
end entity MUX2;
---***********************************
architecture rtl of MUX2 is
begin
	with ma_au select
	SEL <= auto when '0',
	       ma  when others;
end rtl;
