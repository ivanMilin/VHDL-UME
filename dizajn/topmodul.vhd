library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodul is
    Generic (WIDTH :positive:= 4);
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           ready : out STD_LOGIC;
           a_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           r_out : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0));
end topmodul;

architecture Structural of topmodul is
    signal sel: STD_LOGIC_VECTOR (1 downto 0);
    signal count_0,b_reg0: STD_LOGIC;
begin
    DataPath: entity work.datapath
    generic map(WIDTH=>WIDTH)
    port map(   clk=>clk,
                a_in => a_in,
                b_in => b_in,
                b_reg0 => b_reg0,
                sel => sel,
                count_0 => count_0,
                r_out=>r_out    
    );

    ControlPath: entity work.controlpath
    generic map(WIDTH=>WIDTH)
    port map(   clk => clk,
                reset => reset,
                start => start,
                ready => ready,
                b_reg0 => b_reg0,
                count_0 => count_0,
                sel => sel
    );

end Structural;
