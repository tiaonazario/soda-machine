-- maquina de refrigerante

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SodaMachine is
    port (
        -- rst : in std_logic; -- reset
        clk : in std_logic; -- clock
        c : in std_logic; -- sensor detector de moedas
        s : in std_logic_vector(7 downto 0); -- custo do refigerante
        a : in std_logic_vector(7 downto 0); -- valor da moeda em centavos
    );
end entity SodaMachine;
