----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:42 11/28/2018 
-- Design Name: 
-- Module Name:    SomaCompleta - SomaCompletaArch 
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

entity SomaCompleta is

	port (
				numA, numB		:	in 	std_logic_vector 	(15 downto 0) := (others => '0');
				result			:	out 	std_logic_vector	(19 downto 0) := (others => '0')
	
	);

end SomaCompleta;

architecture SomaCompletaArch of SomaCompleta is

	component Soma4Alg is
		port (
				carryIn				: 	in std_logic_vector (0 to 0) := (others => '0');
				numA					:	in std_logic_vector (3 downto 0) := (others => '0');
				numB					:	in std_logic_vector (3 downto 0) := (others => '0');
				result				:	out std_logic_vector (3 downto 0) := (others => '0');
				carryOutSaida		:	out std_logic_vector (0 to 0) := (others => '0')
		);

	end component;
	
	signal resultParcial :  std_logic_vector (19 downto 0) := (others => '0');
	signal carryOut1, carryOut2, carryOut3, carryOut4: std_logic_vector (0 to 0) := (others => '0');
	signal carryIn1	: std_logic_vector (0 to 0) := (others => '0');

begin

	soma1	: Soma4Alg port map (carryIn1, numA(3 downto 0), numB (3 downto 0), resultParcial(3 downto 0), carryOut1);
	soma2	: Soma4Alg port map (carryOut1, numA(7 downto 4), numB (7 downto 4), resultParcial(7 downto 4), carryOut2);
	soma3	: Soma4Alg port map (carryOut2, numA(11 downto 8), numB (11 downto 8), resultParcial(11 downto 8), carryOut3);
	soma4	: Soma4Alg port map (carryOut3, numA(15 downto 12), numB (15 downto 12), resultParcial(15 downto 12), carryOut4);

	result(15 downto 0) <= resultParcial(15 downto 0);
	result(16) <= carryOut4(0);

end SomaCompletaArch;
