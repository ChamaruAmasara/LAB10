----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 02:20:39 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    component Decoder_2_to_4
        PORT(
            I: in STD_LOGIC_VECTOR;
            EN: in STD_LOGIC;
            Y: out STD_LOGIC_VECTOR
        );
    end component;
    signal EN0,EN1,I0,I1,I2 : STD_LOGIC;
    --signal Y0,Y1 : STD_LOGIC_VECTOR (3 downto 0);

begin
Decoder_2_to_4_0 :Decoder_2_to_4
    PORT MAP(
        I(0) => I0,
        I(1) => I1,
        EN => EN0,
        Y => Y(3 downto 0)
    );
Decoder_2_to_4_1 :Decoder_2_to_4
        PORT MAP(
        I(0) => I0,
        I(1)=> i1,
        en => en1,
        y => y(7 DOWNTO 4));    
        
        I0 <= I(0);
        I1 <= I(1);
        EN0 <= not(I(2)) AND EN;
        EN1 <= I(2)AND EN;


end Behavioral;