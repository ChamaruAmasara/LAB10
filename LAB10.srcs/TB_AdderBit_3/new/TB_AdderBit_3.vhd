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

entity TB_AdderBit_3 is
--  Port ( );
end TB_AdderBit_3;

architecture Behavioral of TB_AdderBit_3 is
component AdderBit_3
        Port ( PreviousAddressPC : in STD_LOGIC_VECTOR (2 downto 0);
       NextAddressPC : out STD_LOGIC_VECTOR (2 downto 0);
       C_OUT : out STD_LOGIC);

end component;
    signal PreviousAddressPC,NextAddressPC : STD_LOGIC_VECTOR (2 downto 0);
begin
UUT: AdderBit_3
    PORT MAP(
        PreviousAddressPC=>PreviousAddressPC,
        NextAddressPC=>NextAddressPC
    );
process begin
-- This program was developed by Ginushmal Vikumjith - 200734G - 
-- My Index number in binary is 11 0001 0000 0001 1110
-- Let's test 0011 - 0001= 0010
-- 0001 + 1110 = 1111

--Testing  0011 - 0001= 0010
    PreviousAddressPC<="011";
    WAIT FOR 100ns;
    
    PreviousAddressPC<="111";
    WAIT FOR 100ns;
    
-- Testing 0001 + 1110 = 1111
    PreviousAddressPC<="110";
    WAIT;

end process;
end Behavioral;