-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity canny_edge_mac_mupcA_DSP48_8 is
port (
    clk: in  std_logic;
    rst: in  std_logic;
    ce:  in  std_logic;
    in0:  in  std_logic_vector(8 - 1 downto 0);
    in1:  in  std_logic_vector(12 - 1 downto 0);
    in2:  in  std_logic_vector(20 - 1 downto 0);
    dout: out std_logic_vector(20 - 1 downto 0));

end entity;

architecture behav of canny_edge_mac_mupcA_DSP48_8 is
    signal a       : signed(25-1 downto 0);
    signal b       : signed(18-1 downto 0);
    signal c       : signed(48-1 downto 0);
    signal m       : signed(43-1 downto 0);
    signal p       : signed(48-1 downto 0);
    signal m_reg   : signed(43-1 downto 0);
    signal a_reg   : signed(25-1 downto 0);
    signal b_reg   : signed(18-1 downto 0);
begin
a  <= signed(resize(unsigned(in0), 25));
b  <= signed(resize(unsigned(in1), 18));
c  <= signed(resize(unsigned(in2), 48));

m  <= a_reg * b_reg;
p  <= m_reg + c;

process (clk) begin
    if (clk'event and clk = '1') then
        if (ce = '1') then
            m_reg  <= m;
            a_reg  <= a;
            b_reg  <= b;
        end if;
    end if;
end process;

dout <= std_logic_vector(resize(unsigned(p), 20));

end architecture;

Library IEEE;
use IEEE.std_logic_1164.all;

entity canny_edge_mac_mupcA is
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER);
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
        din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
        din2 : IN STD_LOGIC_VECTOR(din2_WIDTH - 1 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
end entity;

architecture arch of canny_edge_mac_mupcA is
    component canny_edge_mac_mupcA_DSP48_8 is
        port (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            ce : IN STD_LOGIC;
            in0 : IN STD_LOGIC_VECTOR;
            in1 : IN STD_LOGIC_VECTOR;
            in2 : IN STD_LOGIC_VECTOR;
            dout : OUT STD_LOGIC_VECTOR);
    end component;



begin
    canny_edge_mac_mupcA_DSP48_8_U :  component canny_edge_mac_mupcA_DSP48_8
    port map (
        clk => clk,
        rst => reset,
        ce => ce,
        in0 => din0,
        in1 => din1,
        in2 => din2,
        dout => dout);

end architecture;


