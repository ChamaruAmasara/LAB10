----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.06.2022 13:10:47
-- Design Name: 
-- Module Name: RCA - Behavioral
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


-- 3 bit adder

entity RCA_3 is
    Port ( PreviousAddressPC : in STD_LOGIC_VECTOR (2 downto 0);
           C_IN : in STD_LOGIC;
           NextAddressPC : out STD_LOGIC_VECTOR (2 downto 0);
           C_OUT : out STD_LOGIC);
end RCA_3;

architecture Behavioral of RCA_3 is

component FA
     port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic);
end component;

SIGNAL FA0_C, FA1_C, FA2_C, FA3_C  : std_logic;


begin
 
 FA_0 : FA
     port map (
        A => PreviousAddressPC(0),
        
       -- B is 1 because we are adding 001 always
        B => '1',
        C_in => c_in,
        S => NextAddressPC(0),
        C_Out => FA0_C);
 FA_1 : FA
     port map (
        A => PreviousAddressPC(1),
        -- B is 0 because we are adding 001 always
        B => '0',
        C_in => FA0_C,
        S => NextAddressPC(1),
        C_Out => FA1_C);
 FA_2 : FA
         port map (
        A => PreviousAddressPC(2),
        -- B is 0 because we are adding 001 always
        B => '0',
        C_in => FA1_C,
        S => NextAddressPC(2),
        C_Out => FA2_C);



end Behavioral;
