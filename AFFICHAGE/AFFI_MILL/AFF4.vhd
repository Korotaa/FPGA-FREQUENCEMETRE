-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--***********************************************
entity AFF4 is
	port
	(
		 B3 : in std_logic_vector(3 downto 0);
		 S3 : out std_logic_vector(6 downto 0)
	);
end entity AFF4;
--****************************************************
architecture rtl of AFF4 is
	component AFFI1 is
	port(
	B0 : IN std_logic_vector(3 downto 0);
	S0 : OUT std_logic_vector(6 downto 0)
	    );
	end component;
	begin
	AFF4_inst : AFFI1
	port map(
	B0 => B3,
	S0 => S3 );
end rtl;
