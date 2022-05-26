library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity PSEUDO_RANDOM is
	port(CLOCK, RESET: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end entity;

architecture COMP of PSEUDO_RANDOM is
signal N: std_logic_vector(7 downto 0) := "00001111";
begin
	process(CLOCK, RESET)
	begin
		if(RESET = '1') then
			for I in 3 downto 0 loop
				N(I) <= N(1);
			end loop;
		elsif(CLOCK'EVENT and CLOCK = '1') then
			for I in 3 downto 1 loop
				N(I) <= N(I-1);
			end loop; 
			N(0) <= N(3) xor N(2);
		end if;	
		Q <= N;
	end process;
end architecture;  

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity MS_PSEUDO_RANDOM is
end entity;

architecture ARH_MS_PSEUDO_RANDOM of MS_PSEUDO_RANDOM is
component PSEUDO_RANDOM is
	port(CLOCK, RESET: in STD_LOGIC;
	Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;
signal N: std_logic_vector(7 downto 0) := "00001111";
signal CLOCK, RESET: std_logic;
signal Q: std_logic_vector(7 downto 0);
begin
	UST: PSEUDO_RANDOM port map(CLOCK => CLOCK, RESET => RESET, Q => Q);
	STIM: process
	begin
		RESET <= '0', '1' after 1000ms;
		CLOCK <= '0';
		wait for 50ns;
		CLOCK <= '1';
		wait for 50ns;
	end process;
end architecture;