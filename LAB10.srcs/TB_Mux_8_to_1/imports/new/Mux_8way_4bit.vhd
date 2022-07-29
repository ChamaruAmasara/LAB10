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
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is

component Decoder_3_to_8

port ( I : in STD_LOGIC_VECTOR (2 downto 0);
 Y : out STD_LOGIC_VECTOR (7 downto 0);
 EN : in STD_LOGIC);
end component;

component quad_tri_state_buffer
Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
 EN : in STD_LOGIC;
 Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL common_bus : std_logic_vector (3 downto 0);
SIGNAL RegSel_var : std_logic_vector(7 downto 0);
begin

Decoder_3_to_8_0 : Decoder_3_to_8
 port map (
 I(2 downto 0) => RegSel(2 downto 0),
 EN => '1',
 Y(7 downto 0) => RegSel_var(7 downto 0));

quad_tri_state_buffer_0 : quad_tri_state_buffer
port map(
EN => RegSel_var(0),
A => R0,
Y => common_bus);

quad_tri_state_buffer_1 : quad_tri_state_buffer
port map(
EN => RegSel_var(1),
A => R1,
Y => common_bus);

quad_tri_state_buffer_2 : quad_tri_state_buffer
port map(
EN => RegSel_var(2),
A => R2,
Y => common_bus);

quad_tri_state_buffer_3 : quad_tri_state_buffer
port map(
EN => RegSel_var(3),
A => R3,
Y => common_bus);

quad_tri_state_buffer_4 : quad_tri_state_buffer
port map(
EN => RegSel_var(4),
A => R4,
Y => common_bus);

quad_tri_state_buffer_5 : quad_tri_state_buffer
port map(
EN => RegSel_var(5),
A => R5,
Y => common_bus);

quad_tri_state_buffer_6 : quad_tri_state_buffer
port map(
EN => RegSel_var(6),
A => R6,
Y => common_bus);

quad_tri_state_buffer_7 : quad_tri_state_buffer
port map(
EN => RegSel_var(7),
A => R7,
Y => common_bus);
Output <= common_bus;

end Behavioral;