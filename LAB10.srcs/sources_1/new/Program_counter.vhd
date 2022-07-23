----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/16/2022 02:34:25 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Program_counter is
    Port ( Mux_2way3_bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end Program_counter;

architecture Behavioral of Program_counter is

begin
    process(Clk)
    begin
        if (rising_edge(Clk)) then -- respond when clock rises
                if (Reset = '1') then -- reset the D flip flop
                    MemorySelect <= "0000";
                else 
                    if (En = '1') then -- Enable should be set
                        MemorySelect <= Mux_2way3_bit_out;
                    end if;
                end if;                
                
         end if;
     end process;
end Behavioral;
