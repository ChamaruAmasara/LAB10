----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 03:21:23 PM
-- Design Name: 
-- Module Name: Mux_2way_4bit - Behavioral
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

entity Mux_8way_4bit is

-- RegSel will select the register from D1 to D8 it's 3 bit signal
    Port ( RegSel  : in STD_LOGIC_VECTOR (2 downto 0);
    
    -- 8 registers
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           D8 : in STD_LOGIC_VECTOR (3 downto 0);
           
   -- enable signal
           EN : in STD_LOGIC;
           
   -- output signal
           Y : out std_logic_vector (3 downto 0));
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is
    
begin        

-- Based on RegSel the register will be defined and the output will be contents of the selected register
    process
    begin
        if EN='1' then
            if (RegSel="000") then
                Y <= D1;
            elsif (RegSel="001") then
                Y <= D2;
            elsif (RegSel="010") then
                Y <= D3;
            elsif (RegSel="011") then
                Y <= D4;
            elsif (RegSel="100") then
                Y <= D5;
            elsif (RegSel="101") then
                Y <= D6;
            elsif (RegSel="110") then
                Y <= D7;
            else
                Y <= D8;
            end if;
        end if;
        wait;
    end process;
        
                    
                    


end Behavioral;