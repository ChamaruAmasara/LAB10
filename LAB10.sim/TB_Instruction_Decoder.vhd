----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 10:14:33 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
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
end component;
signal Instruction_Bus :STD_LOGIC_VECTOR (11 downto 0);
signal  Reg_Check_for_Jump,Immediate_value : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Enable, Register_select_01, Register_select_02, Address_to_jump :STD_LOGIC_VECTOR (2 downto 0);
signal  Load_Select :STD_LOGIC;
signal  ADD_SUB_Select : STD_LOGIC;
signal  Jump_Flag : STD_LOGIC;
      
begin
UUT: Instruction_Decoder
port map(
Instruction_Bus=>Instruction_Bus,
Reg_Check_for_Jump=>Reg_Check_for_Jump,
Immediate_value=>Immediate_value,
Reg_Enable=>Reg_Enable,
Register_select_01=>Register_select_01,
Register_select_02=>Register_select_02,
Address_to_jump=>Address_to_jump,
Load_Select=>Load_Select,
ADD_SUB_Select=>ADD_SUB_Select,
Jump_Flag=>Jump_Flag
);
process
begin


Instruction_Bus<="100010001010";
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="100100000001";
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="010100000000"; --2
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="000010100000"; --3
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="110010000111"; --4
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="110000000011"; --5
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="111111111111"; --6
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="111111111111"; --7
Reg_Check_for_Jump<="0001";
wait for 100ns;

Instruction_Bus<="000010100000"; --3
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="000010100000"; --3
Reg_Check_for_Jump<="0000";
wait for 100ns;

Instruction_Bus<="110010000111"; --4
Reg_Check_for_Jump<="0000";
wait ;
end process;
end Behavioral;
