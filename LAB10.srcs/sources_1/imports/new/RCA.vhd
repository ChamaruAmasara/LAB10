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
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end AddSubUnitBit_4;

architecture Behavioral of AddSubUnitBit_4 is
component FA
    PORT(A : in STD_LOGIC;
         B : in STD_LOGIC;
         C_in : in STD_LOGIC;
         S : out STD_LOGIC;
         C_out : out STD_LOGIC);
end component;

SIGNAL FA0_S, FA0_C,FA1_S, FA1_C,FA2_S, FA2_C:STD_LOGIC;

begin

FA_0 : FA
    PORT MAP (
    A=>A0,
    B => B0,
    C_in => '0',
    S => S0,
    C_out=> FA0_C
    );
    
FA_1 : FA
    PORT MAP (
A=>A1,
B => B1,
C_in => FA0_C,
S => S1,
C_out=> FA1_C
);

FA_2 : FA
    PORT MAP (
A=>A2,
B => B2,
C_in => FA1_C,
S => S2,
C_out=> FA2_C
);

FA_3 : FA
    PORT MAP (
A=>A3,
B => B3,
C_in => FA2_C,
S => S3,
C_out=> C_out
);

end Behavioral;
