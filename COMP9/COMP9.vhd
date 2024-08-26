-- Quartus II VHDL Template
-- Binary Counter
library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;
--*********************************************************
entity COMP9 is
	port
	(
		clk    : in std_logic;
		reset  : in std_logic;
		enable : in std_logic;
-- sorties
		unite    : out std_logic_vector(3 downto 0);
		dizaine  : out std_logic_vector(3 downto 0);
		centaine : out std_logic_vector(3 downto 0);
		millier  : out std_logic_vector(3 downto 0)
	);
end entity COMP9;
--******************************************************************
architecture archi of COMP9 is
signal compt_u : std_logic_vector(3 downto 0):=(others => '0');
signal compt_d : std_logic_vector(3 downto 0):=(others => '0');
signal compt_c : std_logic_vector(3 downto 0):=(others => '0');
signal compt_m : std_logic_vector(3 downto 0):=(others => '0');
begin
	unite <= compt_u;
	dizaine <= compt_d;
	centaine <= compt_c;
	millier <= compt_m;

	process (reset, clk)
	begin
		if(reset = '1') 
		then
		   compt_u <= (others => '0');
		   compt_d <= (others => '0');
		   compt_c <= (others => '0');
		   compt_m <= (others => '0');
		   elsif(clk' event and clk ='1') 
		    then
		      if enable = '1' 
		      then
			    compt_u <= compt_u + 1;
			    if(compt_u = 9) then
			      compt_d <= compt_d + 1;
			      compt_u <= "0000";
				 if (compt_d = 9) then 
				   compt_c <= compt_c +1;
				   compt_d <= "0000";
				 if(compt_c = 9) then
					compt_m <= compt_m +1;
					compt_c <= "0000";
				ELSE
				  compt_u <= (others => '0');
		        compt_d <= (others => '0');
		        compt_c <= (others => '0');
		        compt_m <= (others => '0');
					end if;
				end if;
			end if;
		end if;
		end if;
	end process;
end archi;