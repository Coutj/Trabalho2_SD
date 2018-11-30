----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:14:11 11/30/2018 
-- Design Name: 
-- Module Name:    MultiplicadorCompleto - MultiplicadorCompletoArch 
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

entity MultiplicadorCompleto is

	port (
		
				numA		:	in std_logic_vector (15 downto 0) := (others => '0');
				numB		:	in std_logic_vector (15 downto 0) := (others => '0');
				result	:	out std_logic_vector (31 downto 0) := (others => '0')
	
	);

end MultiplicadorCompleto;

architecture MultiplicadorCompletoArch of MultiplicadorCompleto is

	Component Multiplicador is

		port (
					numA		:	in		std_logic_vector (3 downto 0) := (others => '0');
					numB		:	in		std_logic_vector (3 downto 0) := (others => '0');
					result	: 	out	std_logic_vector	(7 downto 0)	:= (others => '0')
		);
		
	end Component;
	
	component Soma4Alg is
		port (
		
				carryIn				: 	in std_logic_vector (0 to 0) := (others => '0');
				numA					:	in std_logic_vector (3 downto 0) := (others => '0');
				numB					:	in std_logic_vector (3 downto 0) := (others => '0');
				result				:	out std_logic_vector (3 downto 0) := (others => '0');
				carryOutSaida		:	out std_logic_vector (0 to 0) := (others => '0')
		);

	end component;
	
	signal resultParcial1, resultParcial2, resultParcial3, resultParcial4 	:	std_logic_vector (7 downto 0) := (others => '0');
	signal carryIn : std_logic_vector (0 to 0) := (others => '0');
	signal auxResult : std_logic_vector (31 downto 0) := (others => '0');
	signal linha1 : std_logic_vector (31 downto 0) := (others => '0');
	signal carryOut1, carryOut2, carryOut3 : std_logic_vector (0 downto 0) := (others => '0');

--	signal resultParcial1, resultParcial2, resultParcial3, resultParcial4 	:	std_logic_vector (15 downto 0) := (others => '0');
	
begin


		mult1 : 	Multiplicador port map	(numA(3 downto 0), numB(3 downto 0), resultParcial1);
		mult2	:	Multiplicador port map	(numA(3 downto 0), numB(7 downto 4), resultParcial2);
		mult3	:	Multiplicador port map	(numA(3 downto 0), numB(11 downto 8), resultParcial3);
		mult4	:	Multiplicador port map	(numA(3 downto 0), numB(15 downto 12), resultParcial4);
		
		
		
		SomaResultsParciais1 : Soma4Alg port map (carryIn, resultParcial1(7 downto 4), resultParcial2 (3 downto 0), auxResult(3 downto 0), carryOut1);
		SomaResultsParciais2 : Soma4Alg port map (carryOut1, resultParcial2(7 downto 4), resultParcial3 (3 downto 0), auxResult(7 downto 4), carryOut2);
		SomaResultsParciais3 : Soma4Alg port map (carryOut2, resultParcial3(7 downto 4), resultParcial4 (3 downto 0), auxResult(11 downto 8), carryOut3);
		
		linha1 (3 downto 0) 		<= resultParcial1(3 downto 0);
		linha1 (7 downto 4) 		<= auxResult (3 downto 0);
		linha1 (11 downto 8) 	<= auxResult (7 downto 4);
		linha1 (15 downto 12) 	<= auxResult (11 downto 8);
		linha1 (19 downto 16)	<= resultParcial4 (7 downto 4);
		
		result <= linha1;

--		Multi : process (numA, numB) is
--		begin
--		
--			for index 0 to 15
--			
--				
--				
--			end loop;
--		
--		end process SomaResultsParciais;


end MultiplicadorCompletoArch;

