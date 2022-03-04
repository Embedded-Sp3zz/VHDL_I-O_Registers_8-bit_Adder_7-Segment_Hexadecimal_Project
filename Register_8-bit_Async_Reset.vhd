library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Register_8_bit_Async_Reset IS
	PORT
	(
		D : in STD_LOGIC_VECTOR(7 downto 0);
		resetn, clock : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(7 downto 0)
	);
END Register_8_bit_Async_Reset;

ARCHITECTURE behavioral OF Register_8_bit_Async_Reset IS
BEGIN
	PROCESS(resetn, clock)
	BEGIN
		IF resetn = '0' THEN
			Q <= "00000000";
		ELSIF rising_edge(clock) THEN
			Q <= D;
		END IF;
	END PROCESS;
END behavioral;
