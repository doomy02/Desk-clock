library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_TEXTIO.all;

entity MUX5_1 is
	port(N1: in std_logic_vector(7 downto 0);
	N2: in std_logic_vector(7 downto 0);
	N3: in std_logic_vector(7 downto 0);
	N4: in std_logic_vector(7 downto 0);
	N5: in std_logic_vector(7 downto 0);
	SEL: in std_logic_vector(2 downto 0);
	F: out std_logic_vector(7 downto 0));
end entity;

architecture arh of MUX5_1 is
begin 
	process(SEL, N1, N2, N3, N4, N5)
	begin
		if(SEL = "000") then F <= N1;
		elsif(SEL = "001") then F <= N2;
		elsif(SEL = "010") then F <= N3;
		elsif(SEL = "011") then F <= N4;
		else F <= N5;
		end if;
	end process;
end architecture;


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MS_MUX5_1 is
end entity;		 

architecture ARH_MUX5_1 of MS_MUX5_1 is
component MUX4_1 is
port(N1: in std_logic_vector(7 downto 0);
	N2: in std_logic_vector(7 downto 0);
	N3: in std_logic_vector(7 downto 0);
	N4: in std_logic_vector(7 downto 0);
	N5: in std_logic_vector(7 downto 0);
	SEL: in std_logic_vector(2 downto 0);
	F: out std_logic_vector(7 downto 0));
end component;
signal SEL: STD_LOGIC_VECTOR(2 downto 0);
signal N1,N2,N3,N4,N5,F: STD_LOGIC_VECTOR(7 downto 0);
begin
	UST: MUX4_1 port map(N1 => N1, N2 => N2, N3 => N3, N4 => N4, N5 => N5, SEL => SEL, F => F);
	STIM: process
	begin
		N1 <= "00111011";
		N2 <= "01110110";
		N3 <= "10101010";
		N4 <= "10010110"; 
		N5 <= "00001111";
		SEL <= "000"; 
		wait for 50ns;
		SEL <= "001";
		wait for 200ns;
		SEL <= "010";
		wait for 50ns;
		SEL <= "011";
		wait for 200ns;
		SEL <= "100";
		wait for 200ns;	
		SEL <= "000"; 
		wait for 50ns;
		SEL <= "001";
		wait for 200ns;
		SEL <= "010";
		wait for 50ns;
		SEL <= "011";
		wait for 200ns;
		SEL <= "100";
		wait for 200ns;
		wait;
	end process;
end ARH_MUX5_1;