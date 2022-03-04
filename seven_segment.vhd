library ieee;
use ieee.std_logic_1164.all;

entity seven_segment is
	port
	(
		c : in std_logic_vector(3 downto 0);
		disp : out std_logic_vector(0 to 6)
	);
end seven_segment;

architecture Behavioral of seven_segment is
begin


--'a' corresponds to MSB of seg7 and 'g' corresponds to LSB of seg7.
process (c)
BEGIN
    case c is
        when "0000"=> disp <="0000001";  -- '0'
        when "0001"=> disp <="1001111";  -- '1'
        when "0010"=> disp <="0010010";  -- '2'
        when "0011"=> disp <="0000110";  -- '3'
        when "0100"=> disp <="1001100";  -- '4' 
        when "0101"=> disp <="0100100";  -- '5'
        when "0110"=> disp <="0100000";  -- '6'
        when "0111"=> disp <="0001111";  -- '7'
        when "1000"=> disp <="0000000";  -- '8'
        when "1001"=> disp <="0000100";  -- '9'
        when "1010"=> disp <="0001000";  -- 'A'
        when "1011"=> disp <="1100000";  -- 'b'
        when "1100"=> disp <="0110001";  -- 'C'
        when "1101"=> disp <="1000010";  -- 'd'
        when "1110"=> disp <="0110000";  -- 'E'
        when "1111"=> disp <="0111000";  -- 'F'
        when others =>  NULL;
    end case;
end process;

end Behavioral;