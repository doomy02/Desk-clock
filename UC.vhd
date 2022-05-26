library IEEE;	
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity UC is
	port(
	CLK: inout STD_LOGIC;
	DATA_ZI, DATA_LUNA, DATA_AN: inout INTEGER := 1;
	ORA_SEC, ORA_MIN, ORA_ORA: inout INTEGER := 0;
	TEMP: inout STD_LOGIC_VECTOR(7 downto 0)
	);
end entity;

architecture ARH of UC is 
component SETTER is
	port(CLK: in STD_LOGIC;
	TS,TM,TH: inout integer := 0;
	TD,TL,TA: inout integer := 1);
end component;
component CT_SEC is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer;
	c: inout std_logic);
end component;
component CT_MIN is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer;
	c: inout std_logic);
end component;	  
component CT_H is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer;
	c: inout std_logic);
end component;	
component CT_ZI is
	port(clk: in std_logic;
	i,i2,i3: in integer;
	o: inout integer;
	c: inout std_logic);
end component; 
component CT_LUN is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer;
	c: inout std_logic);
end component;	
component CT_AN is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer;
	c: inout std_logic);
end component;	
component PSEUDO_RANDOM is
	port(CLOCK, RESET: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;
--signal ES,EM,EH,ED,EL,EA,UP,DW: STD_LOGIC;
signal L1,L2,L3,L4,L5,L6,st: std_logic;
signal V: std_logic_vector(7 downto 0) := "00001111";
signal AS,AM,AH,AD,AL,AA: integer;
begin  
		C1: SETTER port map(TS => AS, TM => AM, TH => AH, TD => AD, TL => AL, TA => AA, clk => clk);  
		C2: CT_SEC port map(i => AS, clk => clk, o => ORA_SEC, c => L1);	
		C3: CT_MIN port map(i => AM, clk => L1, o => ORA_MIN, c => L2);	
		C4: CT_H port map(i => AH, clk => L2, o => ORA_ORA, c => L3);	
		C5: CT_ZI port map(i => AD, i2 => AL, i3 => AA, clk => L3, o => DATA_ZI, c => L4);	
	   	C6: CT_LUN port map(i => AL, clk => L4, o => DATA_LUNA, c => L5);	 
		C7: CT_AN port map(i => AA, clk => L5, o => DATA_AN, c => L6);	
		C8: PSEUDO_RANDOM port map(clock => clk, reset => '0', Q => V);	
		TEMP <= V;
end ARH;