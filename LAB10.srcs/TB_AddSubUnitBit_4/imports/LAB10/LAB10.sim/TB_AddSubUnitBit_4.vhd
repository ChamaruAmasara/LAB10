----------------------------------------------------------------------------------
-- Company: University of Moratuwa
-- Engineer: Ginushmal Vikumkith - 200734G
-- 
-- Create Date: 07/07/2022 07:13:45 PM
-- Design Name: 
-- Module Name: TB_AddSubUnitBit_4 - Behavioral
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

entity TB_AddSubUnitBit_4 is
--  Port ( );
end TB_AddSubUnitBit_4;

architecture Behavioral of TB_AddSubUnitBit_4 is
component AddSubUnitBit_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       AddSub_Select : in STD_LOGIC;
-- If substraction, 1
-- If addition 0
       S : out STD_LOGIC_VECTOR (3 downto 0);
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;
    signal A,B,S : STD_LOGIC_VECTOR (3 downto 0);
    signal Overflow,Zero,AddSub_Select :  STD_LOGIC:='0';
begin
UUT: AddSubUnitBit_4
    PORT MAP(
        A=>A,
        B=>B,
        S=>S,
        Overflow=>Overflow,
        Zero=>Zero,
        AddSub_Select=>AddSub_Select
    );
process begin
-- This program was developed by Ginushmal Vikumjith - 200734G - 
-- My Index number in binary is 11 0001 0000 0001 1110
-- Let's test 0011 - 0001= 0010
-- 0001 + 1110 = 1111

--Testing  0011 - 0001= 0010
    A<="0011";
    B<="0001";
    -- because we have to subtract AddSub_Select=1
    AddSub_Select<='1';
    WAIT FOR 100ns;
    
-- Testing 0001 + 1110 = 1111
    A<="0110";
    B<="1001";
    -- because we have to add AddSub_Select=0
    AddSub_Select<='0';
    WAIT;

end process;
end Behavioral;