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
    Port ( S  : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           D8 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out std_logic_vector (3 downto 0));
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is
    component Decoder_3_to_8
        Port(I: in STD_LOGIC_VECTOR;
                EN: in STD_LOGIC;
                Y: out STD_LOGIC_VECTOR
            );
        
        
    end component;    
    signal DY : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        PORT MAP (
            I=>S,
            EN => EN,
            Y => DY
        );
        
    process
    begin
        if (DY="00000001") then
            Y <= D1;
        elsif (DY="00000010") then
            Y <= D2;
        elsif (DY="00000100") then
            Y <= D3;
        elsif (DY="00001000") then
            Y <= D4;
        elsif (DY="00010000") then
            Y <= D5;
        elsif (DY="00100000") then
            Y <= D6;
        elsif (DY="01000000") then
            Y <= D7;
        else
            Y <= D8;
        end if;
        wait;
    end process;
        
                    
                    


end Behavioral;
