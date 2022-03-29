library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PopMachineFSM is
  port (
    clk: in std_logic;
    rst: in std_logic;

    MOEDA_ACK: in std_logic;
    MOEDA_RET: in std_logic;
    REFRI_RET: in std_logic;

  );
end PopMachineFSM;