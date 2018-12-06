----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:04 12/06/2018 
-- Design Name: 
-- Module Name:    Calculadora - CalculadoraArch 
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

entity Calculadora is

	port (
	
				clock		: in std_logic;
				resetTeclado : in std_logic;
				ps2d, ps2c: in  std_logic;		-- Dados e clock do teclado
				rd_key_code: in std_logic;
				
				operacao : in std_logic := '0';
				result	: out std_logic_vector (31 downto 0) := (others => '0')
				
				
	);
	
end Calculadora;

architecture CalculadoraArch of Calculadora is

	Component MultiplicadorCompleto is

		port (
			
					numA		:	in std_logic_vector (15 downto 0) := (others => '0');
					numB		:	in std_logic_vector (15 downto 0) := (others => '0');
					result	:	out std_logic_vector (31 downto 0) := (others => '0')	
		);

	end Component;
	
	Component SomaCompleta is

		port (
					numA, numB		:	in 	std_logic_vector 	(15 downto 0) := (others => '0');
					result			:	out 	std_logic_vector	(19 downto 0) := (others => '0')	
		);
		
	end Component;
	
	Component kb_code is
		generic(W_SIZE: integer:=2);  -- 2^W_SIZE words in FIFO
		port (
					clk, reset: in  std_logic;		--clk500M pino reset
					ps2d, ps2c: in  std_logic;		-- Dados e clock do teclado
					rd_key_code: in std_logic;		--	setar que ja escrevi
					key_code: out std_logic_vector(7 downto 0);	-- info da tecla (botar leds)
					kb_buf_empty: out std_logic	--	ja escreveu 
		);
	end Component;

	type estados is (idle, configuraNumeros, selOperacao, resultado);
	signal estadoAtual, estadoAtualTeclado : estados := idle; 
	
	signal resultMultiplicacao : std_logic_vector (31 downto 0) := (others => '0');
	signal resultSoma : std_logic_vector (19 downto 0) := (others => '0');
	
	signal codigoTeclado : std_logic_vector(7 downto 0) := (others => '0');
	signal kb_buf_empty	: std_logic;
	signal numA, numB		: std_logic (15 downto 0) := (others => '0');
	
	signal contador		: integer := 0;
	signal codigoConvertidoTecladoBinario (3 downto 0) := (others => '0');

begin


	teclado		: kb_code port map (clock, resetTeclado, ps2d, ps2c, rd_key_code,codigoTeclado, kb_buf_empty );

	Multiplica 	: MultiplicadorCompleto port map (, , resultMultiplicacao);
	Soma			: SomaCompleta port map (, , resultSoma);
	
	
	ConverterNumeroTeclado : process (codigoTeclado) is
	begin
	
		if (codigoTeclado = x"45") then
		
			codigoConvertidoTecladoBinario <= "0000";
			
		elsif (codigoTeclado = x"16") then
		
			codigoConvertidoTecladoBinario <= "0001";
		
		elsif (codigoTeclado = x"1E") then
		
			codigoConvertidoTecladoBinario <= "0010";
			
		elsif (codigoTeclado = x"26") then
		
			codigoConvertidoTecladoBinario <= "0011";
			
		elsif (codigoTeclado = x"25") then
		
			codigoConvertidoTecladoBinario <= "0100";
			
		elsif (codigoTeclado = x"2E") then
		
			codigoConvertidoTecladoBinario <= "0101";
			
		elsif (codigoTeclado = x"36") then
		
			codigoConvertidoTecladoBinario <= "0110";
			
		elsif (codigoTeclado = x"3D") then
		
			codigoConvertidoTecladoBinario <= "0111";
			
		elsif (codigoTeclado = x"3E") then
		
			codigoConvertidoTecladoBinario <= "1000";
			
		elsif (codigoTeclado = x"46") then
		
			codigoConvertidoTecladoBinario <= "1001";
		
		end if;
	
	end process;
	
	ObterNumerosTeclado : process (codigoTeclado, kb_buf_empty) is -- Armazenar o numero toda vez que o buffer mudar
	begin
		
		case estadoAtualTeclado is
		
			when idle =>
				numA <= x"0000";
				numB <= x"0000";
				
				if (kb_buf_empty = 1) then
					
					estadoAtualTeclado <= configuraNumeros
						
				end if;
				
			when configuraNumeros =>
			
				if (contador = 0) then
				
					numA (3 downto 0)	<= codigoConvertidoTecladoBinario;
				
				elsif (contador = 1) then
				
					numA (7 downto 4)	<= codigoConvertidoTecladoBinario;
				
				elsif (contador = 2) then
				
					numA (11 downto 8)	<= codigoConvertidoTecladoBinario;
					
				elsif (contador = 3) then
				
					numA (15 downto 12)	<= codigoConvertidoTecladoBinario;
					
				elsif (contador = 4) then
				
					numB (3 downto 0)	<= codigoConvertidoTecladoBinario;
					
				elsif (contador = 5) then
				
					numB (7 downto 4)	<= codigoConvertidoTecladoBinario;
					
				elsif (contador = 6) then
				
					numB (11 downto 8)	<= codigoConvertidoTecladoBinario;
				
				elsif (contador = 7) then
				
					numB (15 downto 12)	<= codigoConvertidoTecladoBinario;
					contador = 0;			
					
				end if;
				
				contador = contador + 1;
				
		end case;
	
	
	end process ObterNumerosTeclado;

	CalcProcess : process (numA, numB, operacao) is 
	begin
	
		case (estadoAtual) is
		
			when idle =>
			
			when configuraNumeros =>
			
			when selOperacao =>
			
					if (operacao = '0') then
						
						result	<= X"000"&resultSoma;
					
					else
					
						result <= resultMultiplicacao;
					
					end if;
					
			when resultado =>
		
		end case;
		
		
	
	
	end process CalcProcess;


end CalculadoraArch;

