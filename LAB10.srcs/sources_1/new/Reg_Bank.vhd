----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 10:07:37 AM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( Clk : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Reg_0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7_out : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Reg_Bank;

architecture Behavioral of Reg_Bank is
component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal R_Y : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP (
        I=>Reg_Enable,
        EN => '1',
        Y => R_Y
    );
    Register_0 :Reg
    PORT MAP(
       D=>Data_in,
       En=>R_Y(0),
       Reset=>Reset,
       Clk=>Clk,
       Q=>Reg_0_out
    );
    Register_1 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(1),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_1_out
        );
    Register_2 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(2),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_2_out
        );
    Register_3 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(3),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_3_out
        );
    Register_4 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(4),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_4_out
        );
    Register_5 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(5),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_5_out
        );
    Register_6 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(6),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_6_out
        );
    Register_7 :Reg
        PORT MAP(
           D=>Data_in,
           En=>R_Y(7),
           Reset=>Reset,
           Clk=>Clk,
           Q=>Reg_7_out
        );
  
end Behavioral;
