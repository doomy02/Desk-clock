library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity CT_AN is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer;
	c: inout std_logic);
end entity;				   

architecture mixt of CT_AN is
signal aux: integer := -1;
begin 	 
	process(clk,aux)
	begin  
		if aux = -1 then
			aux <= i;
		end if;
		if (CLK'EVENT and CLK = '1') then
			if aux = 4 then
				aux <= 0;
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

entity MS_CT_AN is
end entity;

architecture ARG_MS_CT_AN of MS_CT_AN is
component CT_AN is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer := 0;
	c: inout STD_LOGIC);
end component;
signal clk,c: std_logic;
signal i: integer := 2;
signal o: integer;
begin
	UST: CT_AN port map(clk => clk, i => i, o => o, c => c);
	STIM: process
	begin 
		CLK <= '0';
		wait for 50ns;
		CLK <= '1';
		wait for 50ns;
	end process;
end architecture;