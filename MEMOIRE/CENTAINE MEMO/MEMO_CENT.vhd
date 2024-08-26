-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEMO_CENT is
port(
centaine: in std_logic_vector(3 downto 0);
latch2  : in std_logic;
B2     : out std_logic_vector(3 downto 0);
clk_m: IN std_logic
	 );
end entity MEMO_CENT;
--************************************************
architecture rtl of MEMO_CENT is
component memoire_unit IS
	port( unite :IN std_logic_vector(3 downto 0);
		   latch :IN std_logic;
		   clk_m: IN std_logic;
		   B0    :OUT std_logic_vector(3 downto 0)
		  );
end component;
begin
MEMO_CENT_inst : memoire_unit
 port map( 
 unite => centaine ,
 latch => latch2, 
 B0 => B2,
 clk_m => clk_m);
end rtl;
