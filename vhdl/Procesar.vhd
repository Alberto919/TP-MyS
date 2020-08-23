----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.08.2020 20:18:55
-- Design Name: 
-- Module Name: unit_proc - Behavioral
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

entity Procesar is
    port( a   : in std_logic; 
          b   : in std_logic; 
          s   : in std_logic; 
          cin : in std_logic;
          r   :  out std_logic; 
          cout: out std_logic);
end Procesar;

architecture Behavioral of Procesar is

	component Sumador1b
        Port (
           a_i : in STD_LOGIC;
           b_i : in STD_LOGIC;
           carry_i : in STD_LOGIC;
           suma_o : out STD_LOGIC;
           carry_o : out STD_LOGIC  
        );
    end component; 
	
	signal not_b: std_logic;
	signal mux_1: std_logic;
	
begin

	not_b <= not(b);		
    f1: Sumador1b 
           port map(
                a_i => a,
                b_i => not_b,
                carry_i => cin,
                suma_o => mux_1,
                carry_o => cout
             ); 
             
	with s select
		r <= mux_1 when '1',
		     a when others;

end Behavioral;
