library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
ENTITY tb_part_1 IS
END tb_part_1;
 
ARCHITECTURE behavior OF tb_part_1 IS 


--------------   S I G N A L   D E C L A R A T I O N S   --------------
   --UUT Inputs
   signal Clk : std_logic := '1';
   signal Rsig : std_logic := '0';
   signal Ssig : std_logic := '0';

 	--UUT Outputs
   signal Qsig : std_logic;
   
--------------   C O M P O N E N T   D E C L A R A T I O N S   --------------
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT part_1
	Port (
		Clk, R, S : IN STD_LOGIC;
		Q : OUT STD_LOGIC
	);
END COMPONENT;
    
 
BEGIN
 --------------   C O M P O N E N T   I N S T A N T I A T I O N   --------------
	-- Instantiate the Unit Under Test (UUT)
   uut: part_1 PORT MAP (
          Clk => Clk,
          R => Rsig,
          S => Ssig,
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
		Rsig <= '1';
		wait for 10 us;

		Rsig <= '0';
		wait for 10 us;

		Ssig <= '1';
		wait for 10 us;

		Ssig <= '0';
		wait for 10 us;
   end process stim_proc;

END;


