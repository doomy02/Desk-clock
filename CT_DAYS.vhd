library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity CT_SEC is
	port(clk: in std_logic;
	i: in integer;
	o: inout integer);
end entity;				   

architecture comp of CT_SEC is
begin
	process(clk)
	begin
		if CLK'EVENT and CLK = '1' then
			if o = 59 then
				o <= 0;	
			else 
				o <= i + 1;
			end if;
		end if;
	end process;
end architecture;