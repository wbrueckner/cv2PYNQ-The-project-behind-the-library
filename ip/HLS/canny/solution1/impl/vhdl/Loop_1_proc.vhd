-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Loop_1_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (19 downto 0);
    in_stream_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    in_stream_TVALID : IN STD_LOGIC;
    in_stream_TREADY : OUT STD_LOGIC;
    src_bw_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    src_bw_data_stream_0_V_full_n : IN STD_LOGIC;
    src_bw_data_stream_0_V_write : OUT STD_LOGIC );
end;


architecture behav of Loop_1_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_pp0_stage3 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv19_1 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal in_stream_data_V_0_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal in_stream_data_V_0_vld_in : STD_LOGIC;
    signal in_stream_data_V_0_vld_out : STD_LOGIC;
    signal in_stream_data_V_0_ack_in : STD_LOGIC;
    signal in_stream_data_V_0_ack_out : STD_LOGIC;
    signal in_stream_data_V_0_payload_A : STD_LOGIC_VECTOR (31 downto 0);
    signal in_stream_data_V_0_payload_B : STD_LOGIC_VECTOR (31 downto 0);
    signal in_stream_data_V_0_sel_rd : STD_LOGIC := '0';
    signal in_stream_data_V_0_sel_wr : STD_LOGIC := '0';
    signal in_stream_data_V_0_sel : STD_LOGIC;
    signal in_stream_data_V_0_load_A : STD_LOGIC;
    signal in_stream_data_V_0_load_B : STD_LOGIC;
    signal in_stream_data_V_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal in_stream_data_V_0_state_cmp_full : STD_LOGIC;
    signal in_stream_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal tmp_i_reg_165 : STD_LOGIC_VECTOR (0 downto 0);
    signal src_bw_data_stream_0_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage3 : signal is "none";
    signal ap_block_pp0_stage3 : BOOLEAN;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal ap_reg_pp0_iter1_tmp_i_reg_165 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_026_rec_i_reg_99 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal tmp_i_fu_114_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal r_fu_119_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal r_reg_169 : STD_LOGIC_VECTOR (18 downto 0);
    signal tmp_77_reg_174 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_state4_pp0_stage2_iter0 : BOOLEAN;
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal tmp_78_reg_179 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_79_reg_184 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal ap_block_state5_pp0_stage3_iter0 : BOOLEAN;
    signal ap_block_pp0_stage3_subdone : BOOLEAN;
    signal ap_block_state3_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state7_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_phi_mux_p_026_rec_i_phi_fu_103_p4 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_block_pp0_stage3_11001 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal tmp_fu_125_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage2_01001 : BOOLEAN;
    signal ap_block_pp0_stage3_01001 : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal r_cast_i_fu_110_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2) and (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                elsif ((((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    in_stream_data_V_0_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in_stream_data_V_0_sel_rd <= ap_const_logic_0;
            else
                if (((in_stream_data_V_0_ack_out = ap_const_logic_1) and (in_stream_data_V_0_vld_out = ap_const_logic_1))) then 
                                        in_stream_data_V_0_sel_rd <= not(in_stream_data_V_0_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    in_stream_data_V_0_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in_stream_data_V_0_sel_wr <= ap_const_logic_0;
            else
                if (((in_stream_data_V_0_ack_in = ap_const_logic_1) and (in_stream_data_V_0_vld_in = ap_const_logic_1))) then 
                                        in_stream_data_V_0_sel_wr <= not(in_stream_data_V_0_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    in_stream_data_V_0_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in_stream_data_V_0_state <= ap_const_lv2_0;
            else
                if ((((in_stream_data_V_0_state = ap_const_lv2_2) and (in_stream_data_V_0_vld_in = ap_const_logic_0)) or ((in_stream_data_V_0_state = ap_const_lv2_3) and (in_stream_data_V_0_vld_in = ap_const_logic_0) and (in_stream_data_V_0_ack_out = ap_const_logic_1)))) then 
                    in_stream_data_V_0_state <= ap_const_lv2_2;
                elsif ((((in_stream_data_V_0_state = ap_const_lv2_1) and (in_stream_data_V_0_ack_out = ap_const_logic_0)) or ((in_stream_data_V_0_state = ap_const_lv2_3) and (in_stream_data_V_0_ack_out = ap_const_logic_0) and (in_stream_data_V_0_vld_in = ap_const_logic_1)))) then 
                    in_stream_data_V_0_state <= ap_const_lv2_1;
                elsif (((not(((in_stream_data_V_0_vld_in = ap_const_logic_0) and (in_stream_data_V_0_ack_out = ap_const_logic_1))) and not(((in_stream_data_V_0_ack_out = ap_const_logic_0) and (in_stream_data_V_0_vld_in = ap_const_logic_1))) and (in_stream_data_V_0_state = ap_const_lv2_3)) or ((in_stream_data_V_0_state = ap_const_lv2_1) and (in_stream_data_V_0_ack_out = ap_const_logic_1)) or ((in_stream_data_V_0_state = ap_const_lv2_2) and (in_stream_data_V_0_vld_in = ap_const_logic_1)))) then 
                    in_stream_data_V_0_state <= ap_const_lv2_3;
                else 
                    in_stream_data_V_0_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    p_026_rec_i_reg_99_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                p_026_rec_i_reg_99 <= r_reg_169;
            elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                p_026_rec_i_reg_99 <= ap_const_lv19_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_reg_pp0_iter1_tmp_i_reg_165 <= tmp_i_reg_165;
                tmp_i_reg_165 <= tmp_i_fu_114_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((in_stream_data_V_0_load_A = ap_const_logic_1)) then
                in_stream_data_V_0_payload_A <= in_stream_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((in_stream_data_V_0_load_B = ap_const_logic_1)) then
                in_stream_data_V_0_payload_B <= in_stream_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                r_reg_169 <= r_fu_119_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001))) then
                tmp_77_reg_174 <= in_stream_data_V_0_data_out(15 downto 8);
                tmp_78_reg_179 <= in_stream_data_V_0_data_out(23 downto 16);
                tmp_79_reg_184 <= in_stream_data_V_0_data_out(31 downto 24);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, tmp_i_fu_114_p2, ap_block_pp0_stage0_subdone, ap_block_pp0_stage3_subdone, ap_block_pp0_stage1_subdone, ap_block_pp0_stage2_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((tmp_i_fu_114_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((tmp_i_fu_114_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((not(((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage3;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when ap_ST_fsm_pp0_stage3 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage3_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage3;
                end if;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(3);
    ap_CS_fsm_pp0_stage3 <= ap_CS_fsm(4);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state8 <= ap_CS_fsm(5);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(src_bw_data_stream_0_V_full_n, tmp_i_reg_165, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_01001 <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(src_bw_data_stream_0_V_full_n, tmp_i_reg_165, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_11001 <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(src_bw_data_stream_0_V_full_n, tmp_i_reg_165, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_subdone <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;

        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_01001_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter1, ap_reg_pp0_iter1_tmp_i_reg_165)
    begin
                ap_block_pp0_stage1_01001 <= ((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage1_11001_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter1, ap_reg_pp0_iter1_tmp_i_reg_165)
    begin
                ap_block_pp0_stage1_11001 <= ((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter1, ap_reg_pp0_iter1_tmp_i_reg_165)
    begin
                ap_block_pp0_stage1_subdone <= ((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;

        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage2_01001_assign_proc : process(in_stream_data_V_0_vld_out, src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter0, tmp_i_reg_165)
    begin
                ap_block_pp0_stage2_01001 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (((tmp_i_reg_165 = ap_const_lv1_1) and (in_stream_data_V_0_vld_out = ap_const_logic_0)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage2_11001_assign_proc : process(in_stream_data_V_0_vld_out, src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter0, tmp_i_reg_165)
    begin
                ap_block_pp0_stage2_11001 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (((tmp_i_reg_165 = ap_const_lv1_1) and (in_stream_data_V_0_vld_out = ap_const_logic_0)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage2_subdone_assign_proc : process(in_stream_data_V_0_vld_out, src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter0, tmp_i_reg_165)
    begin
                ap_block_pp0_stage2_subdone <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (((tmp_i_reg_165 = ap_const_lv1_1) and (in_stream_data_V_0_vld_out = ap_const_logic_0)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0))));
    end process;

        ap_block_pp0_stage3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage3_01001_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter0, tmp_i_reg_165)
    begin
                ap_block_pp0_stage3_01001 <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage3_11001_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter0, tmp_i_reg_165)
    begin
                ap_block_pp0_stage3_11001 <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage3_subdone_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_enable_reg_pp0_iter0, tmp_i_reg_165)
    begin
                ap_block_pp0_stage3_subdone <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage2_iter0_assign_proc : process(in_stream_data_V_0_vld_out, src_bw_data_stream_0_V_full_n, tmp_i_reg_165)
    begin
                ap_block_state4_pp0_stage2_iter0 <= (((tmp_i_reg_165 = ap_const_lv1_1) and (in_stream_data_V_0_vld_out = ap_const_logic_0)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0)));
    end process;


    ap_block_state5_pp0_stage3_iter0_assign_proc : process(src_bw_data_stream_0_V_full_n, tmp_i_reg_165)
    begin
                ap_block_state5_pp0_stage3_iter0 <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0));
    end process;


    ap_block_state6_pp0_stage0_iter1_assign_proc : process(src_bw_data_stream_0_V_full_n, tmp_i_reg_165)
    begin
                ap_block_state6_pp0_stage0_iter1 <= ((tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0));
    end process;


    ap_block_state7_pp0_stage1_iter1_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_reg_pp0_iter1_tmp_i_reg_165)
    begin
                ap_block_state7_pp0_stage1_iter1 <= ((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (src_bw_data_stream_0_V_full_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state2_assign_proc : process(tmp_i_fu_114_p2)
    begin
        if ((tmp_i_fu_114_p2 = ap_const_lv1_0)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_p_026_rec_i_phi_fu_103_p4_assign_proc : process(tmp_i_reg_165, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, p_026_rec_i_reg_99, r_reg_169)
    begin
        if (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_p_026_rec_i_phi_fu_103_p4 <= r_reg_169;
        else 
            ap_phi_mux_p_026_rec_i_phi_fu_103_p4 <= p_026_rec_i_reg_99;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    in_stream_TDATA_blk_n_assign_proc : process(in_stream_data_V_0_state, ap_CS_fsm_pp0_stage2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage2, tmp_i_reg_165)
    begin
        if (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (ap_const_boolean_0 = ap_block_pp0_stage2))) then 
            in_stream_TDATA_blk_n <= in_stream_data_V_0_state(0);
        else 
            in_stream_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_stream_TREADY <= in_stream_data_V_0_state(1);
    in_stream_data_V_0_ack_in <= in_stream_data_V_0_state(1);

    in_stream_data_V_0_ack_out_assign_proc : process(ap_CS_fsm_pp0_stage2, ap_enable_reg_pp0_iter0, tmp_i_reg_165, ap_block_pp0_stage2_11001)
    begin
        if (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001))) then 
            in_stream_data_V_0_ack_out <= ap_const_logic_1;
        else 
            in_stream_data_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    in_stream_data_V_0_data_out_assign_proc : process(in_stream_data_V_0_payload_A, in_stream_data_V_0_payload_B, in_stream_data_V_0_sel)
    begin
        if ((in_stream_data_V_0_sel = ap_const_logic_1)) then 
            in_stream_data_V_0_data_out <= in_stream_data_V_0_payload_B;
        else 
            in_stream_data_V_0_data_out <= in_stream_data_V_0_payload_A;
        end if; 
    end process;

    in_stream_data_V_0_load_A <= (in_stream_data_V_0_state_cmp_full and not(in_stream_data_V_0_sel_wr));
    in_stream_data_V_0_load_B <= (in_stream_data_V_0_state_cmp_full and in_stream_data_V_0_sel_wr);
    in_stream_data_V_0_sel <= in_stream_data_V_0_sel_rd;
    in_stream_data_V_0_state_cmp_full <= '0' when (in_stream_data_V_0_state = ap_const_lv2_1) else '1';
    in_stream_data_V_0_vld_in <= in_stream_TVALID;
    in_stream_data_V_0_vld_out <= in_stream_data_V_0_state(0);
    r_cast_i_fu_110_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_p_026_rec_i_phi_fu_103_p4),20));
    r_fu_119_p2 <= std_logic_vector(unsigned(ap_phi_mux_p_026_rec_i_phi_fu_103_p4) + unsigned(ap_const_lv19_1));

    src_bw_data_stream_0_V_blk_n_assign_proc : process(src_bw_data_stream_0_V_full_n, ap_CS_fsm_pp0_stage2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage2, tmp_i_reg_165, ap_CS_fsm_pp0_stage3, ap_block_pp0_stage3, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1, ap_reg_pp0_iter1_tmp_i_reg_165)
    begin
        if ((((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage3)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (ap_const_boolean_0 = ap_block_pp0_stage2)))) then 
            src_bw_data_stream_0_V_blk_n <= src_bw_data_stream_0_V_full_n;
        else 
            src_bw_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_bw_data_stream_0_V_din_assign_proc : process(ap_CS_fsm_pp0_stage2, ap_enable_reg_pp0_iter0, tmp_i_reg_165, ap_CS_fsm_pp0_stage3, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, ap_reg_pp0_iter1_tmp_i_reg_165, tmp_77_reg_174, tmp_78_reg_179, tmp_79_reg_184, tmp_fu_125_p1, ap_block_pp0_stage2_01001, ap_block_pp0_stage3_01001, ap_block_pp0_stage0_01001, ap_block_pp0_stage1_01001)
    begin
        if (((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            src_bw_data_stream_0_V_din <= tmp_79_reg_184;
        elsif (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_bw_data_stream_0_V_din <= tmp_78_reg_179;
        elsif (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage3_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
            src_bw_data_stream_0_V_din <= tmp_77_reg_174;
        elsif (((tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_01001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            src_bw_data_stream_0_V_din <= tmp_fu_125_p1;
        else 
            src_bw_data_stream_0_V_din <= "XXXXXXXX";
        end if; 
    end process;


    src_bw_data_stream_0_V_write_assign_proc : process(ap_CS_fsm_pp0_stage2, ap_enable_reg_pp0_iter0, tmp_i_reg_165, ap_CS_fsm_pp0_stage3, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, ap_reg_pp0_iter1_tmp_i_reg_165, ap_block_pp0_stage0_11001, ap_block_pp0_stage2_11001, ap_block_pp0_stage3_11001, ap_block_pp0_stage1_11001)
    begin
        if ((((ap_reg_pp0_iter1_tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage3_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)) or ((tmp_i_reg_165 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001)))) then 
            src_bw_data_stream_0_V_write <= ap_const_logic_1;
        else 
            src_bw_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_fu_125_p1 <= in_stream_data_V_0_data_out(8 - 1 downto 0);
    tmp_i_fu_114_p2 <= "1" when (signed(r_cast_i_fu_110_p1) < signed(p_read)) else "0";
end behav;
