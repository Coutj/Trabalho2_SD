--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:36:44 11/29/2018
-- Design Name:   
-- Module Name:   /home/juan/Documents/SD_trabalho2/Trabalho2_SD/Calculadora/Teste.vhd
-- Project Name:  Calculadora
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Soma4Alg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Teste IS
END Teste;
 
ARCHITECTURE behavior OF Teste IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Soma4Alg
		PORT(
				carryIn : IN  std_logic_vector(0 downto 0);
				numA : IN  std_logic_vector(4 downto 0);
				numB : IN  std_logic_vector(4 downto 0);
				result : OUT  std_logic_vector(3 downto 0);
				carryOutSaida : OUT  std_logic_vector(0 downto 0)
		);
    END COMPONENT;
    

   --Inputs
   signal carryIn1 : std_logic_vector(0 downto 0) := (others => '0');
   signal num1 : std_logic_vector(4 downto 0) := (others => '0');
   signal num2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(3 downto 0);
   signal carryOutSaida : std_logic_vector(0 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Soma4Alg PORT MAP (
          carryIn => carryIn1,
          numA => num1,
          numB => num2,
          result => result,
          carryOutSaida => carryOutSaida
        );
		  
	num1 <= "01001";
	num2	<= "01000";
	carryIn1(0) <= '1';

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
--   stim_proc: process
--   begin		
--      
--		numA <= "0010";
--		numB <= "0001";
--      
--   end process;

END;
