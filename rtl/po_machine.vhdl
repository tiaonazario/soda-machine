library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity po_machine is
    port (
        -- entradas
        rst : in std_logic; -- reset
        clk : in std_logic; -- clock
        tot_ld : in std_logic;
        tot_clr : in std_logic;
        s : in std_logic_vector(7 downto 0); -- custo do refigerante
        a : in std_logic_vector(7 downto 0); -- valor da moeda em centavos

        -- saida
        tot_lt_s out std_logic

    );
end entity po_machine;

architecture po_rtl_arch of ent is

    signal tot: std_logic_vector(7 downto 0);
    signal somar: std_logic_vector(7 downto 0);

begin
    process(clk, rst)
    begin
        if rst = "1" then
            tot <= b"00000000";
           
        elsif rising_edge(clk) then
            if tot_clr = "1" then
                tot <= b"00000000";
            elsif tot_ld = "1" then
                tot <= somar;
            end if;
        end if;
    end process;

    somar <= std_logic_vector(unsigned(tot) + unsigned(a));
    tot_lt_s <= "1" when unsigned(tot) < unsigned(s) else "0";

end po_rtl_arch ; -- po_rtl_arch
