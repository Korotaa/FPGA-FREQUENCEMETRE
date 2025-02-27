-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity MEMO_DIZ is
port(
dizaine: in std_logic_vector(3 downto 0);
latch1  : in std_logic;
clk_m: IN std_logic;
B1     : out std_logic_vector(3 downto 0)
	 );
end entity MEMO_DIZ;
--**********************************************
architecture rtl of MEMO_DIZ is
component memoire_unit IS
	port( unite : IN std_logic_vector(3 downto 0);
	      latch : IN std_logic;
	      clk_m: IN std_logic;
	      B0    : OUT std_logic_vector(3 downto 0));
end component;
begin
MEMO_DIZ_inst : memoire_unit
 port map( 
 unite => dizaine,
 latch => latch1,
 clk_m => clk_m,
 B0 => B1);
end rtl;
