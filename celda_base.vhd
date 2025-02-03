library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity celda_base is
    Port ( info_in : in STD_LOGIC_VECTOR (1 downto 0);
           celda : in STD_LOGIC_VECTOR (1 downto 0);
           info_out : out STD_LOGIC_VECTOR (1 downto 0);
           salida : out STD_LOGIC);
end celda_base;

architecture Behavioral of celda_base is
begin
    salida <= (info_in(1) and (not info_in(0)) and (not celda(1)) and (not celda(0)));
    
    info_out(1) <= ((info_in(1) and (not info_in(0)) and celda(1) and (not celda(0))) or 
                    ((not info_in(1)) and info_in(0) and celda(1) and (not celda(0))));

    info_out(0) <= ((info_in(1) and (not info_in(0)) and (not celda(1)) and celda(0)) or 
                    ((not info_in(1)) and info_in(0) and (not celda(1)) and celda(0)) or 
                    ((not info_in(1)) and info_in(0) and celda(1) and ( not celda(0))));
end Behavioral;