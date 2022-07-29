----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2022 01:50:17 AM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
    Port ( Clk_In : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out std_logic;
           Zero : out std_logic;
           S_7Seg_out: out std_logic_vector(6 downto 0);
           R7_out: out std_logic_vector(3 downto 0);
           anode_out: out std_logic_vector(3 downto 0));
           
end Processor;

architecture Behavioral of Processor is

component R7_7_seg 
   Port ( 
    R7 : in std_logic_vector (3 downto 0);
    S_7Seg : out std_logic_vector (6 downto 0);
    anode : out std_logic_vector (3 downto 0)
   );
end component;

component Register_bank
    Port (
        Clk: in STD_LOGIC;
        Reg_en : in std_logic_vector (2 downto 0);
        D : in std_logic_vector (3 downto 0);
                    -- 8 registers
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);         
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
         Reset : in STD_LOGIC
     );
end component;


component Mux_2way_3bit is
    Port ( JumpFlag : in STD_LOGIC;
           EN : in STD_LOGIC;
           AddressToJump : in STD_LOGIC_VECTOR (2 downto 0);
           Adder_3bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           ToNextProgramCounter : out STD_LOGIC_VECTOR (2 downto 0));
end component;



component Mux_2way_4bit is
    Port ( LoadSelect : in STD_LOGIC;
           AddSubUnit4BitOut : in STD_LOGIC_VECTOR (3 downto 0);
           ImmediateValue : in STD_LOGIC_VECTOR (3 downto 0);
    -- enable signal
           EN : in STD_LOGIC;
    -- output
           valueToRegisters : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_8way_4bit is

-- RegSel will select the register from D1 to D8 it's 3 bit signal
    Port ( RegSel  : in STD_LOGIC_VECTOR (2 downto 0);
    
    -- 8 registers
           R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);         
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           
   -- enable signal
           EN : in STD_LOGIC;
           
   -- output signal
           Output : out std_logic_vector (3 downto 0));
end component;

component AddSubUnitBit_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           AddSub_Select : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component Instruction_Decoder is
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

