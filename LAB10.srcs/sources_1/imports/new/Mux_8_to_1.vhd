----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 03:21:23 PM
-- Design Name: 
-- Module Name: Mux_2way_3bit - Behavioral
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
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_2way_3bit;

architecture Behavioral of Mux_2way_3bit is
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
        
        Y <= EN AND ((D(0) AND DY(0)) 
                    OR (D(1) AND DY(1))
                    OR (D(2) AND DY(2))
                    OR (D(3) AND DY(3))
                    OR (D(4) AND DY(4))
                    OR (D(5) AND DY(5))
                    OR (D(6) AND DY(6))
                    OR (D(7) AND DY(7)));
                    
                    


end Behavioral;
