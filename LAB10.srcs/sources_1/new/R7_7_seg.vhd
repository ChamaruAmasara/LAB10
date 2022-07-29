----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 12:03:11 AM
-- Design Name: 
-- Module Name: R7_7_seg - Behavioral
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

entity R7_7_seg is
   Port ( 
    R7 : in std_logic_vector (3 downto 0);
    S_7Seg : out std_logic_vector (6 downto 0);
    anode : out std_logic_vector (3 downto 0)
   );
end R7_7_seg;

architecture Behavioral of R7_7_seg is

component LUT_16_7
    port(
        address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

begin
LUT_16_7_0 : LUT_16_7
port map(
    address=>R7,
    data=>S_7Seg
);
anode<="1110";
end Behavioral;
