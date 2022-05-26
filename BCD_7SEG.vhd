library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BCD_7SEG is
	port(N: in STD_LOGIC_VECTOR(3 downto 0);
	S_SEG: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture Behavioral of BCD_7SEG is
begin
	process(N)
	begin
		case N is
			when "0000" => S_SEG <= "0000001";
			when "0001" => S_SEG <= "1001111";
			when "0010" => S_SEG <= "0010010";
			when "0011" => S_SEG <= "0000110";
			when "0100" => S_SEG <= "1001100";
			when "0101" => S_SEG <= "0100100";
			when "0110" => S_SEG <= "0100000";
			when "0111" => S_SEG <= "0001111";
			when "1000" => S_SEG <= "0000000";
			when "1001" => S_SEG <= "0000100";
			when others => S_SEG <= "1111111";
		end case;
	end process;
end Behavioral;	 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MS_BCD_7SEG is
end entity;

architecture ARG_MS_BCD_7SEG of MS_BCD_7SEG is
component BCD_7SEG is
	port(N: in STD_LOGIC_VECTOR(3 downto 0);
	S_SEG: out STD_LOGIC_VECTOR(6 downto 0));
end component;
signal N: STD_LOGIC_VECTOR(3 downto 0);
signal S_SEG: STD_LOGIC_VECTOR(6 downto 0);
begin
	UST: BCD_7SEG port map(N => N, S_SEG => S_SEG);
	STIM: process
	begin
		N <= "0000";
		wait for 100 ns;
		N <= "0001";
		wait for 100 ns;
		N <= "0010";
		wait for 100 ns;
		N <= "0011";
		wait for 100 ns;
		N <= "0100";
		wait for 100 ns;
		N <= "0101";
		wait for 100 ns;
		N <= "0110";
		wait for 100 ns;
		N <= "0111";
		wait for 100 ns;	
		N <= "1000";
		wait for 100 ns;
		N <= "1001";
		wait for 100 ns;
		N <= "1010";
		wait for 100 ns;
		N <= "1011";
		wait for 100 ns;
		N <= "1100";
		wait for 100 ns;
		N <= "1101";
		wait for 100 ns;
		N <= "1110";
		wait for 100 ns;
		N <= "1111";
		wait for 100 ns;   
	end process;
end architecture;