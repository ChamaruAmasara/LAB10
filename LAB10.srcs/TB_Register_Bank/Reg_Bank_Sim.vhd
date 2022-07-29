----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 11:45:10 AM
-- Design Name: 
-- Module Name: Reg_Bank_Sim - Behavioral
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

entity Reg_Bank_Sim is
--  Port ( );
end Reg_Bank_Sim;

architecture Behavioral of Reg_Bank_Sim is
component Reg_Bank
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
end component;
signal Clk : STD_LOGIC:= '0';
signal Reset : STD_LOGIC;
signal Data_in,Reg_0_out,Reg_1_out,Reg_2_out,Reg_3_out,Reg_4_out,Reg_5_out,Reg_6_out,Reg_7_out :  STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Enable : STD_LOGIC_VECTOR (2 downto 0);
begin
    UUT :Reg_Bank
        PORT MAP(
               Clk=>Clk,
               Data_in=>Data_in,
               Reg_Enable=>Reg_Enable,
               Reset=>Reset,
               Reg_0_out=>Reg_0_out,
               Reg_1_out=>Reg_1_out,
               Reg_2_out=>Reg_2_out,
               Reg_3_out=>Reg_3_out,
               Reg_4_out=>Reg_4_out,
               Reg_5_out=>Reg_5_out,
               Reg_6_out=>Reg_6_out, 
               Reg_7_out=>Reg_7_out 
        );

        process
        begin
            wait for 20ns;
            Clk <= Not (Clk);
        end process;
        
        process begin
        Reset<='1';
        wait for 30ns;
        Reset<='0';
        
        Reg_Enable<="001";
        Data_in<="0111";
        wait for 100ns;
        
        Reg_Enable<="010";
        Data_in<="1011";
        wait;
        
        
        end process;

end Behavioral;
