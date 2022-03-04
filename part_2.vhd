library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity part_2 is
	Port (
		Clk, D : IN STD_LOGIC;
		Q : OUT STD_LOGIC
		);
end part_2;

architecture Structural of part_2 is
	SIGNAL R, S, R_g, S_g, Qa, Qb: STD_LOGIC;
	ATTRIBUTE KEEP : BOOLEAN;
	ATTRIBUTE KEEP OF R_g, S_g, Qa, Qb : SIGNAL IS TRUE;

begin
--------------   L O G I C   --------------
	S <= D;
	R <= NOT D;
	S_g <= S NAND Clk;
	R_g <= R NAND Clk;

	Qa <= S_g NAND Qb;
	Qb <= R_g NAND Qa;

	Q <= Qa;

end Structural;
