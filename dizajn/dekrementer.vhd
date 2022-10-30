library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dekrementer is
    Generic (WIDTH :positive:= 4);
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end dekrementer;

architecture Behavioral of dekrementer is

begin
    out1<= STD_LOGIC_VECTOR( unsigned(in1) - to_unsigned(1,WIDTH));

end Behavioral;
