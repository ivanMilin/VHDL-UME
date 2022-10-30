library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity komparator is
    Generic (WIDTH :positive:= 4);
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC);
end komparator;

architecture Behavioral of komparator is

begin
    COMP: process(in1) begin
        if (in1 = std_logic_vector(to_unsigned(0,WIDTH))) then
            out1<= '1';
        else
            out1<= '0';   
        end if;
    end process;

end Behavioral;
