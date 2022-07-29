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

component Decoder_2_to_4 
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
          EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

 Signal MOVI,ADD,NEG,JZR : STD_LOGIC;
 Signal StatusOfReg : STD_LOGIC;  
 
 begin
 
 Decoder_2_to_4_0 : Decoder_2_to_4 
     port map(
     I(0) => Instruction_Bus(10),
     I(1) => Instruction_Bus(11),
     EN => '1',
     Y(0)=> ADD,
     Y(1) => NEG,
     Y(2) => MOVI,
     Y(3) => JZR);
-- If load_Select = 1 addsubunit will be selected if  load_Select = 0 immediate value will be selected
Load_Select <= ADD OR NEG;
ADD_SUB_Select <= NEG;
Jump_Flag <= JZR AND (NOT(Reg_Check_for_Jump(0) OR Reg_Check_for_Jump(1) OR Reg_Check_for_Jump(2) OR  Reg_Check_for_Jump(3) ) );
StatusOfReg <= MOVI OR ADD OR NEG;

--Reg_Enable <= Instruction_Bus(9 downto 7) WHEN StatusOfReg='1' ELSE "000";

Reg_Enable(0) <= StatusOfReg AND Instruction_Bus(7);
Reg_Enable(1) <= StatusOfReg AND Instruction_Bus(8);
Reg_Enable(2) <= StatusOfReg AND Instruction_Bus(9); 

Address_to_jump <= Instruction_Bus(2 downto 0);
Immediate_value <= Instruction_Bus(3 downto 0);

--needed only in addition negation?
Register_select_02 <= Instruction_Bus(9 downto 7);
Register_select_01 <= Instruction_Bus(6 downto 4);

end Behavioral;

--
--signal Instruction_Select : STD_LOGIC_VECTOR (1 downto 0);
--begin

--getting the num for Selecting the instruction
--Instruction_Select<=Instruction_Bus(11 downto 10);
--process begin
--case Instruction_Select is  --Selecting the instruction
--    when "00"=>
    --Add values in registers Ra and Rb and store the result in Ra
--    Register_select_01<=Instruction_Bus(9 downto 7);
--    Register_select_02<=Instruction_Bus(6 downto 4);
--    ADD_SUB_Select<='0';
--    Load_Select<='1'; --if 1 selecty the output of 4 bit addsub, if 0 select imediate value
--    Reg_Enable<=Instruction_Bus(9 downto 7);
    
--    when "01"=>
    --2's complement of registers R
--    Register_select_01<="000";
--    Register_select_02<=Instruction_Bus(9 downto 7);
--    ADD_SUB_Select<='1';
--    Load_Select<='1';
--    Reg_Enable<=Instruction_Bus(9 downto 7);
    
    
--    when "10"=>
    --Move immediate value d to register R
--    Immediate_value<=Instruction_Bus(3 downto 0);
--    Load_Select<='0';
--    Reg_Enable<=Instruction_Bus(9 downto 7);
    
--    when "11"=>
--    Register_select_01<=Instruction_Bus(9 downto 7);
--    if(Reg_Check_for_Jump="0000") then
--        Jump_Flag<='1';
--        Address_to_jump<=Instruction_Bus(2 downto 0);
--    else
--        Jump_Flag<='0';
--    end if;
--end case;
--wait;
--end process;
--end Behavioral;
