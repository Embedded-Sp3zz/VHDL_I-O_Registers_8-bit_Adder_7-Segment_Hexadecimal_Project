library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
 
ENTITY tb_Register_8_bit_Async_Reset IS
END tb_Register_8_bit_Async_Reset;
 
ARCHITECTURE behavior OF tb_Register_8_bit_Async_Reset IS 


--------------   S I G N A L   D E C L A R A T I O N S   --------------
   --UUT Inputs
   signal Dsig : std_logic_vector(7 downto 0) := (others => '0');
   signal Rsig : std_logic := '1';
   signal CLK  : std_logic := '0';

 	--UUT Outputs
   signal Qsig : std_logic_vector(7 downto 0);
   
--------------   C O M P O N E N T   D E C L A R A T I O N S   --------------
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT Register_8_bit_Async_Reset
	PORT
	(
		D : in STD_LOGIC_VECTOR(7 downto 0);
		resetn, clock : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;
    
 
BEGIN
 --------------   C O M P O N E N T   I N S T A N T I A T I O N   --------------
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_8_bit_Async_Reset PORT MAP (
          D => Dsig,
          resetn => Rsig,
          clock => CLK,
          Q => Qsig
        );

 --------------   P R O C E S S   --------------
 
-- Halt process
Reset_proc: process
   begin		
      wait for 1 ms;
	  assert FALSE
		report "Ok - Just End of Run"
		severity FAILURE;
   end process Reset_proc;

-- Stimulus process
stim_proc: process
	begin
		CLK <= '0';
		wait for 10 us;
		CLK <= '1';
		wait for 10 us;

		CLK <= '0';
		Dsig <= "01010101";
		wait for 10 us;
		CLK <= '1';
		wait for 10 us;
		
		CLK <= '0';
		Rsig <= '0';
		wait for 10 us;
		CLK <= '1';
		Rsig <= '1';
		wait for 10 us;

		CLK <= '0';
		Dsig <= "00001111";
		wait for 10 us;
		CLK <= '1';
		wait for 10 us;
		
   end process stim_proc;

END;


