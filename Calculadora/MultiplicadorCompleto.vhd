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
	
	----------------------	signals Linha1 ------------------------------
	signal resultParcial1Linha1, resultParcial2Linha1,
	resultParcial3Linha1, resultParcial4Linha1 	:	std_logic_vector (7 downto 0) := (others => '0');
	
	signal auxResultLinha1 : std_logic_vector (31 downto 0) := (others => '0');
	signal linha1 : std_logic_vector (31 downto 0) := (others => '0');
	
	signal carryOut1Linha1, carryOut2Linha1, carryOut3Linha1 : std_logic_vector (0 downto 0) := (others => '0');
	----------------------	signals Linha1 ------------------------------


	---------------------	signals Linha2 ------------------------------
	signal resultParcial1Linha2, resultParcial2Linha2,
	resultParcial3Linha2, resultParcial4Linha2 	:	std_logic_vector (7 downto 0) := (others => '0');
	
	signal auxResultLinha2 : std_logic_vector (31 downto 0) := (others => '0');
	signal linha2 : std_logic_vector (31 downto 0) := (others => '0');
	
	signal carryOut1Linha2, carryOut2Linha2, carryOut3Linha2 : std_logic_vector (0 downto 0) := (others => '0');
	
	----------------------	signals Linha2 ------------------------------
	
	
	----------------------	signals Linha3 ------------------------------
	signal resultParcial1Linha3, resultParcial2Linha3,
	resultParcial3Linha3, resultParcial4Linha3 	:	std_logic_vector (7 downto 0) := (others => '0');
	
	signal auxResultLinha3 : std_logic_vector (31 downto 0) := (others => '0');
	signal linha3 : std_logic_vector (31 downto 0) := (others => '0');
	
	signal carryOut1Linha3, carryOut2Linha3, carryOut3Linha3 : std_logic_vector (0 downto 0) := (others => '0');
	----------------------	signals Linha3 ------------------------------
	
	
	----------------------	signals Linha4 ------------------------------
	signal resultParcial1Linha4, resultParcial2Linha4,
	resultParcial3Linha4, resultParcial4Linha4 	:	std_logic_vector (7 downto 0) := (others => '0');
	
	signal auxResultLinha4 : std_logic_vector (31 downto 0) := (others => '0');
	signal linha4 : std_logic_vector (31 downto 0) := (others => '0');
	
	signal carryOut1Linha4, carryOut2Linha4, carryOut3Linha4 : std_logic_vector (0 downto 0) := (others => '0');
	
	----------------------	signals Linha4 ------------------------------
	
	signal carryIn : std_logic_vector (0 to 0) := (others => '0');
	
	
