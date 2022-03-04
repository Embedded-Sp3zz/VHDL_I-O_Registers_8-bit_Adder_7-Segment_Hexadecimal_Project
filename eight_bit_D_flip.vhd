--8-bit D Flip-Flop Register/Buffer--

--Rising Edge Triggered

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity eight_bit_D_flip is
 	Port(
		Clk:	in std_logic;
		D	: 	in std_logic_vector(0 to 7);
		Q	: 	out STD_LOGIC_VECTOR(0 to 7)
		);
end eight_bit_D_flip;


architecture struct of eight_bit_D_flip is
 
	signal c: std_logic_vector(0 to 2);
 
-- D Flip-Flop
	component D_flip is
		Port (
			D, Clk : IN STD_LOGIC;
			Q, Q_bar : OUT STD_LOGIC
		);
	end component;
 
 begin
 FF0: D_flip port map(D(0), Clk, Q(0), open);
 FF1: D_flip port map(D(1), Clk, Q(1), open);
 FF2: D_flip port map(D(2), Clk, Q(2), open);
 FF3: D_flip port map(D(3), Clk, Q(3), open);
 FF4: D_flip port map(D(4), Clk, Q(4), open);
 FF6: D_flip port map(D(5), Clk, Q(5), open);
 FF5:	D_flip port map(D(6), Clk, Q(6), open);
 FF7: D_flip port map(D(7), Clk, Q(7), open);
 
end struct; 
