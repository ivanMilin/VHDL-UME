library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlpath is
    Generic (WIDTH :positive:= 4);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           ready : out STD_LOGIC;
           b_reg0 : in STD_LOGIC;
           count_0 : in STD_LOGIC;
           sel : out STD_LOGIC_VECTOR (1 downto 0));
end controlpath;

architecture Behavioral of controlpath is
    type state_t is (idle, add, shift);
    signal state_r, state_n : state_t := idle;
begin
    
    --sekvencijalni proces
    seq_proc: process(clk) 
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                state_r <= idle;        
            else
                state_r <= state_n;  
            end if;             
        end if;
    end process;
    
    --kombinacioni proces
    comb_proc: process(start, b_reg0, count_0, state_r)
    begin
        ready<= '0';
        sel <= "00";
        
        case state_r is
            when idle =>
                ready<= '1';
                sel<= "00";
                if(start = '0') then
                    state_n <= idle;
                else
                    if(b_reg0 = '0') then
                        state_n<= shift;
                    else   
                        state_n <=  add;
                    end if;                           
                end if;
                
            when add =>
                sel <= "01";
                state_n <= shift;
            
            when shift =>
                sel <= "10";
                
                if(count_0 = '1') then
                    state_n <= idle;
                else    
                    if(b_reg0 = '0') then
                        state_n<= shift;
                    else   
                        state_n <=  add;
                    end if;  
                end if;
                
        end case;
    end process;
    
    
    
    



end Behavioral;
