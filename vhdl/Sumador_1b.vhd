----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2020 17:33:29
-- Design Name: 
-- Module Name: Sumador1b - Behavioral
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

entity Sumador1b is
    Port ( a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           carry_i : in STD_LOGIC;
           suma_o : out STD_LOGIC;
           carry_o : out STD_LOGIC);
end Sumador1b;

architecture Behavioral of Sumador1b is
begin
    suma_o <= a_i xor b_i xor carry_i;
    carry_o <= (a_i and b_i) or (carry_i and a_i) or (carry_i and b_i);
end Behavioral;