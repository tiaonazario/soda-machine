-- maquina de refrigerante

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity soda_machine is
    port (
        -- entradas
        rst : in std_logic; -- reset
        clk : in std_logic; -- clock
        c : in std_logic; -- sensor detector de moedas
        s : in std_logic_vector(7 downto 0); -- custo do refigerante
        a : in std_logic_vector(7 downto 0); -- valor da moeda em centavos

        -- saída
        d : out std_logic; -- indica fornecimento do refrigerante
    );
end entity soda_machine;

architecture soda_machine_rtl_arch of soda_machine is
    component pc_machine is
        port (
            -- entradas
            rst : in std_logic; -- reset
            clk : in std_logic; -- clock
            c : in std_logic; -- sensor detector de moedas
            tot_lt_s : in std_logic;

            -- saídas
            d : out std_logic; -- indica fornecimento do refrigerante
            tot_ld : out std_logic;
            tot_clr : out std_logic
        );
    end component pc_machine;

    component po_machine is
        port (
            -- entradas
            rst : in std_logic; -- reset
            clk : in std_logic; -- clock
            tot_ld : in std_logic;
            tot_clr : in std_logic;
            s : in std_logic_vector(7 downto 0); -- custo do refigerante
            a : in std_logic_vector(7 downto 0); -- valor da moeda em centavos

            -- saida
            tot_lt_s: out std_logic
        );
    end component po_machine;

    signal tot_ld : std_logic;
    signal tot_clr : std_logic;
    signal tot_lt_s : std_logic;

begin
    pc: pc_machine port map(
        rst
        clk
        c
        tot_lt_s
        d
        tot_ld
        tot_clr
    );
    
    
    po: po_machine port map(
        rst: rst,
        clk: clk,
        tot_ld: tot_ld,
        tot_clr: tot_clr,
        s: s,
        a: a,
        tot_lt_s: tot_lt_s
    );
    
    
end architecture soda_machine_rtl_arch;
