library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
    Generic (WIDTH :positive:= 4);
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           q : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end dff;

architecture Behavioral of dff is

begin
    REGISTAR:process(clk)
    begin
        if(rising_edge(clk)) then
            q <= d;
        end if;
    end process;
end Behavioral;
