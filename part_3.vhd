library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity part_3 is
	Port (
		Clk, D : IN STD_LOGIC;
		Q, Q_bar: OUT STD_LOGIC
		);
end part_3;

architecture Structural of part_3 is
		
	component part_2
		Port (
			Clk, D : IN STD_LOGIC;
			Q : OUT STD_LOGIC
		);
	end component;

	SIGNAL Clk_bar, Qm, Qs: STD_LOGIC;
	ATTRIBUTE KEEP : BOOLEAN;
	ATTRIBUTE KEEP OF Qm, Qs : SIGNAL IS TRUE;

begin
--------------   L O G I C   --------------
	Clk_bar <= NOT Clk;

	m: part_2 port map (Clk_bar, D, Qm);
	s: part_2 port map (Clk, Qm, Qs);
	
	Q <= Qs;
	Q_bar <= NOT Qs;

end Structural;
