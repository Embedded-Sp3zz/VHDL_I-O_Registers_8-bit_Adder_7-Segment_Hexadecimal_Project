library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity part_5 is
	Port (
		EQL : IN STD_LOGIC;											-- Equal Button Mapped to KEY2
		Clk : IN STD_LOGIC;											-- Clock Button mapped to KEY1
		
		SW	 : IN STD_LOGIC_VECTOR(7 downto 0);							-- 8-bit addition values mapped to SW7-0
		
		Hex7, Hex6, Hex5, Hex4 : OUT STD_LOGIC_VECTOR(0 to 6);		-- Displays for both 8-bit addition values
		Hex3 : OUT STD_LOGIC_VECTOR(0 to 6) := "1110110";				-- Display for "="
		Hex2 : OUT STD_LOGIC_VECTOR(0 to 6) := "1111111";				-- Display for "carry bit"
		Hex1, Hex0 : OUT STD_LOGIC_VECTOR(0 to 6)							-- Displays for "sum"
	);
end part_5;

architecture Structural of part_5 is
		
		
--8-bit D Flip-Flop Positive Edge Triggered
	component eight_bit_D_flip
	Port(
		Clk:	in std_logic;
		D	: 	in std_logic_vector(0 to 7);
		Q	: 	out STD_LOGIC_VECTOR(0 to 7)
		);
	end component;
	
--Seven-Segment Display
	component seven_segment
	port
	(
		c : in std_logic_vector(3 downto 0);
		disp : out std_logic_vector(0 to 6)
	);
	end component;
	

-----FUNCTION - Reverse an N size vector ie:		b(0 to 7) <= a(7 downto 0)
function reverse_any_vector (a: in std_logic_vector)
return std_logic_vector is
  variable result: std_logic_vector(a'RANGE);
  alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
begin
  for i in aa'RANGE loop
    result(i) := aa(i);
  end loop;
  return result;
end; -- function reverse_any_vector
	
	
	
	
-----SIGNALS

	SIGNAL Clk_bar : STD_LOGIC;
	SIGNAL A_data, B_data 	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL SUM : STD_LOGIC_VECTOR(8 downto 0);
	SIGNAL Carry : STD_LOGIC_VECTOR(3 downto 0);
	

begin

--------------   P R O C E S S   --------------

addition : process(EQL)
	variable sum_var : STD_LOGIC_VECTOR(8 downto 0);
	variable digit : STD_LOGIC := '0';
begin

	if rising_edge(CLK) then		--If KEY1 is pressed, store the SW7-0 values 
		if (digit = '0') then
			A_data <= SW;
			digit := '1';
				
		else
			B_data <= SW;
			digit := '0';
		end if;
	end if;
				
	if rising_edge(EQL) then		--If KEY2 is pressed, SUM A_data and B_data
		sum_var := ('0' & A_data) + ('0' & B_data);
		SUM <= sum_var;
		
		if sum_var(8) = '1' then
			Carry(0) <= '1';
			
		else
			Carry(0) <= '0';
		
		end if;
	end if;
		
end process addition;


--------------   L O G I C   --------------
	Clk_bar <= NOT Clk;
	

----RISING EDGE TRIGGER---- (KEY1)
	
	--Input:		 8-bit value on SW7-0. Rising edge on KEY1 activates "Clk"
	--A : eight_bit_D_flip port map(Clk, SW, A_data);
	
	--Display:		 8-bit A_data value in Hexadecimal on 7 segment display Hex7-6
	H7 : seven_segment port map(A_data(7 downto 4), Hex7);
	H6 : seven_segment port map(A_data(3 downto 0), Hex6);
	
	
	
----FALLING EDGE TRIGGER---- (KEY1)
	
	--Input:		 8-bit value on SW7-0. Falling edge on KEY1 activates "Clk"
	--B : eight_bit_D_flip port map(CLK_bar, SW, B_data);
	
	--Display:		 8-bit B_data value in Hexadecimal on 7-segment display Hex5-4
	H5 : seven_segment port map(B_data(7 downto 4), Hex5);
	H4 : seven_segment port map(B_data(3 downto 0), Hex4);


	
----EQUAL BUTTON PRESS---- (KEY2)

	--Display:		Single carry bit. Either '0' or '1'.
	H2: seven_segment port map(Carry, Hex2);
	
	--Display:		Summation value. A_data + B_data.
	H1: seven_segment port map(sum(7 downto 4), Hex1);
	H0: seven_segment port map(sum(3 downto 0), Hex0);

end Structural;