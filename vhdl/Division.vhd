----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.08.2020 20:13:02
-- Design Name: 
-- Module Name: res_div - Behavioral
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

entity Division is
	generic (N: natural);
	port( 
             dividendo: in  std_logic_vector(N-1 downto 0);
             divisor  : in  std_logic_vector(N-1 downto 0);
             cociente : out std_logic_vector(N-1 downto 0); 
             resto    : out std_logic_vector(N-1 downto 0)
		);
end Division;

architecture Behavioral of Division is

	component Procesar
		port( 
		       a  : in std_logic; 
		       b  : in std_logic; 
		       s  : in std_logic; 
		       cin: in std_logic;
			   r : out std_logic; 
			   cout : out std_logic
			 );
	end component;
	
	type my_array is array (natural range <>, natural range <>) of std_logic;
	signal x, y: my_array (N-1 downto 0, N downto 0);
	signal c: my_array(N-1 downto 0, N+1 downto 0);
	signal xDivisor: std_logic_vector (N downto 0);
		
begin
  
   xDivisor <= '0'&divisor;
   init: for i in 0 to N-1 generate
            x(i,N) <= '0'; 
            y(i,N) <= '0';
            c(i,N+1) <= '0';
         end generate;

   init_col_x: for j in N-1 downto 1 generate
                    x(0,j) <= '0';
                end generate;
	
   gen_row: for i in 0 to N-1 generate  -- Por cada fila				  
                x(i,0) <= dividendo(N-1-i);
                c(i,0) <= '1';	
                 
                gen_col: for j in N-1 downto 0 generate -- Por cada columna
                         ra: if i /= 0 and j /= 0 generate
                                  x(i,j) <= y(i-1,j-1);
                              end generate;
                       resta: Procesar
                                port map (
                                     a => x(i,j), 
                                     b => xDivisor(j), 
                                     s => c(i,N), 
                                     cin => c(i,j), 
                                     r => y(i,j), 
                                     cout => c(i,j+1)
                                   );
                          end generate;
                cociente(N-1-i) <= c(i,N);                                       
             end generate;	 
	
	gc: for i in 0 to N-1 generate
		    resto(i) <= y(N-1,i);
	    end generate;		 
end Behavioral;

