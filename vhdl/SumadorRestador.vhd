----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.06.2020 17:38:51
-- Design Name: 
-- Module Name: SumadorRestador - Behavioral
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

entity SumadorRestador is
    generic(N: Natural);
    Port ( 
        a_i : in STD_LOGIC_VECTOR (N-1 downto 0);
        b_i : in STD_LOGIC_VECTOR (N-1 downto 0);
        op_i : in STD_LOGIC;                        -- Operacion 1 --> resta, 0 --> suma
        suma_o : out STD_LOGIC_VECTOR (N-1 downto 0);
        carry_o : out STD_LOGIC
     );
end SumadorRestador;

architecture Behavioral of SumadorRestador is
  component Sumador1b
        Port (
           a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           carry_i : in STD_LOGIC;
           suma_o : out STD_LOGIC;
           carry_o : out STD_LOGIC  
        );
  end component; 
  
  --Inputs
  signal scarry: std_logic_vector(N downto 0):= (others =>'0'); 
  signal sa_i, sb_i:std_logic_vector(N-1 downto 0):= (others =>'0');   
begin    
    scarry(0)<= op_i;
    sa_i <= a_i;
    GEN : for i in N-1 downto 0 generate 

          first: if i=0 generate 
            sb_i(i)<= b_i(i) xor op_i; 
            SR: Sumador1b 
                   port map(
                        sa_i(0),
                        sb_i(0),
                        scarry(0),
                        suma_o(0),
                        scarry(1)
                     ); 
            end generate; 
          Other:  if i/=0 generate 
                sb_i(i)<=b_i(i) xor op_i; 
                SR2: Sumador1b 
                      port map(
                          sa_i(i),
                          sb_i(i),
                          scarry(i),
                          suma_o(i),
                          scarry(i+1)
                      ); 
            end generate; 
    end generate;   
    carry_o <= scarry(N-1);          
end Behavioral;