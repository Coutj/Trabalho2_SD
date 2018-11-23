----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:48 11/23/2018 
-- Design Name: 
-- Module Name:    Soma4Alg - Soma4AlgArch 
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
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Soma4Alg is
	port (
				carryIn				: 	in std_logic;
				numA, numB			:	in std_logic_vector (3 downto 0);
				result				:	out std_logic_vector (3 downto 0);
				carryOutSaida		:	out std_logic
	);

end Soma4Alg;

architecture Soma4AlgArch of Soma4Alg is


component Somador1Alg is
	
	port (	
				carryIn	: 	in std_logic;
				numA		:	in std_logic_vector  (3 downto 0);
				numB		:	in	std_logic_vector  (3 downto 0);
				result	: 	out std_logic_vector (3 downto 0);
				carryOut	: 	out std_logic	
				
	);

end component;

	signal resultParcial, resultParcial2	: std_logic_vector (3 downto 0);
	

begin
	
	resultParcial <= numA + numB;
	result <= resultParcial2;
	-- FALTOU CARRYOUT 
	
	Soma1Algarismo : process is
	begin
	
	
		if (resultParcial  >= "1010") then
			
				resultParcial2 <= resultParcial + "0110";			
				
		else
				resultParcial2 <= resultParcial;
			
		end if;
	
	end process Soma1Algarismo;

end Soma4AlgArch;

