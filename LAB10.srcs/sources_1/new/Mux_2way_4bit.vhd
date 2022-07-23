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

entity Mux_2way_4bit is
    Port ( LoadSelect : in STD_LOGIC;
           AddSubUnit4BitOut : in STD_LOGIC_VECTOR (2 downto 0);
           ImmediateValue : in STD_LOGIC_VECTOR (2 downto 0);
    -- enable signal
           EN : in STD_LOGIC;
    -- output
           valueToRegisters : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2way_4bit;

architecture Behavioral of Mux_2way_4bit is
  
begin
process
    begin
    if EN='1' then
        if (LoadSelect='1') then
            valueToRegisters <= AddSubUnit4BitOut;
        else
            valueToRegisters <= ImmediateValue;
        end if;
    end if;
    wait;
end process;                   
                    


end Behavioral;
