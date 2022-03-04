library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity part_1 is
	Port (
		Clk, R, S : IN STD_LOGIC;
		Q : OUT STD_LOGIC
		);
end part_1;

architecture Structural of part_1 is
	SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC;
	ATTRIBUTE KEEP : BOOLEAN;
	ATTRIBUTE KEEP OF R_g, S_g, Qa, Qb : SIGNAL IS TRUE;

begin
--------------   L O G I C   --------------

	R_g <= R AND Clk;
	S_g <= S AND CLK;
	Qa <= NOT(R_g OR Qb);
	Qb <= NOT(S_g OR Qa);

	Q <= Qa;

end Structural;
