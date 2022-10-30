library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
    Generic (WIDTH :positive:= 4);
    Port ( in1 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           in2 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           in3 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           in4 : in STD_LOGIC_VECTOR (WIDTH-1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           out1 : out STD_LOGIC_VECTOR (WIDTH-1 downto 0));
end mux;

architecture Behavioral of mux is

begin
    process(in1,in2,in3,in4)
    begin
        case sel is
    
            when "00" => 
                out1 <= in1; 
            when "01" =>
                out1 <= in2;
            when "10" =>
                out1 <= in3;
            when others => 
                out1 <= in4;
        end case; 

    end process;


end Behavioral;
