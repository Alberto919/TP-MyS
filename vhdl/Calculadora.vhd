----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2020 01:24:38
-- Design Name: 
-- Module Name: Calculadora - Behavioral
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

entity Calculadora is
GENERIC( 
          N : natural := 32;
          M : natural := 16     -- Se usa para la multiplicacion
       );
 port (
           OpA_in  : in  std_logic_vector(N-1 downto 0);
           OpB_in  : in  std_logic_vector(N-1 downto 0);           
           Op_in   : in  std_logic_vector(  1 downto 0);         
           Resto_Op: out std_logic_vector(N-1 downto 0);
           Result  : out std_logic_vector(N-1 downto 0)      
       );
end Calculadora;

architecture Behavioral of Calculadora is

    component Division is
        generic (
                 N: natural:= N
              );
        port( 
               dividendo: in  std_logic_vector(N-1 downto 0);
               divisor  : in  std_logic_vector(N-1 downto 0);
               cociente : out std_logic_vector(N-1 downto 0); 
               resto    : out std_logic_vector(N-1 downto 0)
             );
    end component;   
    
    component Multiplicacion is  
     Generic (    
               N   : natural := M  
            );      
     Port (   
            multiplicando : in  std_logic_vector(N-1 downto 0);    
            multiplicador : in  std_logic_vector(N-1 downto 0);    
            producto      : out std_logic_vector(2*N-1 downto 0)  -- doble de bits para el producto   
         );      
     end component;   
    
    component SumadorRestador is
     generic(N: Natural := N);
     Port ( 
         a_i    : in std_logic_vector(N-1 downto 0);
         b_i    : in std_logic_vector(N-1 downto 0);
         op_i   : in std_logic;       -- Operacion 1 --> resta, 0 --> suma
         suma_o : out std_logic_vector(N-1 downto 0);
         carry_o: out std_logic
      );
     end component;
              
    signal sResto    :   std_logic_vector(N-1 downto 0)  := (others => '0');                                       
    signal sCociente :   std_logic_vector(N-1 downto 0)  := (others => '0');         
    signal sProducto :   std_logic_vector(2*M-1 downto 0):= (others => '0');
    signal sResultado:   std_logic_vector(N-1 downto 0)  := (others => '0');
    signal sCarry_o  :   std_logic;   
    signal sOperacion:   std_logic;           
begin
  -- Instanciacion de los componentes
  Inst_Division : Division
      generic map( 
             N
         )                                          
      PORT MAP (
          dividendo => OpA_in,
          divisor => OpB_in,
          cociente => sCociente,
          resto => sResto
        );  
    
    Inst_Multiplicacion : Multiplicacion   
         generic map (     
             M              -- M como maximo de 16, esto de debe a que
         )                  -- el resultado debe tener el doble de bit   
         port map(     
             multiplicando  => OpA_in(M-1 downto 0),     
             multiplicador  => OpB_in(M-1 downto 0),     
             producto       => sProducto   
         ); 
         
     Inst_Suma_Resta : SumadorRestador
          generic map(
              N
           )
          Port map( 
              a_i    =>  OpA_in,
              b_i    =>  OpB_in,
              op_i   =>  sOperacion,       -- Operacion 1 --> resta, 0 --> suma
              suma_o =>  sResultado,
              carry_o=>  sCarry_o
           );  
    
     process (OpA_in, OpB_in, Op_in)
     begin 
       case Op_in is
         -- Suma
         when b"00" =>           
             sOperacion <= '0';
             Result     <= sResultado;
         -- Resta                                
         when b"01" =>
             sOperacion <= '1';
             Result     <= sResultado;
         -- Multiplicacion                             
         when b"10" =>              
             Result     <= sProducto;
         -- Division
         when b"11" =>             
             Result     <= sCociente;
             Resto_Op   <= sResto;  
         when others =>
             Result     <= (others => '0');           
       end case;                                                                            
     end process;  
     
end Behavioral;