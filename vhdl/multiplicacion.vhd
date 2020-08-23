----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.08.2020 21:38:31
-- Design Name: 
-- Module Name: mult_comb_gen - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicacion is  
Generic (N   : natural);      
Port (   
        multiplicando : in  std_logic_vector (N-1 downto 0);    
        multiplicador : in  std_logic_vector (N-1 downto 0);    
        producto      : out std_logic_vector (2*N-1 downto 0)  -- doble de bits para el producto   
   ); 
end multiplicacion; 
   
architecture Behavioral of multiplicacion is 
    type t_vector_sumand is array (1 to N) of unsigned (N-1 downto 0);   
    type t_vector_resul  is array (1 to N) of unsigned (N downto 0);  
    signal sum_anded : t_vector_sumand;   
    signal resul     : t_vector_resul; 
begin -- primera etapa   
    sum_anded(1) <= unsigned(multiplicando) when multiplicador(0) = '1' else (others => '0');  
    resul(1)     <= '0' & sum_anded(1);  --concateno un cero por delante por ser unsigned. 
    producto(0)      <= resul(1)(0);     -- resto de etapas   
    
    gen_mult: for i in 1 to N-1 generate     
        sum_anded(i+1) <= unsigned(multiplicando) when multiplicador(i)='1' else (others=>'0');     
        resul(i+1) <= ('0' & resul(i)(N downto 1)) + ('0' & sum_anded(i+1));    
        producto(i)    <= resul(i+1)(0);  
    end generate; -- final:   
    producto(2*N-1 downto N) <= std_logic_vector(resul(N)(N downto 1));   
end Behavioral;