------------------------------------------------------------------
--  lcd.vhd -- general LCD testing program
------------------------------------------------------------------
--  Author -- Dan Pederson, 2004
--			  -- Barron Barnett, 2004
--			  -- Jacob Beck, 2006
------------------------------------------------------------------
--  This module is a test module for implementing read/write and
--  initialization routines for an LCD on the Digilab boards
------------------------------------------------------------------
--  Revision History:								    
--  05/27/2004(DanP):  created
--  07/01/2004(BarronB): (optimized) and added writeDone as output
--  08/12/2004(BarronB): fixed timing issue on the D2SB
--  12/07/2006(JacobB): Revised code to be implemented on a Nexys Board
--				Changed "Hello from Digilent" to be on one line"
--				Added a Shift Left command so that the message
--				"Hello from Diligent" is shifted left by 1 repeatedly
--				Changed the delay of character writes
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity lcd is
    Port ( 	LCD_DB: out std_logic_vector(7 downto 0);		--dados que serao trasmitidos
				RS:out std_logic;  			--comando/caracter
				RW:out std_logic;				--ADR(0) /le/escreve
				CLK:in std_logic;				--GCLK2	50M
				--ADR1:out std_logic;		--ADR(1)
				--ADR2:out std_logic;		--ADR(2)
				--CS:out std_logic;			--CSC
				OE:out std_logic;				--OE
				rst:in std_logic;				--BTN
				keyBoardInput:in std_logic_vector (7 downto 0); -- codigo do teclado
				numeroConfirmado : in	std_logic 
	);		
				--rdone: out std_logic);			--WriteDone output to work with DI05 test
end lcd;

architecture Behavioral of lcd is
			    
------------------------------------------------------------------
--  Component Declarations
------------------------------------------------------------------

------------------------------------------------------------------
--  Local Type Declarations
-----------------------------------------------------------------
--  Symbolic names for all possible states of the state machines.

	--LCD control state machine
	type mstate is (					  
		stFunctionSet,		 			--Initialization states
		stDisplayCtrlSet,
		stDisplayClear,
		stPowerOn_Delay,  				--Delay states
		stFunctionSet_Delay,
		stDisplayCtrlSet_Delay, 	
		stDisplayClear_Delay,
		stInitDne,					--Display charachters and perform standard operations
		stActWr,
		stCharDelay					--Write delay for operations
		--stWait					--Idle state
	);

	--Write control state machine
	type wstate is (
		stRW,						--set up RS and RW
		stEnable,					--set up E
		stIdle						--Write data on DB(0)-DB(7)
	);
	

------------------------------------------------------------------
--  Signal Declarations and Constants
------------------------------------------------------------------
	--These constants are used to initialize the LCD pannel.

	--FunctionSet:
		--Bit 0 and 1 are arbitrary
		--Bit 2:  Displays font type(0=5x8, 1=5x11)
		--Bit 3:  Numbers of display lines (0=1, 1=2)
		--Bit 4:  Data length (0=4 bit, 1=8 bit)
		--Bit 5-7 are set
	--DisplayCtrlSet:
		--Bit 0:  Blinking cursor control (0=off, 1=on)
		--Bit 1:  Cursor (0=off, 1=on)
		--Bit 2:  Display (0=off, 1=on)
		--Bit 3-7 are set
	--DisplayClear:
		--Bit 1-7 are set	
		
	signal clkCount:std_logic_vector(5 downto 0);
	signal activateW:std_logic:= '0';		    			--Activate Write sequence
	signal count:std_logic_vector (16 downto 0):= "00000000000000000";	--15 bit count variable for timing delays
	signal delayOK:std_logic:= '0';						--High when count has reached the right delay time
	signal OneUSClk:std_logic;						--Signal is treated as a 1 MHz clock	
	signal stCur:mstate:= stPowerOn_Delay;					--LCD control state machine
	signal stNext:mstate;			  	
	signal stCurW:wstate:= stIdle; 						--Write control state machine
	signal stNextW:wstate;
	signal writeDone:std_logic:= '0';					--Command set finish
	signal keyDecifrado: integer := 0;
	signal jaRecebiNumero	: std_logic := '0';

	type LCD_CMDS_T is array(integer range <>) of std_logic_vector(9 downto 0);
	constant LCD_CMDS : LCD_CMDS_T := ( 
						
						 0 => "00"&X"3C",			--Function Set
					    1 => "00"&X"0C",			--Display ON, Cursor OFF, Blink OFF
					    2 => "00"&X"01",			--Clear Display
					    3 => "00"&X"02" 		--return home
						 );
						 
	

													
	signal lcd_cmd_ptr : integer range 0 to LCD_CMDS'HIGH + 1 := 0;	--endereco do caractere
	
	type LCD_CMDS_NEW is array(integer range <>) of std_logic_vector(9 downto 0);
	constant LCD_CMDS_NUMERO : LCD_CMDS_NEW := ( 
					    0 => "10"&"00110000", 			--0
					    1 => "10"&"00110001",  		--1
					    2 => "10"&"00110010",  		--2
					    3 => "10"&"00110011", 			--3
					    4 => "10"&"00110100", 			--4
					    5 => "10"&"00110101",  		--5
					    6 => "10"&"00110110", 		--6
					    7 => "10"&"00110111", 		--7
					    8 => "10"&"00111000", 		--8
					    9 => "10"&"00111001", 		--9
						 10 => "10"&"00111111"

						 );
						 

