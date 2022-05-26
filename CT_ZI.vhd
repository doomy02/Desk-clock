library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity CT_ZI is
	port(clk: in std_logic;
	i,i2,i3: in integer;
	o: inout integer;
	c: inout STD_LOGIC);
end entity;				   

architecture comp of CT_ZI is
signal aux: integer := -1;
begin
	process(clk,i,i2,i3,aux)
	begin
		if aux = -1 then
			aux <= i;
		end if;
		if CLK'EVENT and CLK = '1' then
			if i2 = 1 and aux = 31 then
				aux <= 1;	 
				c <= '1';
			elsif i2 = 2 and aux = 28 and i3 /= 4 then
				aux <= 1;
				c <= '1';
			elsif i2 = 2 and aux = 29 and i3 = 4 then
				aux <= 1;
				c <= '1';
			elsif i2 = 3 and aux = 31 then
				aux <= 1;
				c <= '1';
			elsif i2 = 4 and aux = 30 then
				aux <= 1;
				c <= '1';
			elsif i2 = 5 and aux = 31 then
				aux <= 1;
				c <= '1';
			elsif i2 = 6 and aux = 30 then
				aux <= 1;
				c <= '1';
			elsif i2 = 7 and aux = 31 then
				aux <= 1;	
				c <= '1';
			elsif i2 = 8 and aux = 31 then
				aux <= 1;
				c <= '1';
			elsif i2 = 9 and aux = 30 then
				aux <= 1;
				c <= '1';
			elsif i2 = 10 and aux = 31 then
				aux <= 1;
				c <= '1';
			elsif i2 = 11 and aux = 30 then
				aux <= 1;	
				c <= '1';
			elsif i2 = 12 and aux = 31 then
				aux <= 1;
				c <= '1';
			else
				aux <= aux + 1;
				c <= '0';
			end if;
		end if;
		o <= aux;
	end process;
end architecture;	

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity MS_CT_ZI is
end entity;

architecture ARG_MS_CT_ZI of MS_CT_ZI is
component CT_ZI is
	port(clk: in std_logic;
	i,i2,i3: in integer;
	o: inout integer := 0;
	c: inout STD_LOGIC);
end component;
signal clk,c: std_logic;
signal i: integer := 24;
signal i2: integer := 12;
signal i3: integer := 4;
signal o: integer;
begin
	UST: CT_ZI port map(clk => clk, i => i, i2 => i2, i3 => i3, o => o, c => c);
	STIM: process
	begin 
		CLK <= '0';
		wait for 50ns;
		CLK <= '1';
		wait for 50ns;
	end process;
end architecture;