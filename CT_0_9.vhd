library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
	port(CLK: in STD_LOGIC;
	RESET: in STD_LOGIC;
	CARRY: out STD_LOGIC;
	NUMBER: inout STD_LOGIC_VECTOR(3 downto 0) := (others => '0'));
end entity;

architecture arh of counter is
begin
	process(CLK, RESET)
	begin
		if(RESET = '1' or NUMBER = "1001") then NUMBER <= "0000"; 
		elsif CLK'event and CLK = '1' then NUMBER <= NUMBER + 1;
		end if;			
	end process;
	CARRY <= NUMBER(3);
end architecture;