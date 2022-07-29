----------------------------------------------------------------------------------
-- Company: 
-- Person: Chamaru Amasara
-- 
-- Create Date: 07/23/2022 10:40:58 PM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is


component Mux_8way_4bit

-- RegSel will select the register from D1 to D8 it's 3 bit signal
    Port ( RegSel  : in STD_LOGIC_VECTOR (2 downto 0);
    
    -- 8 registers
           R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);         
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           
   -- enable signal
           EN : in STD_LOGIC;
           
   -- output signal
           Output : out std_logic_vector (3 downto 0));

end component;

   
signal RegSel  : STD_LOGIC_VECTOR (2 downto 0);
signal R0, R1, R2, R3, R4, R5, R6, R7, Output : STD_LOGIC_VECTOR (3 downto 0);
signal EN: STD_LOGIC;

begin

UUT: Mux_8way_4bit

-- RegSel will select the register from D1 to D8 it's 3 bit signal    
Port Map( 
    RegSel=>RegSel,
    -- 8 registers
    R0=>R0,
    R1=>R1,
    R2=>R2,
    R3=>R3,
    R4=>R4,
    R5=>R5,
    R6=>R6,
    R7=>R7,
                
    -- enable signal
    EN=>En,
    -- output signal
    Output=>Output); 
-- This was programmed by Chamaru Amasara with index number 200390V
-- binary representation is 110000111011000110
-- 11 0000 1110 1100 0110

process begin
R0<="0000";
R1<="0001";
R2<="0010";
R3<="0011";
R4<="0100";
R5<="0101";
R6<="0110";
R7<="0111";

--Set Enable=1
EN<='1';

-- This was programmed by Chamaru Amasara with index number 200390V
-- binary representation is 110000111011000110
-- 110 000 111 011 000 110

-- RegSel=111 Selecting Register 7
RegSel<="000";
wait for 100ns;


-- RegSel=111 Selecting Register 7
RegSel<="001";
wait for 100ns;


-- RegSel=111 Selecting Register 7
RegSel<="010";
wait for 100ns;


-- RegSel=111 Selecting Register 7
RegSel<="011";
wait for 100ns;

-- RegSel=111 Selecting Register 7
RegSel<="100";
wait for 100ns;

-- RegSel=111 Selecting Register 7
RegSel<="101";
wait for 100ns;

-- RegSel=111 Selecting Register 7
RegSel<="110";
wait for 100ns;

-- RegSel=111 Selecting Register 7
RegSel<="111";
wait for 100ns;

-- RegSel=111 Selecting Register 7
RegSel<="000";
wait for 100ns;

-- RegSel=111 Selecting Register 7
RegSel<="000";
wait for 100ns;






-- RegSel=111 Selecting Register 7
RegSel<="111";
wait for 100ns;

-- RegSel=000 Selecting Register 0
RegSel<="000";
wait for 100ns;

-- RegSel=011 Selecting Register 3
RegSel<="011";
wait for 100ns;

-- RegSel=110 Selecting Register 6
RegSel<="110";
wait;


end process;
end Behavioral;
