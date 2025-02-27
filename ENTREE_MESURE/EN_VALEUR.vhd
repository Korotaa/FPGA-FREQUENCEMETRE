 --**librairie****
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--***************************************************************
--cette entit� sert � g�n�rer le signal d'horloge du compteur
-- g�nerer le signal d'activation et de d�sactivation du compeur
-- g�n�rer le signal d'activation et de desactivation des m�moires
--g�n�rer le signal de remise � 0 du compteur
--***************************************************************** 
entity EN_VALEUR IS
	port
	(
		clk  : in std_logic;
		mesure : in std_logic;
		enable_compt: out std_logic;
		latch_compt : out std_logic;
		clk_compt   : out std_logic;
		reset_compt : out std_logic
	);
end EN_VALEUR;
--***********************************************
architecture rtl of EN_VALEUR is
   BEGIN
   PROCESS(mesure, clk)
     BEGIN
	   IF mesure'event and mesure='1' THEN
			reset_compt <= '1';
			enable_compt <= '1';
			--IF clk'event and clk='0' THEN
				clk_compt <= '1';
			--ELSE
				clk_compt <= '0';
           -- END IF;
         ELSE
			enable_compt <= '0';
       END IF;
END PROCESS;
END rtl;