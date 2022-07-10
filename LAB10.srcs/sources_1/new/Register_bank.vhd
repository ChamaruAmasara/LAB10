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
        Reg_en : in std_logic_vector (2 downto 0);
        D : in std_logic_vector (3 downto 0);
        Q : out std_logic_vector (3 downto 0)
     );
end Register_bank;

architecture Behavioral of Register_bank is
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Decoder_3_to_8
    port (
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
signal D0 : std_logic_vector (3 downto 0);
signal Clk : std_logic;
signal En : std_logic_vector(7 downto 0);
begin
Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        EN => '1',
        I => Reg_en,
        Y => En
    );
R0 : Reg
    port map(
        D => D0,
        Q => Q,
        En => En(0),
        Clk => Clk
    );
R1 : Reg
    port map(
        D => D,
        Q => Q,
        En => En(1),
        Clk => Clk
    );
R2 : Reg
    port map(
        D => D,
        Q => Q,
        En => En(2),
        Clk => Clk
    );
R3 : Reg
    port map(
        D => D,
        Q => Q,
        En => En(3),
        Clk => Clk
    );
R4 : Reg
    port map(
        D => D,
        Q => Q,
        En => En(4),
        Clk => Clk
     );
R5 : Reg
    port map(
        D => D,
        Q => Q,
        En => En(5),
        Clk => Clk
     );
R6 : Reg
    port map(
        D => D,
        Q => Q,
        En => En(6),
        Clk => Clk
     );
R7 : Reg
     port map(
        D => D,
        Q => Q,
        En => En(7),
        Clk => Clk
     );
D0 <= "0000";
end Behavioral;
