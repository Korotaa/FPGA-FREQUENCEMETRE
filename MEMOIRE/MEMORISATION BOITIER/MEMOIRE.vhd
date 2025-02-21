-- Quartus II VHDL Template
-- Signed Adder
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity MEMOIRE is
port(
 unite    :in std_logic_vector(3 downto 0);
 dizaine  :in std_logic_vector(3 downto 0);
 centaine :in std_logic_vector(3 downto 0); 
 millier  : in std_logic_vector(3 downto 0);
 latch    : in std_logic;
 latch1   : in std_logic;
 latch2   : in std_logic;
 latch3   : in std_logic;
 clk_m    : IN std_logic;
 B0, B1, B2, B3 : out std_logic_vector(3 downto 0)
	 );
end entity MEMOIRE;
--*****************************************************
architecture rtl of MEMOIRE is
component memoire_unit IS
	port( unite : IN std_logic_vector(3 downto 0);
		   latch : IN std_logic;
		   clk_m: IN std_logic;
		   B0    : OUT std_logic_vector(3 downto 0)
		  );
end component;
component MEMO_DIZ IS
	port( dizaine : IN std_logic_vector(3 downto 0);
		   latch1  : IN std_logic;
		   clk_m: IN std_logic;
		   B1      : OUT std_logic_vector(3 downto 0)
		  );
end component;
component MEMO_CENT IS
	port( centaine : IN std_logic_vector(3 downto 0);
		   latch2   :IN std_logic;
		   clk_m: IN std_logic;
		   B2       : OUT std_logic_vector(3 downto 0)
		  );
end component;
component MEMO_MIL IS
	port( millier :IN std_logic_vector(3 downto 0);
		   latch3  :IN std_logic;
		   clk_m: IN std_logic;
		   B3      :OUT std_logic_vector(3 downto 0)
		  );
end component;
begin
memoire_unit_inst : memoire_unit
 port map(
 unite => unite,
 latch => latch,
 clk_m => clk_m,
 B0 => B0);
 ---**********************************
MEMO_DIZ_inst : MEMO_DIZ
 port map(
 dizaine => dizaine ,
 latch1 => latch1,
 clk_m => clk_m,
 B1 => B1);
 --**********************************
MEMO_CENT_inst : MEMO_CENT
 port map(
 centaine => centaine,
 clk_m => clk_m,
 latch2 => latch2,
 B2 => B2);
 --***********************************
MEMO_MIL_inst : MEMO_MIL
 port map(
 millier => millier,
 latch3 => latch3,
 clk_m => clk_m,
 B3 => B3);
end rtl;