begin
 	
	ConvertKeytoLCDCODE: process (keyBoardInput)
	begin
			if (keyBoardInput = "01000101") then -- 0
				keyDecifrado <= 0;
			elsif (keyBoardInput = "00010110") then	--	1
				keyDecifrado <= 1;
			elsif (keyBoardInput = "00011110") then	--	2
				keyDecifrado <= 2;
			elsif (keyBoardInput = "00100110") then	--	3
				keyDecifrado <= 3;
			elsif (keyBoardInput = "00100101") then	--	4
				keyDecifrado <= 4;
			elsif (keyBoardInput = "00101110") then	--	5
				keyDecifrado <= 5;
			elsif (keyBoardInput = "00110110") then	--	6
				keyDecifrado <= 6;
			elsif (keyBoardInput = "00111101") then	--	7
				keyDecifrado <= 7;
			elsif (keyBoardInput = "00111110") then	--	8
				keyDecifrado <= 8;
			elsif (keyBoardInput = "01000110") then	--	9
				keyDecifrado <= 9;
			else
				keyDecifrado <= 10;
    		end if;
	
	end process ConvertKeytoLCDCODE;
	
	--  This process counts to 50, and then resets.  It is used to divide the clock signal time.
	process (CLK, oneUSClk)
    		begin
			if (CLK = '1' and CLK'event) then
				clkCount <= clkCount + 1;
			end if;
		end process;
	--  This makes oneUSClock peak once every 1 microsecond

	oneUSClk <= clkCount(5);
	--  This process incriments the count variable unless delayOK = 1.
	process (oneUSClk, delayOK)
		begin
			if (oneUSClk = '1' and oneUSClk'event) then
				if delayOK = '1' then
					count <= "00000000000000000";
				else
					count <= count + 1;
				end if;
			end if;
		end process;

	--This goes high when all commands have been run
	writeDone <= '1' when (lcd_cmd_ptr = LCD_CMDS'HIGH) 
		else '0';
	--rdone <= '1' when stCur = stWait else '0';
	--Increments the pointer so the statemachine goes through the commands
	process (lcd_cmd_ptr, oneUSClk)
   		begin
			if (oneUSClk = '1' and oneUSClk'event) then
				if ((stNext = stInitDne or stNext = stDisplayCtrlSet or stNext = stDisplayClear) and writeDone = '0') then 
					lcd_cmd_ptr <= lcd_cmd_ptr + 1;
				elsif stCur = stPowerOn_Delay or stNext = stPowerOn_Delay then
					lcd_cmd_ptr <= 0;
				else
					lcd_cmd_ptr <= lcd_cmd_ptr;
				end if;
			end if;
		end process;

--		process (lcd_cmd_ptr, oneUSClk)
--   		begin
--			if (oneUSClk = '1' and oneUSClk'event) then
--				if stCur = stPowerOn_Delay or stNext = stPowerOn_Delay then
--					lcd_cmd_ptr <= 0;
--				else
--					lcd_cmd_ptr <= 4;--keyDecifrado;		
--				end if;
--			end if;
--		end process;
		
		
		
		bufferTecladoProcess : process (numeroConfirmado) is
		begin
		
			if (numeroConfirmado = '1') then
				jaRecebiNumero <= '1';
			else
				jaRecebiNumero <= '0';
			end if;
		
		end process bufferTecladoProcess;
	
	--  Determines when count has gotten to the right number, depending on the state.

	delayOK <= '1' when ((stCur = stPowerOn_Delay and count = "00100111001010010") or 			--20050  
					(stCur = stFunctionSet_Delay and count = "00000000000110010") or	--50
					(stCur = stDisplayCtrlSet_Delay and count = "00000000000110010") or	--50
					(stCur = stDisplayClear_Delay and count = "00000011001000000") or	--1600
					(stCur = stCharDelay and count = "11111111111111111"))			--Max Delay for character writes and shifts
					--(stCur = stCharDelay and count = "00000000000100101"))		--37  This is proper delay between writes to ram.
		else	'0';
  	
	-- This process runs the LCD status state machine
	process (oneUSClk, rst)
		begin
			if oneUSClk = '1' and oneUSClk'Event then
				if rst = '1' then
					stCur <= stPowerOn_Delay;
				else
					stCur <= stNext;
				end if;
			end if;
		end process;

	
	--  This process generates the sequence of outputs needed to initialize and write to the LCD screen
	process (stCur, delayOK, writeDone, lcd_cmd_ptr)
		begin   
		
			case stCur is
			
				--  Delays the state machine for 20ms which is needed for proper startup.
				when stPowerOn_Delay =>
					if delayOK = '1' then
						stNext <= stFunctionSet;
					else
						stNext <= stPowerOn_Delay;
					end if;
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
					activateW <= '0';

				-- This issuse the function set to the LCD as follows 
				-- 8 bit data length, 2 lines, font is 5x8.
				when stFunctionSet =>
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0); 
					activateW <= '1';	
					stNext <= stFunctionSet_Delay;
				
				--Gives the proper delay of 37us between the function set and
				--the display control set.
				when stFunctionSet_Delay =>
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
					activateW <= '0';
					if delayOK = '1' then
						stNext <= stDisplayCtrlSet;
					else
						stNext <= stFunctionSet_Delay;
					end if;
				
				--Issuse the display control set as follows
				--Display ON,  Cursor OFF, Blinking Cursor OFF.
				when stDisplayCtrlSet =>
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
					activateW <= '1';
					stNext <= stDisplayCtrlSet_Delay;

				--Gives the proper delay of 37us between the display control set
				--and the Display Clear command. 
				when stDisplayCtrlSet_Delay =>
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
					activateW <= '0';
					if delayOK = '1' then
						stNext <= stDisplayClear;
					else
						stNext <= stDisplayCtrlSet_Delay;
					end if;
				
				--Issues the display clear command.
				when stDisplayClear	=>
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0); 
					activateW <= '1';
					stNext <= stDisplayClear_Delay;

				--Gives the proper delay of 1.52ms between the clear command
				--and the state where you are clear to do normal operations.
				when stDisplayClear_Delay =>
					RS <= LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS(lcd_cmd_ptr)(7 downto 0);
					activateW <= '0';
					if (delayOK = '1' and jaRecebiNumero = '1') then
						stNext <= stInitDne;
					else
						stNext <= stDisplayClear_Delay;
					end if;
				
				--State for normal operations for displaying characters, changing the
				--Cursor position etc.
				when stInitDne =>		
					RS <= '1'; --LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= '0'; --LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS_NUMERO(keyDecifrado)(7 downto 0);
					activateW <= '0';
					stNext <= stActWr;

				when stActWr =>		
					RS <= '1'; --LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= '0'; --LCD_CMDS(lcd_cmd_ptr)(8);
					LCD_DB <= LCD_CMDS_NUMERO(keyDecifrado)(7 downto 0); --mud
					activateW <= '1';
					stNext <= stCharDelay;

					
				--Provides a max delay between instructions.
				when stCharDelay =>
					RS <= '1'; --LCD_CMDS(lcd_cmd_ptr)(9);
					RW <= '0'; --LCD_CMDS(lcd_cmd_ptr)(8);;
					LCD_DB <= LCD_CMDS_NUMERO(keyDecifrado)(7 downto 0);
					activateW <= '0';					
					
					if (delayOK = '1' and jaRecebiNumero = '1') then
						stNext <= stInitDne;
					else
						stNext <= stCharDelay;
					end if;
			end case;
		
		end process;					
								   
 	--This process runs the write state machine
	process (oneUSClk, rst)
		begin
			if oneUSClk = '1' and oneUSClk'Event then
				if rst = '1' then
					stCurW <= stIdle;
				else
					stCurW <= stNextW;
				end if;
			end if;
		end process;

	--This genearates the sequence of outputs needed to write to the LCD screen
	process (stCurW, activateW)
		begin   
		
			case stCurW is
				--This sends the address across the bus telling the DIO5 that we are
				--writing to the LCD, in this configuration the adr_lcd(2) controls the
				--enable pin on the LCD
				when stRw =>
					OE <= '0';
					--CS <= '0';
					--ADR2 <= '1';
					--ADR1 <= '0';
					stNextW <= stEnable;
				
				--This adds another clock onto the wait to make sure data is stable on 
				--the bus before enable goes low.  The lcd has an active falling edge 
				--and will write on the fall of enable
				when stEnable => 
					OE <= '0';
					--CS <= '0';
					--ADR2 <= '0';
					--ADR1 <= '0';
					stNextW <= stIdle;
				
				--Waiting for the write command from the instuction state machine
				when stIdle =>
					--ADR2 <= '0';
					--ADR1 <= '0';
					--CS <= '1';
					OE <= '1';
					if activateW = '1' then
						stNextW <= stRw;
					else
						stNextW <= stIdle;
					end if;
				end case;
		end process;
				
end Behavioral;