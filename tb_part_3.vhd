library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
ENTITY tb_part_3 IS
END tb_part_3;
 
ARCHITECTURE behavior OF tb_part_3 IS 


--------------   S I G N A L   D E C L A R A T I O N S   --------------
   --UUT Inputs
   signal Clk : std_logic := '1';
   signal Dsig : std_logic := '0';

 	--UUT Outputs
   signal Qsig : std_logic;
   signal Q_sig : std_logic;
   
--------------   C O M P O N E N T   D E C L A R A T I O N S   --------------
    -- Component Declaration for the Unit Under Test (UUT)
COMPONENT part_3
	Port (
		Clk, D : IN STD_LOGIC;
		Q, Q_bar : OUT STD_LOGIC
		);
END COMPONENT;
    
 
BEGIN
 --------------   C O M P O N E N T   I N S T A N T I A T I O N   --------------
	-- Instantiate the Unit Under Test (UUT)
   uut: part_3 PORT MAP (
	Clk => Clk,
	D => Dsig,
	Q => Qsig,
	Q_bar => Q_sig
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
		Clk <= '0';
		wait for 10 us;

		Clk <= '1';
		wait for 10 us;

		Dsig <= '0';
		Clk <= '0';
		wait for 10 us;

		Clk <= '1';
		wait for 10 us;

		Dsig <= '1';
		Clk <= '0';
		wait for 10 us;

		Clk <= '1';
		wait for 10 us;

		Dsig <= '0';
		Clk <= '0';
		wait for 10 us;

		Clk <= '1';
		wait for 10 us;

		Dsig <= '1';
		Clk <= '0';
		wait for 10 us;

		Clk <= '1';
		wait for 10 us;

   end process stim_proc;

END;


