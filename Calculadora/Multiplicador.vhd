----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:03 11/29/2018 
-- Design Name: 
-- Module Name:    Multiplicador - MultiplicadorArch 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplicador is

	port (
				numA		:	in		std_logic_vector (3 downto 0) := (others => '0');
				numB		:	in		std_logic_vector (3 downto 0) := (others => '0');
				result	: 	out	std_logic_vector	(7 downto 0)	:= (others => '0')
	
	);
	
end Multiplicador;

architecture MultiplicadorArch of Multiplicador is

	signal resultParcial, resultParcial2 : std_logic_vector	(7 downto 0)	:= (others => '0');
	signal seis	: std_logic_vector (3 downto 0)	:= "0110";

begin
	
	resultParcial <= std_logic_vector(unsigned(numA)*unsigned(numB));
	result <= resultParcial2;
	
	corrigeBCDMult : process (numA, numB, resultParcial) is
	begin
	
		if (resultParcial <= "00001001") then
			
			resultParcial2 <= resultParcial;
	
		elsif ((resultParcial >= "00001010") and (resultParcial <= "00010011")) then	-- 10 -- 19
		
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis));
		
		elsif (resultParcial >= "00010100" and resultParcial <= "00011101") then --	20 -- 29
			
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*2);
			
		elsif (resultParcial >= "00011110" and resultParcial <= "00100111") then -- 30 -- 39
		
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*3);
		
		elsif (resultParcial >= "00101000" and resultParcial <= "00110001") then -- 40 -- 49
		
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*4);
			
		elsif (resultParcial >= "00110010" and resultParcial <= "00111011") then -- 50 -- 59
		
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*5);
		
		elsif (resultParcial >= "00111100" and resultParcial <= "01000101") then -- 60 -- 69
		
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*6);
		
		elsif (resultParcial >= "01000110" and resultParcial <= "01001111") then -- 70 -- 79
		
			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*7);
		
		elsif (resultParcial >= "01010000" and resultParcial <= "01011001") then -- 80 -- 89

			resultParcial2 <= std_logic_vector (unsigned(resultParcial) + unsigned(seis)*8);
			
		end if;
	
	
	end process corrigeBCDMult;

end MultiplicadorArch;

