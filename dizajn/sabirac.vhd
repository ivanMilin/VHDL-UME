library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sabirac is
    Generic (WIDTH :positive:= 4);
    Port ( in1 : in STD_LOGIC_VECTOR (2*WIDTH-1 downto 0);
           in2 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC_VECTOR (2*WIDTH-1 downto 0));
end sabirac;

architecture Behavioral of sabirac is
    signal in2_s : std_logic_vector(2*WIDTH-1 downto 0);
begin
    in2_s <= std_logic_vector(to_unsigned(0,WIDTH)) & in2;
    
    out1 <= std_logic_vector(unsigned(in1) + unsigned(in2_s));

end Behavioral;
