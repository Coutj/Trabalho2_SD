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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calculadora is

	port (
	
				numTeclado : out std_logic_vector (7 downto 0); --mostrar resultado nos leds
	
				clock		: in std_logic;
				resetTeclado : in std_logic;	-- esquerda
				ps2d, ps2c: in  std_logic;		-- Dados e clock do teclado
				rd_key_code: in std_logic;		-- direita
				
				LCD_DB: out std_logic_vector(7 downto 0);		--dados que serao trasmitidos
				RS:out std_logic;  			--comando/caracter
				RW:out std_logic;				--ADR(0) /le/escreve
				OE:out std_logic;				--OE
				rstLCD:in std_logic;				--cima
				
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
	
	Component lcd is
		Port ( 	LCD_DB: out std_logic_vector(7 downto 0);		--dados que serao trasmitidos
					RS:out std_logic;  			--comando/caracter
					RW:out std_logic;				--ADR(0) /le/escreve
					CLK:in std_logic;				--GCLK2	50M
					OE:out std_logic;				--OE
					rst:in std_logic;				--BTN
					keyBoardInput:in std_logic_vector (7 downto 0); -- codigo do teclado
					numeroConfirmado : in	std_logic 
		);		
	end Component;

	type estados is (idle, selOperacao, resultado);
	signal estadoAtual : estados := idle; 
	
	type estadosTeclado is (idle, configuraNumeros, delayTeclado);
	signal estadoAtualTeclado : estadosTeclado := idle;
	
	signal resultMultiplicacao : std_logic_vector (31 downto 0) := (others => '0');
	signal resultSoma : std_logic_vector (19 downto 0) := (others => '0');
	
	signal codigoTeclado : std_logic_vector(7 downto 0) := (others => '0');
	signal kb_buf_empty	: std_logic;
	signal numA, numB		: std_logic_vector (15 downto 0) := (others => '0');
	
	signal contador		: integer := 0;
	signal codigoConvertidoTecladoBinario : std_logic_vector (3 downto 0) := (others => '0');
	signal recebeuNumeros : std_logic := '0';
	
	signal count:std_logic_vector (25 downto 0):= (others => '0');	--15 bit count variable for timing delays
	signal delayOK : std_logic := '0';
	signal OneUSClk:std_logic;
	signal clkCount:std_logic_vector(5 downto 0);
	signal startDelay:std_logic;

begin

		process (clock, oneUSClk)
    		begin
			if (clock = '1' and clock'event) then
				clkCount <= clkCount + 1;
			end if;
		end process;
		
		oneUSClk <= clkCount(5);
		
		process (oneUSClk, delayOK)
		begin
			if (oneUSClk = '1' and oneUSClk'event) then
				if delayOK = '1' then
					count <= "00000000000000000000000000";
				else
					count <= count + 1;
				end if;
			end if;
		end process;
		
		
		delayOK <= '1' when ( count = "00000011001111111111111111"	or startDelay = '1')
							else	'0';


	numTeclado <= x"0" & codigoConvertidoTecladoBinario;
	
	teclado		: kb_code port map (clock, resetTeclado, ps2d, ps2c, rd_key_code, codigoTeclado, kb_buf_empty );
	portLcd		: lcd		 port map (LCD_DB, RS, RW, clock, OE, rstLCD, codigoTeclado, rd_key_code);

	Multiplica 	: MultiplicadorCompleto port map (numA, numB , resultMultiplicacao);
	Soma			: SomaCompleta port map (numA, numB, resultSoma);
	
	
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
	
	ObterNumerosTeclado : process (delayOK) is -- Armazenar o numero toda vez que o numero for confirmado
	begin
		
		case estadoAtualTeclado is
		
			when idle =>
--				numA <= x"0000";
--				numB <= x"0000";
				
				if (rd_key_code = '1') then
					
					estadoAtualTeclado <= configuraNumeros;
					startDelay <= '1';
					
				else
				
					estadoAtualTeclado <= idle;
					
				end if;
				
			when configuraNumeros =>
					
				startDelay <= '0';
					
				if (contador = 3) then
					numA (3 downto 0)	<= codigoConvertidoTecladoBinario;				
				
				elsif (contador = 2) then				
					numA (7 downto 4)	<= codigoConvertidoTecladoBinario;
				
				elsif (contador = 1) then
				
					numA (11 downto 8)	<= codigoConvertidoTecladoBinario;
				
				elsif (contador = 0) then
				
					numA (15 downto 12)	<= codigoConvertidoTecladoBinario;
					
				elsif (contador = 7) then
				
					numB (3 downto 0)	<= codigoConvertidoTecladoBinario;
					contador <= 0;
					recebeuNumeros <= '1';
					
				elsif (contador = 6) then
				
					numB (7 downto 4)	<= codigoConvertidoTecladoBinario;
			
				elsif (contador = 5) then
				
					numB (11 downto 8)	<= codigoConvertidoTecladoBinario;
				
				elsif (contador = 4) then
				
					numB (15 downto 12)	<= codigoConvertidoTecladoBinario;
					
					
				end if;
				
				
				
				estadoAtualTeclado <= delayTeclado;
				
				
				
			when delayTeclado =>
				
				if (delayOK = '1') then
				
					estadoAtualTeclado <= idle;
					contador <= contador + 1;
					
				else
					estadoAtualTeclado <= delayTeclado;
							
				end if;
				
				
		end case;
	
	end process ObterNumerosTeclado;
	

	CalcProcess : process (numA, numB, operacao) is 
	begin
	
		case (estadoAtual) is
		
			when idle =>
			
				if (recebeuNumeros = '1') then
					estadoAtual <= selOperacao;
				end if;		
						
			when selOperacao =>
			
				if (operacao = '0') then
						
					result	<= X"000"&resultSoma;
					
				else
					
					result <= resultMultiplicacao;
					
				end if;
					
				estadoAtual <= resultado;
					
			when resultado =>
			
				
		
		end case;
		
	
	end process CalcProcess;


end CalculadoraArch;