library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity macro_celda is
    Port ( up_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_in : in STD_LOGIC_VECTOR (1 downto 0);
           left_in : in STD_LOGIC_VECTOR (1 downto 0);
           right_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_left_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_right_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_left_in : in STD_LOGIC_VECTOR (1 downto 0);
           down_right_in : in STD_LOGIC_VECTOR (1 downto 0);
           up_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_out : out STD_LOGIC_VECTOR (1 downto 0);
           left_out : out STD_LOGIC_VECTOR (1 downto 0);
           right_out : out STD_LOGIC_VECTOR (1 downto 0);
           up_left_out : out STD_LOGIC_VECTOR (1 downto 0);
           up_right_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_left_out : out STD_LOGIC_VECTOR (1 downto 0);
           down_right_out : out STD_LOGIC_VECTOR (1 downto 0);
           input : in STD_LOGIC_VECTOR (1 downto 0);
           output : out std_logic);
end macro_celda;

architecture Behavioral of macro_celda is
component celda_base is
    Port ( info_in : in STD_LOGIC_VECTOR (1 downto 0);
           celda : in STD_LOGIC_VECTOR (1 downto 0);
           info_out : out STD_LOGIC_VECTOR (1 downto 0);
           salida : out STD_LOGIC);
end component;
type signal_matrix_simple is array(0 to 8) of STD_LOGIC;
signal info_in, celda, info_out : STD_LOGIC_VECTOR (1 downto 0);
signal salida : signal_matrix_simple;

begin
    cell_up_down : celda_base port map (
        info_in => up_in,
        celda => input,
        info_out => down_out,
        salida => salida(0)
    );

    cell_down_up : celda_base port map (
        info_in => down_in,
        celda => input,
        info_out => up_out,
        salida => salida(1)
    );

    cell_left_right : celda_base port map (
        info_in => left_in,
        celda => input,
        info_out => right_out,
        salida => salida(2)
    );

    cell_right_left : celda_base port map (
        info_in => right_in,
        celda => input,
        info_out => left_out,
        salida => salida(3)
    );

    cell_up_left_down_right : celda_base port map (
        info_in => up_left_in,
        celda => input,
        info_out => down_right_out,
        salida => salida(4)
    );

    cell_up_right_down_left : celda_base port map (
        info_in => up_right_in,
        celda => input,
        info_out => down_left_out,
        salida => salida(5)
    );

    cell_down_left_up_right : celda_base port map (
        info_in => down_left_in,
        celda => input,
        info_out => up_right_out,
        salida => salida(6)
    );

    cell_down_right_up_left : celda_base port map (
        info_in => down_right_in,
        celda => input,
        info_out => up_left_out,
        salida => salida(7)
    );

    output <= '1' when (salida(0) = '1' or 
                        salida(1) = '1' or salida(2) = '1' or salida(3) = '1' or 
                        salida(4) = '1' or salida(5) = '1' or salida(6) = '1' or salida(7) = '1') 
                        else '0';

end Behavioral;