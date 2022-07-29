----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2022 06:58:35 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
component Decoder_3_to_8
    PORT(
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    signal I : STD_LOGIC_VECTOR (2 downto 0);
    signal EN : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR (7 downto 0);

begin
UUT: Decoder_3_to_8
    PORT MAP(
        I=>I,
        EN=>EN,
        Y=>Y
    );
    process
    begin
        EN<='1';
        --my index number is 200390V
        --equivalent bianry number is 00 110 000 111 011 000 110
        -- setting to 110
        I<="110";
        wait for 100ns;
        
        --setting to 000
        I<="000";
        wait for 100ns;
        
        --setting to 011
        I<="011";
        wait for 100ns;
        
        --setting to 111
        I<="111";
        wait for 100ns;

        --other combinations are repeated
        
        I<="001";
        wait for 100ns;
       I<="010";
        wait for 100ns;
       I<="101";
        wait for 100ns;
       I<="110";
        wait for 100ns;
       
        
--
    
--    wait;
    end process;

end Behavioral;
