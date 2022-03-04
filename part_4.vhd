library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity part_4 is
	Port (
		Clk, D : IN STD_LOGIC;
		Qa, Qb, Qc : OUT STD_LOGIC;
		Qa_bar, Qb_bar, Qc_bar : OUT STD_LOGIC
	);
end part_4;

architecture Structural of part_4 is
		
-- D Flip-Flop
	component D_flip
	Port (
		D, Clk : IN STD_LOGIC;
		Q, Q_bar : OUT STD_LOGIC
	);
	end component;

-- D Latch
	component D_latch
	Port (
		D, Clk : IN STD_LOGIC;
		Q, Q_bar : OUT STD_LOGIC
	);
	end component;

	SIGNAL Clk_bar : STD_LOGIC;

begin
--------------   L O G I C   --------------
	Clk_bar <= NOT Clk;

	Gated_D_Latch : D_latch port map (D, Clk, Qa, Qa_bar);
	Positive_D_Flip : D_flip port map(D, Clk, Qb, Qb_bar);
	Negative_D_Flip : D_flip port map(D, Clk_bar, Qc, Qc_bar);

end Structural;
