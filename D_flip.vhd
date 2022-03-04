LIBRARY IEEE;
USE ieee.std_logic_1164.all;

entity D_flip IS
	Port (
		D, Clk : IN STD_LOGIC;
		Q, Q_bar : OUT STD_LOGIC
	);
end D_flip;

architecture behavior of D_flip is
begin
	process (D, Clk)
	Begin
		If rising_edge(Clk) THEN
			Q <= D;
			Q_bar <= NOT D;
		END IF;
	END PROCESS;
end behavior;
