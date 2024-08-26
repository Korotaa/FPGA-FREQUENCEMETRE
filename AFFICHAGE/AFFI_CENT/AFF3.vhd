-- Quartus II VHDL Template
-- Binary Counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--****************************************
entity AFF3 is
	port
	(
		B2 : in std_logic_vector(3 downto 0);
		S2 : out std_logic_vector(6 downto 0)
	);
end entity AFF3;
--************************************************
architecture rtl of AFF3 is
	component AFFI1 is
	port(
	B0 : IN std_logic_vector(3 downto 0);
	S0 :OUT std_logic_vector(6 downto 0)
	    );
	end component;
	begin
	AFF3_inst : AFFI1
	port map(
	B0 => B2,
	S0 => S2 );
end rtl;
