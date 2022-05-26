library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity AUTOMAT is
	port(CLK: inout STD_LOGIC;
	O: out STD_LOGIC_VECTOR(7 downto 0);
	S: in STD_LOGIC_VECTOR(2 downto 0));
end entity;

architecture ARH of AUTOMAT is
component UC is
	port(
	CLK: inout STD_LOGIC;
	DATA_ZI, DATA_LUNA, DATA_AN: inout INTEGER := 1;
	ORA_SEC, ORA_MIN, ORA_ORA: inout INTEGER := 0;
	TEMP: inout std_logic_vector(7 downto 0) := "00001111"
	);
end component;
component MUX5_1 is
port(N1: in std_logic_vector(7 downto 0);
	N2: in std_logic_vector(7 downto 0);
	N3: in std_logic_vector(7 downto 0);
	N4: in std_logic_vector(7 downto 0);
	N5: in std_logic_vector(7 downto 0);
	SEL: in std_logic_vector(2 downto 0);
	F: out std_logic_vector(7 downto 0));
end component;
signal L1,L2,L3,L4,L5,L6: integer;
signal L7: std_logic_vector(7 downto 0);
signal w1,w2,w3,w4,w5: std_logic_vector(7 downto 0);
begin
	C1: UC port map(clk => clk, ORA_SEC => L1, ORA_MIN => L2, ORA_ORA => L3, DATA_ZI => L4, DATA_LUNA => L5, DATA_AN => L6, TEMP => L7);
	w1 <= std_logic_vector(to_unsigned(L2, 8));
	w2 <= std_logic_vector(to_unsigned(L3, 8));
	w3 <= std_logic_vector(to_unsigned(L4, 8)); 
	w4 <= std_logic_vector(to_unsigned(L5, 8)); 
	w5 <= L7;
	C2: MUX5_1 port map(N1 => w1, N2 => w2, N3 => w3, N4 => w4, N5 => w5, SEL => S, F => O); 
end architecture;