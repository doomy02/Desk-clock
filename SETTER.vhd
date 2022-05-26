library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity SETTER is
	port(CLK: in STD_LOGIC;
	TS,TM,TH: inout integer := 0;
	TD,TL,TA: inout integer := 1);
end entity;

architecture COMP of SETTER is	
signal ES,EM,EH,ED,EL,EA,UP,DW: STD_LOGIC;
signal start : std_logic := '1';
begin 
process(ES,EM,EH,ED,EL,EA,UP,DW,CLK,START)
	begin
		if CLK'EVENT and CLK = '1' and start = '1' then
			if(ES = '1' and EM = '0' and EH = '0' and ED = '0' and EL = '0' and EA = '0' and UP = '1' and DW = '0') then	 
				TS <= TS + 1; 
				if TS = 59 then
					TS <= 0;
				end if;
			elsif(ES = '1' and EM = '0' and EH = '0' and ED = '0' and EL = '0' and EA = '0' and UP = '0' and DW = '1') then	 
				TS <= TS - 1; 
				if TS = 0 then
					TS <= 59;
				end if;
			elsif(ES = '0' and EM = '1' and EH = '0' and ED = '0' and EL = '0' and EA = '0' and UP = '1' and DW = '0') then	 
				TM <= TM + 1;
				if TM = 59 then
					TM <= 0;
				end if;
			elsif(ES = '0' and EM = '1' and EH = '0' and ED = '0' and EL = '0' and EA = '0' and UP = '0' and DW = '1') then	 
				TM <= TM - 1;
				if TM = 0 then
					TM <= 59;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '1' and ED = '0' and EL = '0' and EA = '0' and UP = '1' and DW = '0') then	 
				TH <= TH + 1;
				if TH = 23 then
					TH <= 0;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '1' and ED = '0' and EL = '0' and EA = '0' and UP = '0' and DW = '1') then	 
				TH <= TH - 1; 
				if TH = 0 then
					TH <= 23;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '0' and ED = '1' and EL = '0' and EA = '0' and UP = '1' and DW = '0') then	 
				TD <= TD + 1;
				if TD = 31 then
					TD <= 1;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '0' and ED = '1' and EL = '0' and EA = '0' and UP = '0' and DW = '1') then	 
				TD <= TD - 1;
				if TD = 1 then
					TD <= 31;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '0' and ED = '0' and EL = '1' and EA = '0' and UP = '1' and DW = '0') then	 
				TL <= TL + 1;
				if TL = 12 then
					TM <= 1;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '0' and ED = '0' and EL = '1' and EA = '0' and UP = '0' and DW = '1') then	 
				TL <= TL - 1;
				if TL = 1 then
					TL <= 12;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '0' and ED = '0' and EL = '0' and EA = '1' and UP = '1' and DW = '0') then	 
				TA <= TA + 1; 
				if TA = 4 then
					TA <= 1;
				end if;
			elsif(ES = '0' and EM = '0' and EH = '0' and ED = '0' and EL = '0' and EA = '1' and UP = '0' and DW = '1') then	 
				TA <= TA - 1;
				if TA = 1 then
					TA <= 4;
				end if;	
			elsif(ES = '1' and EM = '1' and EH = '1' and ED = '1' and EL = '1' and EA = '1' and UP = '1' and DW = '1')	then  
				start <= '0';
			end if;
		end if;
	end process;
end COMP;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity MS_SETTER is
end entity;

architecture ARH_MS_SETTER of MS_SETTER is
component SETTER is
	port(CLK: in STD_LOGIC;
	TS,TM,TH: inout integer := 0;
	TD,TL,TA: inout integer := 1); 
end component;
signal CLK,ES,EM,EH,ED,EL,EA,UP,DW,start: STD_LOGIC;
signal TS,TM,TH,TD,TL,TA: integer;
begin
	UST: SETTER port map(CLK => CLK, TS => TS, TM => TM, TH => TH, TD => TD, TL => TL, TA => TA);
	STIM: process
	begin  
		start <= '1', '0' after 1000ns;
		ES <= '1'; EM <= '0'; EH <= '0'; ED <= '0'; EL <= '0'; EA <= '0'; UP <= '1'; DW <= '0';
		wait for 200ns;	
		ES <= '0'; EM <= '1'; EH <= '0'; ED <= '0'; EL <= '0'; EA <= '0'; UP <= '1'; DW <= '0';
		wait for 300ns;	  
		ES <= '0'; EM <= '0'; EH <= '0'; ED <= '1'; EL <= '0'; EA <= '0'; UP <= '1'; DW <= '0';
		wait for 500ns;
		CLK <= '0';
		wait for 50 ns;
		CLK <= '1';
		wait for 50 ns;	  
	end process;
end ARH_MS_SETTER;