-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--*******************************************************
entity AFFICHAGE is
	port
	(
		B0, B1, B2, B3 : in std_logic_vector(3 downto 0);
		S1, S2, S3, S0 : out std_logic_vector(6 downto 0)
	);
end entity AFFICHAGE;
--********************************************************
architecture rtl of AFFICHAGE is
	component AFFI1 is
	port(
	B0 :IN std_logic_vector(3 downto 0);
	S0 :OUT std_logic_vector(6 downto 0)
	    );
	end component;
	component AFF2 is
	port(
	B1 :IN std_logic_vector(3 downto 0);
	S1 :OUT std_logic_vector(6 downto 0)
	    );
	end component;
	component AFF3 is
	port(
	B2 :IN std_logic_vector(3 downto 0);
	S2 :OUT std_logic_vector(6 downto 0)
	    );
	end component;
	component AFF4 is
	port(
	B3 :IN std_logic_vector(3 downto 0);
	S3 : OUT std_logic_vector(6 downto 0)
	    );
	end component;
	begin
	A1 : AFFI1 port map(
	  B0 => B0,
	  S0 =>S0);
	  
	A2: AFF2 PORT MAP(
	  B1 => B1, 
	  S1 =>S1);
	  
	A3: AFF3 PORT MAP(
	   B2 => B2, 
	   S2 => S2);
	   
	A4: AFF4 PORT MAP(
	  B3 => B3, 
	  S3 =>S3);
end rtl;
