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
				carryIn	: 	in integer;
				numA		:	in integer;
				numB		:	in	integer;
				result	: 	out integer;
				carryOut	:	out integer;
				
	);

end Somador1Alg;

architecture Somador1AlgArch of Somador is

begin

	Soma : process is
	
		result <= numA + numB + carryIn;
		
		if (result >= 10) then
			
			result <= result - 10;
			carryOut	<= 1;
			
		end if;
		
	
	end process Soma;

end Somador1AlgArch;

