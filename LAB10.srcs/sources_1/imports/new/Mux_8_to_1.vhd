----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 03:21:23 PM
-- Design Name: 
-- Module Name: Mux_2way_3bit - Behavioral
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

entity Mux_2way_3bit is
    Port ( S : in STD_LOGIC;
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           D2 : in std_logic_vector (2 downto 0);
           EN : in STD_LOGIC;
           Y : out std_logic_vector (2 downto 0));
end Mux_2way_3bit;

architecture Behavioral of Mux_2way_3bit is
  
begin
process
    begin
    if (S='0') then
        Y <= D1;
    else
        Y <= D2;
    end if;
    wait;
end process;                   
                    


end Behavioral;
