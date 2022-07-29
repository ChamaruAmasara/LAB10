----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 01:50:17 AM
-- Design Name: 
-- Module Name: TB_Processor - Behavioral
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

entity TB_Processor is

end TB_Processor;


architecture Behavioral of TB_Processor is
component Processor
    Port ( Clk_In : in STD_LOGIC;
       Reset : in STD_LOGIC;
       OverFlow : out std_logic;
       Zero : out std_logic);
end component;
signal Clk:STD_LOGIC:='0';
signal Reset, Overflow, Zero: std_logic;
begin
UUT: Processor
PORT MAP(
    Clk_In=>Clk,
       Reset=>Reset,
       OverFlow=>OverFlow,
       Zero=>Zero
);
process
begin
wait for 4ns;
Clk<=not(Clk);
end process;

process
begin
Reset<='1';
wait for 100ns;

Reset<='0';
wait;

end process;

end Behavioral;
