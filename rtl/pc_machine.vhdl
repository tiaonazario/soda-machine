library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc_machine is
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
end entity pc_machine;

architecture pc_rtl_arch of pc_machine is

type states is (inicio, esperar, somar, fornecer);

signal curr_state : states;
signal next_state : states;
    
begin
    process(clk, rst)
    begin
        if rst = "1" then
            curr_state <= inicio;
        elsif rising_edge(clk) then
            curr_state <= next_state;
        end if;
    end process;

    process(curr_state, c, tot_lt_s)
    begin
        case curr_state is    
            when inicio =>
                next_state <= esperar;

            when esperar =>
                if c = "1" then
                    next_state <= somar;
                elsif c = "0" and tot_lt_s = "0" then
                    next_state <= fornecer;
                else
                    next_state <= esperar;
                end if;
            
            when somar =>
                next_state <= esperar;
            
            when fornecer =>
                next_state <= inicio;
        end case;
  end process;

  d <= "1" when curr_state = fornecer else "0";
  tot_ld <= "1" when curr_state = somar else "0";
  tot_clr <= "1" when curr_state = inicio else "0";
    
end architecture pc_rtl_arch;
