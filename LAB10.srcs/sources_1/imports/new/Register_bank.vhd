----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:40:31 PM
-- Design Name: 
-- Module Name: Register_bank - Behavioral
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

entity Register_bank is
    Port (
        Clk: in std_logic;
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
end Register_bank;

architecture Behavioral of Register_bank is
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC);
end component;
component Decoder_3_to_8
    port (
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
signal D0 : std_logic_vector (3 downto 0);
signal En : std_logic_vector(7 downto 0);
begin
Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        EN => '1',
        I => Reg_en,
        Y => En
    );
R01 : Reg
    port map(
        D => D0,
        Q => R0,
        En => En(0),
        Reset=>Reset,
        Clk => Clk
    );
R11 : Reg
    port map(
        D => D,
        Q => R1,
        En => En(1),
                Reset=>Reset,
        Clk => Clk
    );
R21 : Reg
    port map(
        D => D,
        Q => R2,
        En => En(2),
                Reset=>Reset,
        Clk => Clk
    );
R31 : Reg
    port map(
        D => D,
        Q =>R3,
        En => En(3),
                Reset=>Reset,
        Clk => Clk
    );
R41 : Reg
    port map(
        D => D,
        Q => R4,
        En => En(4),
                Reset=>Reset,
        Clk => Clk
     );
R51 : Reg
    port map(
        D => D,
        Q => R5,
        En => En(5),
                Reset=>Reset,
        Clk => Clk
     );
R61 : Reg
    port map(
        D => D,
        Q => R6,
        En => En(6),
                Reset=>Reset,
        Clk => Clk
     );
R71 : Reg
     port map(
        D => D,
        Q =>R7,
        En => En(7),
                Reset=>Reset,
        Clk => Clk
     );
D0 <= "0000";
end Behavioral;
