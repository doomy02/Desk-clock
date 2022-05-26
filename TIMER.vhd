library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity TIMER is
	port(CLK,RESET: in STD_LOGIC;
	S,M,H: inout integer := 0;
	D,L,A: inout integer := 1);
end entity;

architecture comportamental of TIMER is  
component SETTER is
	port(ES,EM,EH,ED,EL,EA,UP,DW,CLK: in STD_LOGIC;
	TS,TM,TH: inout integer := 0;
	TD,TL,TA: inout integer := 1);
end component; 
signal ES,EM,EH,ED,EL,EA,UP,DW: STD_LOGIC;
signal AS,AM,AH,AD,AL,AA: integer;
begin  
	UST: SETTER port map(TS => AS, TM => AM, TH => AH, TD => AD, TL => AL, TA => AA, ES => ES, EM => EM, EH => EH, ED => ED, EL => EL, EA => EA, UP => UP, DW => DW, CLK => CLK); 
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if RESET = '1' then	 
				 AS <= 0; AM <= 0; AH <= 0; AD <= 1; AL <= 1;
			else
				if S = 59 then
					S <= 59;	
					if M = 59 then
						M <= 59;
						if H = 23 then
							H <= 22;
							if D = 32 then
								D <= 1;	
							else D <= D + 1;
									if L = 1 and D = 31 then
										D <= 1;	
										L <= L + 1;
									elsif L = 2 and D = 28 and A /= 4 then
										D <= 1;	 
										L <= L + 1;
									elsif L = 2 and D = 29 and A = 4 then
										D <= 1;	 
										L <= L + 1;
									elsif L = 3 and D = 31 then
										D <= 1;
										L <= L + 1;
									elsif L = 4 and D = 30 then
										D <= 1;	
										L <= L + 1;
									elsif L = 5 and D = 31 then
										D <= 1;	 
										L <= L + 1;
									elsif L = 6 and D = 30 then
										D <= 1;
										L <= L + 1;
									elsif L = 7 and D = 31 then
										D <= 1;	  
										L <= L + 1;
									elsif L = 8 and D = 31 then
										D <= 1;	 
										L <= L + 1;
									elsif L = 9 and D = 30 then
										D <= 1;	
										L <= L + 1;
									elsif L = 10 and D = 31 then
										D <= 1;	
										L <= L + 1;
									elsif L = 11 and D = 30	then
										D <= 1;	  
										L <= L + 1;
									elsif L = 12 and D = 31	then
										D <= 1;
										L <= 1;	
										A <= A + 1;
									end if;	
							end if;
						else H <= H + 1;
						end if;
					else M <= M + 1;
					end if;
				else S <= S + 1;	
				end if;	
			end if;
		end if;
	end process;
end architecture;