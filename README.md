# VHDL_8_Bit_Summation_Display
Structural and Behaviorial components building upon a DE2-115 Development Board project. D-Latch and D-Flip registers, Seven-Segment displays and VHDL Processes.

Multiple VHDL components and architectures were simulated and verified using a test bench for "part_1:4" and "Register_8_bit_Async_Reset".

The main file is denoted "part_5" and contains sequential circuits as well as processes to display two 8-bit adders read from input switches, 
execute a summation on a rising edge clock trigger labeled "Equal", and display the hexadecimal output as well as a carry bit to the displays.

The inputs 'A' and "B" utilize an 8-bit register that stores one value so the other can be loaded on a clock trigger "Clk". 
The registers were built using simpler components from other designs throughout the repository.
