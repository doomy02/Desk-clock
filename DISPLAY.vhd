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

entity MUX4_1 is
	port(N1: in std_logic_vector(3 downto 0);
	N2: in std_logic_vector(3 downto 0);
	N3: in std_logic_vector(3 downto 0);
	N4: in std_logic_vector(3 downto 0);
	SEL: in std_logic_vector(1 downto 0);
	F: out std_logic_vector(3 downto 0));
end entity;

architecture arh of MUX4_1 is
begin 
	process(SEL, N1, N2, N3, N4)
	begin
		if(SEL = "00") then F <= N1;
		elsif(SEL = "01") then F <= N2;
		elsif(SEL = "10") then F <= N3;
		else F <= N4;
		end if;
	end process;
end architecture;



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity COUNTER_15_1 is
	port(CLK: in STD_LOGIC;
	NUMBER: inout STD_LOGIC_VECTOR(0 to 15) := (others => '0'));
end entity;

architecture arh of COUNTER_15_1  is
begin
	process(CLK)
	begin
		if(NUMBER = "1111111111111111") then NUMBER <= "0000000000000000"; 
		elsif CLK'event and CLK = '1' then NUMBER <= NUMBER + 1;
		end if;			
	end process;
end architecture;



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity afisor is
	port(N1: in std_logic_vector(3 downto 0);
	N2: in std_logic_vector(3 downto 0);
	N3: in std_logic_vector(3 downto 0);
	N4: in std_logic_vector(3 downto 0);
	CLK: in std_logic;
	an: inout std_logic_vector(3 downto 0);
	cat: inout std_logic_vector(6 downto 0));
end entity;

architecture struct of afisor is	

	component BCD_7SEG is
		port(N: in STD_LOGIC_VECTOR(3 downto 0);
		S_SEG: out STD_LOGIC_VECTOR(6 downto 0));
	end component;
	
	component MUX4_1 is
		port(N1: in std_logic_vector(3 downto 0);
		N2: in std_logic_vector(3 downto 0);
		N3: in std_logic_vector(3 downto 0);
		N4: in std_logic_vector(3 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		F: out std_logic_vector(3 downto 0));
	end component;
	
	component COUNTER_15_1 is
		port(CLK: in STD_LOGIC;
		NUMBER: inout STD_LOGIC_VECTOR(0 to 15) := (others => '0'));
	end component;

signal auxmux: std_logic_vector(3 downto 0);
signal auxsel: std_logic_vector(1 downto 0);
begin
	C1: MUX4_1 port map(N1,N2,N3,N4, auxsel, auxmux);
	C2: MUX4_1 port map("1110", "1101", "1011", "0111", auxsel, auxmux);
	C3: BCD_7SEG port map(N(3) => auxmux(0), N(2) => auxmux(1), N(1) => auxmux(2), N(0) => auxmux(3), S_SEG(0) => cat(0), S_SEG(1) => cat(1), S_SEG(2) => cat(2), S_SEG(3) => cat(3), S_SEG(4) => cat(4), S_SEG(5) => cat(5), S_SEG(6) => cat(6));
end architecture;