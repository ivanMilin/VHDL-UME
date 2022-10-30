library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pomerac is
    Generic (WIDTH :positive:= 4);
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           carry : out STD_LOGIC);
end pomerac;

architecture levo of pomerac is
begin
    out1<= in1((WIDTH-2) downto 0) & '0';
    carry <= in1(WIDTH-1);  
end levo;

architecture desno of pomerac is
begin
    out1 <= '0' & in1((WIDTH-1) downto 1); 
    carry <= in1(0);
end desno;