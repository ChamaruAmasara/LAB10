----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 03:35:24 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check_for_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enable : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC;
           Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Register_select_01 : out STD_LOGIC_VECTOR (2 downto 0);
           Register_select_02 : out STD_LOGIC_VECTOR (2 downto 0);
           ADD_SUB_Select : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Address_to_jump : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal Instruction_Select : STD_LOGIC_VECTOR (1 downto 0);
begin

--getting the num for Selecting the instruction
Instruction_Select<=Instruction_Bus(11 downto 10);

case Instruction_Select is  --Selecting the instruction
    when "00"=>
    --Add values in registers Ra and Rb and store the result in Ra
    Register_select_01<=Instruction_Bus(9 downto 7);
    Register_select_02<=Instruction_Bus(6 downto 4);
    ADD_SUB_Select<='0';
    Reg_Enable<=Instruction_Bus(9 downto 7);
    
    when "01"=>
    --2's complement of registers R
    Register_select_01<="000";
    Register_select_02<=Instruction_Bus(9 downto 7);
    ADD_SUB_Select<='1';
    Reg_Enable<=Instruction_Bus(9 downto 7);
    
    
    when "10"=>
    --Move immediate value d to register R
    Immediate_value<=Instruction_Bus(3 downto 0);
    Reg_Enable<=Instruction_Bus(9 downto 7);
    
    when "11"=>
    
end case;



end Behavioral;
