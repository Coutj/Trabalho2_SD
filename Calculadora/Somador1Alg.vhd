----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:27 11/23/2018 
-- Design Name: 
-- Module Name:    Somador - SomadorArch 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Somador1Alg is
	
	port (	
				carryIn	: 	in std_logic;
				numA		:	in std_logic;
				numB		:	in	std_logic;
				result	: 	out std_logic;
				carryOut	: 	out std_logic	
				
	);

end Somador1Alg;

architecture Somador1AlgArch of Somador1Alg is

begin

	result <= numA xor numB xor carryIn;
	carryOut <= (numA and numB) or ((numA xor numB) and carryIn);

end Somador1AlgArch;

