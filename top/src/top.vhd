--***********************************************************
--**             Used Libraries                          **--
--***********************************************************

LIBRARY IEEE;
USE IEEE.NUMERIC_STD;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

--*************************************************************
--**              ENTITY Declaration                            **--
--*************************************************************

ENTITY top IS --top est le boitier du fréquencemètre
PORT(
    rst: IN std_logic;
    mesure: IN std_logic;
    CLK: IN std_logic;
    clk_v:IN std_logic;-- Fréquence permettant à l'oeil de visualiser l'affichage des nombres
    sel: IN std_logic;
    input1_mux1: IN std_logic_vector(1 DOWNTO 0);
    input2_mux1: IN std_logic_vector(1 DOWNTO 0);
    seg_unit: OUT std_logic_vector(6 DOWNTO 0);
    seg_dizaine: OUT std_logic_vector(6 DOWNTO 0);
    seg_centaine: OUT std_logic_vector(6 DOWNTO 0);
    seg_millier: OUT std_logic_vector(6 DOWNTO 0));
 END top;
 
--****************************************************************
--**           Architecture Declaration                       **--
--****************************************************************

ARCHITECTURE rtl OF top IS
    
 COMPONENT DIVISEUR_FREQ 
  PORT(
    clk: IN STD_LOGIC;
    rst: IN STD_LOGIC;
     E0, E1, E2, E3: OUT STD_LOGIC);
 END COMPONENT;
 
 COMPONENT MUX
   PORT 
	(
		E0, E1, E2, E3 : in  std_logic;
		SEL            : in std_logic_vector(1 downto 0);
		MUX            : out std_logic
	); 
END COMPONENT;

COMPONENT MUX2
 PORT 
	(
		ma, auto : in std_logic_vector(1 downto 0);
		ma_au    : in std_logic;
		SEL      : out std_logic_vector(1 downto 0)
	);
END COMPONENT;

COMPONENT EN_VALEUR
PORT
	(
		clk  : in std_logic;
		mesure : in std_logic;
		enable_compt: out std_logic;
		latch_compt : out std_logic;
		clk_compt   : out std_logic;
		reset_compt : out std_logic
	); 
END COMPONENT;

COMPONENT COMP9
 PORT
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
END COMPONENT;
	
 COMPONENT MEMOIRE
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
END COMPONENT;

COMPONENT AFFICHAGE
    PORT(
        B0, B1, B2, B3 : in std_logic_vector(3 downto 0);
		S1, S2, S3, S0 : out std_logic_vector(6 downto 0)
	);
END COMPONENT;
   
SIGNAL sig_0: std_logic;
SIGNAL sig_1: std_logic;
SIGNAL sig_2: std_logic;
SIGNAL sig_3: std_logic;
SIGNAL sig_4: std_logic_vector(1 DOWNTO 0);
SIGNAL sig_5: std_logic;
SIGNAL sig_6: std_logic;
SIGNAL sig_7: std_logic;
SIGNAL sig_8: std_logic;
SIGNAL sig_9: std_logic;
SIGNAL sig_10: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_11: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_12: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_13: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_14: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_15: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_16: std_logic_vector(3 DOWNTO 0);
SIGNAL sig_17: std_logic_vector(3 DOWNTO 0);

BEGIN
horloge: DIVISEUR_FREQ PORT MAP(
  clk => clk,
  rst => rst,
  E0 => sig_0,
  E1 => sig_1,
  E2 => sig_2,
  E3 => sig_3);

selection1: MUX PORT MAP(
           E0 => sig_0,
           E1 => sig_1,
           E2 => sig_2,
           E3 => sig_3,
           sel => sig_4,
           MUX => sig_5);
           
selection2: MUX2 PORT MAP(
           SEL => sig_4,
           ma => input1_mux1,
           auto => input2_mux1,
           ma_au => sel);
           
logique_comptage: EN_VALEUR PORT MAP(
                 clk => sig_5,
                 mesure => mesure,
                 latch_compt => sig_6,
                 clk_compt => sig_7,
                 enable_compt => sig_8,
                 reset_compt => sig_9);
                 
comptage: COMP9 PORT MAP(
         clk => sig_7,
         reset => sig_9,
         enable => sig_8,
         unite => sig_10,
         dizaine => sig_11,
         centaine => sig_12,
         millier => sig_13);

memorisation: MEMOIRE PORT MAP(
            unite => sig_10,
            dizaine => sig_11,
            centaine => sig_12,
            millier => sig_13,
            latch => sig_6,
            latch1 => sig_6,
            latch2 => sig_6,
            latch3 => sig_6,
            clk_m => clk_v,
            B0 => sig_14,
            B1 => sig_15,
            B2 => sig_16,
            B3 => sig_17);
            
seven_segments: AFFICHAGE PORT MAP(
               B0 => sig_14,
               B1 => sig_15,
               B2 => sig_16,
               B3 => sig_17,
               S0 => seg_unit,
               S1 => seg_dizaine,
               S2 => seg_centaine,
               S3 => seg_millier);
END rtl;          