component Program_ROM
    Port ( Memory_Select : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component AdderBit_3 is
    Port ( PreviousAddressPC : in STD_LOGIC_VECTOR (2 downto 0);
           NextAddressPC : out STD_LOGIC_VECTOR (2 downto 0);
           C_OUT : out STD_LOGIC);
end component;


component Program_counter is
    Port ( Mux_2way3_bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end component;

--slow clock added
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;


--clock signals added
signal Clk_slow:STD_LOGIC;
signal Clk: STD_LOGIC;
--register bank signals
signal Reg_en : std_logic_vector (2 downto 0);


 
        signal     LoadSelect : STD_LOGIC;
        signal       AddSubUnit4BitOut : STD_LOGIC_VECTOR (3 downto 0);
        signal       ImmediateValue : STD_LOGIC_VECTOR (3 downto 0);
 -- enable signal
        signal       EN : STD_LOGIC;
-- output
        signal      valueToRegisters: STD_LOGIC_VECTOR (3 downto 0);

    

    



        -- 8 registers
        signal       R0 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R1 : STD_LOGIC_VECTOR (3 downto 0);         
        signal       R2 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R3 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R4 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R5 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R6 : STD_LOGIC_VECTOR (3 downto 0);
        signal       R7 : STD_LOGIC_VECTOR (3 downto 0);
        

        
       -- output signal
        signal       Output: std_logic_vector (3 downto 0);

    

        signal A : STD_LOGIC_VECTOR (3 downto 0);
        signal       B : STD_LOGIC_VECTOR (3 downto 0);
        signal       AddSub_Select : STD_LOGIC;

    

        signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
        signal       Reg_Check_for_Jump : STD_LOGIC_VECTOR (3 downto 0);
        signal       Reg_Enable: STD_LOGIC_VECTOR (2 downto 0);
        signal       Load_Select: STD_LOGIC;
        signal       Immediate_value: STD_LOGIC_VECTOR (3 downto 0);
        signal       Register_select_01: STD_LOGIC_VECTOR (2 downto 0);
        signal       Register_select_02: STD_LOGIC_VECTOR (2 downto 0);
        signal       ADD_SUB_Select: STD_LOGIC;
        signal       Jump_Flag: STD_LOGIC;
        signal       Address_to_jump: STD_LOGIC_VECTOR (2 downto 0);

    

        signal Memory_Select : STD_LOGIC_VECTOR (2 downto 0):="000";
   

        signal PreviousAddressPC : STD_LOGIC_VECTOR (2 downto 0);
        signal       NextAddressPC: STD_LOGIC_VECTOR (2 downto 0);
        signal       C_OUT: STD_LOGIC;

    
    

        signal Mux_2way3_bit_out : STD_LOGIC_VECTOR (2 downto 0);
        signal       MemorySelect: STD_LOGIC_VECTOR (2 downto 0);
        
        signal JumpFlag : STD_LOGIC;
        signal        AddressToJump : STD_LOGIC_VECTOR (2 downto 0);
        signal        Adder_3bit_out : STD_LOGIC_VECTOR (2 downto 0);
        signal        ToNextProgramCounter : STD_LOGIC_VECTOR (2 downto 0);
        


begin
    Slow_Clk0:Slow_Clk
PORT MAP(
        Clk_in=>Clk_In,
        Clk_out=>Clk);
        
 Register_bank0: Register_bank
 Port MAP (
            Clk=>Clk,
             Reg_en =>Reg_Enable,
             D =>valueToRegisters,
             Reset=>Reset,
             R0=>R0,
             R1=>R1,
             R2=>R2,
             R3=>R3,
             R4=>R4,
             R5=>R5,
             R6=>R6,
             R7=>R7            
             );
        
        
        
        Mux_2way_3bit0: Mux_2way_3bit 
            Port MAP( JumpFlag =>Jump_Flag,
                   EN =>EN,
                   AddressToJump =>Address_to_jump,
                   Adder_3bit_out =>NextAddressPC,
                   ToNextProgramCounter  =>ToNextProgramCounter);

        
        
        
                   Mux_2way_4bit0: Mux_2way_4bit 
            Port MAP(LoadSelect =>Load_Select,
                   AddSubUnit4BitOut =>AddSubUnit4BitOut,
                   ImmediateValue =>Immediate_value,
            -- enable signal
                   EN =>EN,
            -- output
                   valueToRegisters =>valueToRegisters);
        
                   Mux_8way_4bit1: Mux_8way_4bit 
        
        -- RegSel will select the register from D1 to D8 it's 3 bit signal
            Port MAP(RegSel  =>Register_select_01,
            
            -- 8 registers
                   R0 =>R0,
                   R1 =>R1,         
                   R2 =>R2,
                   R3 =>R3,
                   R4 =>R4,
                   R5 =>R5,
                   R6 =>R6,
                   R7 =>R7,
                   
           -- enable signal
                   EN =>EN,
                   
           -- output signal - wam paththe input eka - register check for jump
                   Output  =>A);
                   
                    Mux_8way_4bit2: Mux_8way_4bit 
                          
                          -- RegSel will select the register from D1 to D8 it's 3 bit signal
                              Port MAP(RegSel  =>Register_select_02,
                              
                              -- 8 registers
                                     R0 =>R0,
                                     R1 =>R1,         
                                     R2 =>R2,
                                     R3 =>R3,
                                     R4 =>R4,
                                     R5 =>R5,
                                     R6 =>R6,
                                     R7 =>R7,
                                     
                             -- enable signal 
                                     EN =>EN,
                                     
                             -- output signal dakune mux input 
                                     Output  =>B);
        
        
                   AddSubUnitBit_40: AddSubUnitBit_4 
            Port MAP(
            --wam paththe input eka - register check for jump
            A =>A,
            --dakune mux input eka - 
                   B =>B,
                   AddSub_Select =>ADD_SUB_Select,
                   S  =>AddSubUnit4BitOut ,
                   Overflow =>Overflow,
                   Zero =>Zero);
        
        
                   Instruction_Decoder0: Instruction_Decoder 
            Port MAP(Instruction_Bus =>Instruction_Bus,
                   Reg_Check_for_Jump =>B,
                   Reg_Enable =>Reg_Enable,
                   Load_Select =>Load_Select,
                   Immediate_value  =>Immediate_value,
                   Register_select_01 =>Register_select_01,
                   Register_select_02 =>Register_select_02,
                   ADD_SUB_Select =>ADD_SUB_Select,
                   Jump_Flag  =>Jump_Flag,
                   Address_to_jump  =>Address_to_jump);
        
        
                   Program_ROM0: Program_ROM
            Port MAP(Memory_Select =>MemorySelect,
               Instruction_Bus =>Instruction_Bus);
        
        
               AdderBit_30: AdderBit_3 
            Port MAP(PreviousAddressPC =>MemorySelect,
                   NextAddressPC =>NextAddressPC,
                   C_OUT =>C_OUT);
        
        
        
                   Program_counter0: Program_counter 
            Port MAP(Mux_2way3_bit_out =>ToNextProgramCounter,
                   En =>En,
                   Reset =>Reset,
                   Clk =>Clk,
                   MemorySelect =>MemorySelect);
                   
                   R7_7_seg_0: R7_7_seg 
                      Port map( 
                       R7=>R7,
                       S_7Seg=>S_7Seg_out,
                       anode=>anode_out
                      );
       
        EN<='1';
        R7_out<=R7;
end Behavioral;
