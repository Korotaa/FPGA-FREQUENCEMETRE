-- Quartus II VHDL Template
-- Signed Adder
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEMO_MIL is
port(
 millier: in std_logic_vector(3 downto 0);
 latch3  : in std_logic;
 clk_m: IN std_logic;
 B3: out std_logic_vector(3 downto 0)
	 );
end entity MEMO_MIL;
--**********************************************
architecture rtl of MEMO_MIL is
component memoire_unit IS
	port( unite : IN std_logic_vector(3 downto 0);
		   latch :IN std_logic;
		   clk_m: IN std_logic;
			B0    : OUT std_logic_vector(3 downto 0)
		  );
end component;
begin
MEMO_MIL_inst : memoire_unit 
 port map(
 unite => millier ,
 latch => latch3,
 clk_m => clk_m,
 B0 => B3);
end rtl;