begin

		----------------------	operacoes Linha1 ------------------------------
		
		mult1 : 	Multiplicador port map	(numA(3 downto 0), numB(3 downto 0), resultParcial1Linha1);
		mult2	:	Multiplicador port map	(numA(3 downto 0), numB(7 downto 4), resultParcial2Linha1);
		mult3	:	Multiplicador port map	(numA(3 downto 0), numB(11 downto 8), resultParcial3Linha1);
		mult4	:	Multiplicador port map	(numA(3 downto 0), numB(15 downto 12), resultParcial4Linha1);
		
		SomaResultsParciais1 : Soma4Alg port map (carryIn, resultParcial1Linha1(7 downto 4), resultParcial2Linha1 (3 downto 0), auxResultLinha1(3 downto 0), carryOut1Linha1);
		SomaResultsParciais2 : Soma4Alg port map (carryOut1Linha1, resultParcial2Linha1(7 downto 4), resultParcial3Linha1 (3 downto 0), auxResultLinha1(7 downto 4), carryOut2Linha1);
		SomaResultsParciais3 : Soma4Alg port map (carryOut2Linha1, resultParcial3Linha1(7 downto 4), resultParcial4Linha1 (3 downto 0), auxResultLinha1(11 downto 8), carryOut3Linha1);
		
		linha1 (3 downto 0) 		<= resultParcial1Linha1(3 downto 0);
		linha1 (7 downto 4) 		<= auxResultLinha1 (3 downto 0);
		linha1 (11 downto 8) 	<= auxResultLinha1 (7 downto 4);
		linha1 (15 downto 12) 	<= auxResultLinha1 (11 downto 8);
		linha1 (19 downto 16)	<= resultParcial4Linha1 (7 downto 4);
		
		----------------------	operacoes Linha1 ------------------------------
		
		----------------------	operacoes Linha2 ------------------------------
		mult5 : Multiplicador port map (numA(11 downto 8), numB(3 downto 0), resultParcial1Linha2);
		mult6 : Multiplicador port map (numA(11  downto 8), numB(7 downto 4), resultParcial2Linha2);
		mult7	: Multiplicador port map (numA(11 downto 8), numB(11 downto 8), resultParcial3Linha2);
		mult8	: Multiplicador port map (numA(11 downto 8), numB(15 downto 12), resultParcial4Linha2);
		
		SomaResultsParciais4 : Soma4Alg port map (carryIn, resultParcial1Linha2(7 downto 4), resultParcial2Linha2 (3 downto 0), auxResultLinha2 (3 downto 0), carryOut1Linha2);
		SomaResultsParciais5	: Soma4Alg port map (carryOut1Linha2, resultParcial2Linha2(7 downto 4), resultParcial3Linha2 (3 downto 0), auxResultLinha2(7 downto 4), carryOut2Linha2);
		SomaResultsParciais6 : Soma4Alg port map (carryOut2Linha2, resultParcial3Linha2(7 downto 4), resultParcial4Linha2(3 downto 0), auxResultLinha2(11 downto 8), carryOut3Linha2);
		
		linha2(3 downto 0) 	<= resultParcial2Linha2 (3 downto 0);
		linha2(7 downto 4)	<= auxResultLinha2(3 downto 0);
		linha2(11 downto 8)	<= auxResultLinha2(7 downto 4);
		linha2(15 downto 12)	<= auxResultLinha2(11 downto 8);
		linha2(19 downto 16)	<=	resultParcial4Linha2 (7 downto 4);
		
		----------------------	operacoes Linha2 ------------------------------
		
		
		----------------------	operacoes Linha3 ------------------------------
		mult9 	: Multiplicador port map (numA(15 downto 12), numB(3 downto 0), resultParcial1Linha3);
		mult10 	: Multiplicador port map (numA(15 downto 12), numB(7 downto 4), resultParcial2Linha3);
		mult11	: Multiplicador port map (numA(15 downto 12), numB(11 downto 8), resultParcial3Linha3);
		mult12	: Multiplicador port map (numA(15 downto 12), numB(15 downto 12), resultParcial4Linha3);
		
		SomaResultsParciais7 : Soma4Alg port map (carryIn, resultParcial1Linha3(7 downto 4), resultParcial2Linha3 (3 downto 0), auxResultLinha3 (3 downto 0), carryOut1Linha3);
		SomaResultsParciais8	: Soma4Alg port map (carryOut1Linha3, resultParcial2Linha3(7 downto 4), resultParcial3Linha3 (3 downto 0), auxResultLinha3(7 downto 4), carryOut2Linha3);
		SomaResultsParciais9 : Soma4Alg port map (carryOut2Linha3, resultParcial3Linha3(7 downto 4), resultParcial4Linha3(3 downto 0), auxResultLinha3(11 downto 8), carryOut3Linha3);
		
		linha3(3 downto 0) 	<= resultParcial2Linha3 (3 downto 0);
		linha3(7 downto 4)	<= auxResultLinha3(3 downto 0);
		linha3(11 downto 8)	<= auxResultLinha3(7 downto 4);
		linha3(15 downto 12)	<= auxResultLinha3(11 downto 8);
		linha3(19 downto 16)	<=	resultParcial4Linha3 (7 downto 4);
		
		----------------------	operacoes Linha3 ------------------------------
		
		----------------------	operacoes Linha4 ------------------------------
		mult13	: Multiplicador port map (numA(15 downto 12), numB(3 downto 0), resultParcial1Linha4);
		mult14 	: Multiplicador port map (numA(15 downto 12), numB(7 downto 4), resultParcial2Linha4);
		mult15	: Multiplicador port map (numA(15 downto 12), numB(11 downto 8), resultParcial3Linha4);
		mult16	: Multiplicador port map (numA(15 downto 12), numB(15 downto 12), resultParcial4Linha4);
		
		SomaResultsParciais10 	: Soma4Alg port map (carryIn, resultParcial1Linha4(7 downto 4), resultParcial2Linha4 (3 downto 0), auxResultLinha4 (3 downto 0), carryOut1Linha4);
		SomaResultsParciais11	: Soma4Alg port map (carryOut1Linha4, resultParcial2Linha4(7 downto 4), resultParcial3Linha4 (3 downto 0), auxResultLinha4(7 downto 4), carryOut2Linha4);
		SomaResultsParciais12 	: Soma4Alg port map (carryOut2Linha4, resultParcial3Linha4(7 downto 4), resultParcial4Linha4(3 downto 0), auxResultLinha4(11 downto 8), carryOut3Linha4);
		
		linha4(3 downto 0) 	<= resultParcial2Linha4 (3 downto 0);
		linha4(7 downto 4)	<= auxResultLinha4(3 downto 0);
		linha4(11 downto 8)	<= auxResultLinha4(7 downto 4);
		linha4(15 downto 12)	<= auxResultLinha4(11 downto 8);
		linha4(19 downto 16)	<=	resultParcial4Linha4 (7 downto 4);
		
		result <= linha4;
		----------------------	operacoes Linha4 ------------------------------

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

