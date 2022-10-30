library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity datapath is
    Generic (WIDTH :positive:= 4);
    Port ( clk : in STD_LOGIC;
           a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           b_reg0 : out STD_LOGIC;
           count_0 : out STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0));
end datapath;

architecture Structural of datapath is
    signal a_n, a_r, b_n, b_r, n_n, n_r, pomL_s, pomR_s, dek_s : std_logic_vector(WIDTH-1 downto 0);
    signal p_n, p_r, sab_s : std_logic_vector(2*WIDTH-1 downto 0);
begin
    pom_levo: entity work.pomerac(levo)
    generic map(WIDTH => WIDTH)
    port map(   in1 => a_r,
                out1 => pomL_s,
                carry => open
                );
    pom_desno: entity work.pomerac(desno)
    generic map(WIDTH => WIDTH)
    port map(   in1 => b_r,
                out1 => pomR_s,
                carry => b_reg0
                );
    dekrementer: entity work.dekrementer
    generic map(WIDTH => WIDTH)
    port map(   in1 => n_r, 
                out1 => dek_s 
                );
    sabirac: entity work.sabirac
    generic map(WIDTH => WIDTH)
    port map(   in1 => p_r,
                in2 => a_r,
                out1 => sab_s
                );      
                
    komparator: entity work.komparator
    generic map(WIDTH => WIDTH)
    port map(   in1 => n_n,
                out1 => count_0
                );                    
    mux0 : entity work.mux
    generic map(WIDTH => WIDTH)
    port map(   in1 => a_in, 
                in2 => a_r,
                in3 => pomL_s,
                in4 => (others => '0'),
                out1 => a_n,
                sel => sel
                );    
                
    mux1 : entity work.mux
    generic map(WIDTH => WIDTH)
    port map(   in1 => b_in,     
                in2 => b_r,
                in3 => pomR_s,
                in4 => (others => '0'),
                out1 => b_n,
                sel =>  sel
                ); 
                            
    mux2 : entity work.mux
    generic map(WIDTH => WIDTH)
    port map(   in1 =>  std_logic_vector(to_unsigned(WIDTH,WIDTH)), 
                in2 => n_r,
                in3 => dek_s,
                in4 => (others => '0'),
                out1 => n_n,
                sel => sel
                ); 
                
    mux3 : entity work.mux
    generic map(WIDTH => 2*WIDTH)
    port map(   in1 => (others => '0'),    
                in2 => sab_s,
                in3 => p_r,
                in4 => (others => '0'),
                out1 => p_n, 
                sel => sel
                );   
    dff0: entity work.dff                                      
    generic map(WIDTH => WIDTH)
    port map(   clk => clk,
                d => a_n,
                q => a_r
                );
    dff1: entity work.dff                                      
    generic map(WIDTH => WIDTH)
    port map(   clk => clk,
                d => b_n,
                q => b_r
                );       
    dff2: entity work.dff                                      
    generic map(WIDTH => WIDTH)
    port map(   clk => clk,
                d => n_n,
                q => n_r
                );        
    dff3: entity work.dff                                      
    generic map(WIDTH => 2*WIDTH)
    port map(   clk => clk,
                d => p_n,
                q => p_r
                );
            
    r_out<= p_r;    

end Structural;
