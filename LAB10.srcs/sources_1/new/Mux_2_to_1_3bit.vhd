----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Pabasara Jayasekara
-- 
-- Create Date: 07/25/2022 08:32:21 PM
-- Design Name: 
-- Module Name: Mux_2_to_1_3bit - Behavioral
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
    Port ( JumpFlag : in STD_LOGIC;
           EN : in STD_LOGIC;
           AddressToJump : in STD_LOGIC_VECTOR (2 downto 0);
           Adder_3bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           ToNextProgramCounter : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2way_3bit;

architecture Behavioral of Mux_2way_3bit is

begin

ToNextProgramCounter<=AddressToJump WHEN (JumpFlag='1') ELSE Adder_3bit_out;

end Behavioral;
