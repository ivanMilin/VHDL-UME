library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb is
    generic(WIDTH : positive:=4);
--  Port ( );
end tb;

architecture Behavioral of tb is
    signal clk, reset, start, ready: std_logic;
    signal a_in, b_in: std_logic_vector(WIDTH-1 downto 0);
    signal r_out: std_logic_vector(2*WIDTH-1 downto 0);
begin
    TopModul: entity work.topmodul
    generic map(WIDTH => WIDTH)
    port map(   clk => clk,
                reset => reset,
                start => start,
                ready => ready,
                a_in => a_in,
                b_in => b_in,
                r_out => r_out
                );     
                
    clk_proc: process
    begin
        clk<='0';
        wait for 50ns;
        clk<='1';
        wait for 50ns;
    end process;   
    
    rst_proc: process
    begin
        reset<='0';
        wait for 200ns;
        reset<='0';
    end process;
    
    stim_proc: process
    begin
        a_in <= std_logic_vector(to_unsigned(2,WIDTH));
        b_in <= std_logic_vector(to_unsigned(2,WIDTH));
        start <= '1';
        wait for 400ns;
        start <= '0';
        wait for 1ns;
        wait;
    end process;                  
               

end Behavioral;
