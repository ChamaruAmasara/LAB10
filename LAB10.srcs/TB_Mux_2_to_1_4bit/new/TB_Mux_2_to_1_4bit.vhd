----------------------------------------------------------------------------------
-- Company: 
-- Person: Pabasara Jayasekara
-- 
-- Create Date: 07/23/2022 10:40:58 PM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_4bit - Behavioral
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

entity TB_Mux_2_to_1_4bit is
--  Port ( );
end TB_Mux_2_to_1_4bit;

architecture Behavioral of TB_Mux_2_to_1_4bit is


component Mux_2way_4bit

    Port ( LoadSelect : in STD_LOGIC;
           AddSubUnit4BitOut : in STD_LOGIC_VECTOR (3 downto 0);
           ImmediateValue : in STD_LOGIC_VECTOR (3 downto 0);
    -- enable signal
           EN : in STD_LOGIC;
    -- output
           valueToRegisters : out STD_LOGIC_VECTOR (3 downto 0));

end component;

signal LoadSelect : STD_LOGIC;
signal AddSubUnit4BitOut : STD_LOGIC_VECTOR (3 downto 0);
signal ImmediateValue : STD_LOGIC_VECTOR (3 downto 0);
    --enable signal
signal EN : STD_LOGIC;
    -- output
signal valueToRegisters : STD_LOGIC_VECTOR (3 downto 0);
   
begin

UUT: Mux_2way_4bit

-- LoadSelect will select the register from D1 to D8 it's 3 bit signal    
Port Map( 
    LoadSelect=>LoadSelect,
    AddSubUnit4BitOut=>AddSubUnit4BitOut,
    ImmediateValue=>ImmediateValue,
    EN=>EN,
    valueToRegisters=>valueToRegisters);
    
-- This was programmed by Pabasara Jayasekara with index number 200251X
-- binary representation is 110000111000111011
-- 11 0000 1110 0011 1011

process begin

-- setting 4 digits from my index number for the registers
AddSubUnit4BitOut<="1011";
ImmediateValue<="0011";

EN<='1';
--1011
LoadSelect<='1';
wait for 100ns;

--0011
LoadSelect<='0';
wait for 100ns;


-- setting 4 digits from my index number for the registers
AddSubUnit4BitOut<="1110";
ImmediateValue<="0000";

EN<='1';
--1110
LoadSelect<='1';
wait for 100ns;

--0000
LoadSelect<='0';
wait for 100ns;

wait;

end process;
end Behavioral;
