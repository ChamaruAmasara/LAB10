----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:41:04 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal sevenSegment_ROM : rom_type := (
                                        "100010001010", -- 0
                                        "100100000001", -- 1
                                        "010100000000", -- 2
                                        "000010100000", -- 3
                                        "110010000111", -- 4
                                        "110000000011", -- 5
                                                                                "111111111111", -- 6
                                                                                "111111111111" -- 7
                                                                       --         ,"111111111111" -- 7
                                        );

begin

Instruction_Bus <= sevenSegment_ROM(to_integer(unsigned(Memory_Select)));



end Behavioral;
