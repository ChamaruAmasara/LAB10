----------------------------------------------------------------------------------
-- Company: 
-- Person: Pabasara Jayasekara
-- 
-- Create Date: 07/23/2022 10:40:58 PM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_3bit - Behavioral
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

entity TB_Mux_2_to_1_3bit is
--  Port ( );
end TB_Mux_2_to_1_3bit;

architecture Behavioral of TB_Mux_2_to_1_3bit is


component Mux_2way_3bit

    Port ( JumpFlag : in STD_LOGIC;
           AddressToJump : in STD_LOGIC_VECTOR (2 downto 0);
           Adder_3bit_out : in STD_LOGIC_VECTOR (2 downto 0);
           ToNextProgramCounter : out STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC);

end component;

signal JumpFlag, EN : STD_LOGIC;
signal AddressToJump : STD_LOGIC_VECTOR (2 downto 0);
signal Adder_3bit_out : STD_LOGIC_VECTOR (2 downto 0);
signal ToNextProgramCounter : STD_LOGIC_VECTOR (2 downto 0);


begin

UUT: Mux_2way_3bit

-- LoadSelect will select the register from D1 to D8 it's 3 bit signal    
Port Map( 
    JumpFlag=>JumpFlag,
    AddressToJump=>AddressToJump,
    Adder_3bit_out=>Adder_3bit_out,
    EN=>EN,
    ToNextProgramCounter=>ToNextProgramCounter);
    
-- This was programmed by Pabasara Jayasekara with index number 200251X
-- binary representation is 110000111000111011
-- 110 000 111 000 111 011

process begin

-- setting 4 digits from my index number for the registers
AddressToJump<="111";
Adder_3bit_out<="011";

EN<='1';
--111
JumpFlag<='1';
wait for 100ns;

--011
JumpFlag<='0';
wait for 100ns;


-- setting 4 digits from my index number for the registers
AddressToJump<="000";
Adder_3bit_out<="110";


--000
JumpFlag<='1';
wait for 100ns;

--110
JumpFlag<='0';
wait for 100ns;

wait;

end process;
end Behavioral;
