-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--********************************************
entity AFF2 is
	port
	(
		 B1 : in std_logic_vector(3 downto 0);
		 S1 : out std_logic_vector(6 downto 0)
	);
end entity AFF2;
--**********************************************
architecture rtl of AFF2 is
	component AFFI1 is
	port(
	B0 : IN std_logic_vector(3 downto 0);
	S0 : OUT std_logic_vector(6 downto 0)
	    );
	end component;
	begin
	AFF2_inst : AFFI1
	port map(
	B0 => B1,
	S0 => S1 );
end rtl;
