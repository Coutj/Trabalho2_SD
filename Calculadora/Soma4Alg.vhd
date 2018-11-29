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
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Soma4Alg is
	port (
				carryIn				: 	in std_logic_vector (0 to 0) := (others => '0');
				numA					:	in std_logic_vector (3 downto 0) := (others => '0');
				numB					:	in std_logic_vector (3 downto 0) := (others => '0');
				result				:	out std_logic_vector (3 downto 0) := (others => '0');
				carryOutSaida		:	out std_logic_vector (0 to 0) := (others => '0')
	);

end Soma4Alg;

architecture Soma4AlgArch of Soma4Alg is

	
	signal resultParcial, resultParcial2 : std_logic_vector (4 downto 0) := (others => '0');
	signal numero1, numero2 : std_logic_vector (4 downto 0) :=  (others => '0');
	signal seis : std_logic_vector (4 downto 0) := "00110";
	
begin

	numero1 	<= '0'&numA;
	numero2	<=	'0'&numB;
	
	resultParcial(4 downto 0) <= std_logic_vector(unsigned (numero1) + unsigned (numero2) + unsigned(carryIn) );
	result <= resultParcial2(3 downto 0);
	carryOutSaida (0) <= resultParcial2(4);
	
	corrigeBCD : process (numA, numB, carryIn, resultParcial) is
	begin	
		
		
		if (resultParcial  >= "01010") then
				resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis));
		else
				resultParcial2 <= resultParcial;
		end if;
		
		
	
	end process corrigeBCD;

end Soma4AlgArch;

