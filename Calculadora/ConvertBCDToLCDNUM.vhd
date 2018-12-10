----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:07:21 12/10/2018 
-- Design Name: 
-- Module Name:    ConvertBCDToLCDNUM - ConvertBCDToLCDNUMArch 
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

entity ConvertBCDToLCDNUM is

	port (
				numEntrada 	: 	in std_logic_vector (31 downto 0) := (others => '0');
				numSaida		:	out std_logic_vector (63 downto 0) := (others => '0')
	
	);
	

end ConvertBCDToLCDNUM;

architecture ConvertBCDToLCDNUMArch of ConvertBCDToLCDNUM is

	signal entrada, entradaAux : std_logic_vector (7 downto 0) := (others => '0');

begin


	Convertendo : process (numEntrada) is
	begin
			
				entrada(7 downto 0) <= x"0"&numEntrada (3 downto 0);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(7 downto 0) <= entrada;
				
				entrada(3 downto 0) <= numEntrada (7 downto 4);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(15 downto 8) <= entrada;
				
				entrada(3 downto 0) <= numEntrada (11 downto 8);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(23 downto 16) <= entrada;
				
				entrada(3 downto 0) <= numEntrada (15 downto 12);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(31 downto 24) <= entrada;
	
				entrada(3 downto 0) <= numEntrada (19 downto 16);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(39 downto 32) <= entrada;
				
				entrada(3 downto 0) <= numEntrada (23 downto 20);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(47 downto 40) <= entrada;
				
				entrada(3 downto 0) <= numEntrada (27 downto 24);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(55 downto 48) <= entrada;
				
				entrada(3 downto 0) <= numEntrada (31 downto 28);
		
				if (entrada = "00000000") then					
					entrada <= x"45";						
				elsif (entrada = "00000001") then					
					entrada <= x"16";					
				elsif (entrada = "00000010") then					
					entrada <= x"1E";						
				elsif (entrada = "00000011") then					
					entrada <= x"26" ;
				elsif (entrada = "00000100") then	
					entrada <= x"25";					
				elsif (entrada = "00000101") then					
					entrada <= x"2E" ;						
				elsif (entrada = "00000110") then					
					entrada <= x"36" ;						
				elsif (entrada = "00000111") then				
					entrada <= x"3D" ;						
				elsif (entrada = "00001000") then					
					entrada <= x"3E";						
				elsif (entrada = "00001001") then					
					entrada <= x"46";				
				end if;
				
				numSaida(63 downto 56) <= entrada;
				
	end process Convertendo;


end ConvertBCDToLCDNUMArch;

