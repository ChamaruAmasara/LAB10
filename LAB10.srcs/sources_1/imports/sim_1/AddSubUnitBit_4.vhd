----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 09:49:41 PM
-- Design Name: 
-- Module Name: AddSubUnitBit_4 - Behavioral
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

entity AddSubUnitBit_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AddSub_Select : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AddSubUnitBit_4;

architecture Behavioral of AddSubUnitBit_4 is
component FA
    PORT(A : in STD_LOGIC;
         B : in STD_LOGIC;
         C_in : in STD_LOGIC;
         S : out STD_LOGIC;
         C_out : out STD_LOGIC);
end component;

SIGNAL FA0_C, FA1_C, FA2_C:STD_LOGIC;
SIGNAL Bi : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Si : STD_LOGIC_VECTOR (3 downto 0);

begin

Bi(0)<=(B(0) XOR AddSub_Select); 
Bi(1)<=(B(1) XOR AddSub_Select); 
Bi(2)<=(B(2) XOR AddSub_Select); 
Bi(3)<=(B(3) XOR AddSub_Select); 

FA_0 : FA
    PORT MAP (
    A=>A(0),
    B => Bi(0),
    C_in => AddSub_Select,
    S => Si(0),
    C_out=> FA0_C
    );
    
FA_1 : FA
    PORT MAP (
    A=>A(1),
    B => Bi(1),
    C_in => FA0_C,
    S => Si(1),
    C_out=> FA1_C
    );

FA_2 : FA
    PORT MAP (
    A=>A(2),
    B => Bi(2),
    C_in => FA1_C,
    S => Si(2),
    C_out=> FA2_C
    );

FA_3 : FA
    PORT MAP (
    A=>A(3),
    B => Bi(3),
    C_in => FA2_C,
    S => Si(3),
    C_out=> Overflow
    );
S<=Si;
Zero<= NOT(Si(0) OR Si(1) OR Si(2) OR Si(3));
end Behavioral;
