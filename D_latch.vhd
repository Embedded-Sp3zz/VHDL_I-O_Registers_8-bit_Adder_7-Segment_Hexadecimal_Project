LIBRARY IEEE;
USE ieee.std_logic_1164.all;

entity D_latch IS
	Port (
		D, Clk : IN STD_LOGIC;
		Q, Q_bar : OUT STD_LOGIC
	);
end D_latch;

architecture behavior of D_latch is
begin
	process (D, Clk)
	Begin
		If Clk = '1' THEN
			Q <= D;
			Q_bar <= NOT D;
		END IF;
	END PROCESS;
end behavior;
