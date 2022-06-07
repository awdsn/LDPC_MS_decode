// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module check_formula (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        c_address0,
        c_ce0,
        c_q0,
        H_address0,
        H_ce0,
        H_q0,
        ap_return
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_pp0_stage0 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] c_address0;
output   c_ce0;
input  [0:0] c_q0;
output  [14:0] H_address0;
output   H_ce0;
input  [0:0] H_q0;
output  [0:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg c_ce0;
reg H_ce0;
reg[0:0] ap_return;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln127_fu_278_p2;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln1297_reg_92;
reg   [8:0] i_06_reg_106;
reg   [7:0] j_02_reg_120;
reg   [14:0] indvar_flatten1_reg_134;
reg   [10:0] p_096_14_reg_148;
reg   [10:0] p_0112_13_reg_162;
wire   [7:0] select_ln127_fu_214_p3;
reg   [7:0] select_ln127_reg_378;
wire   [0:0] icmp_ln132_fu_254_p2;
reg   [0:0] icmp_ln132_reg_393;
wire   [14:0] add_ln127_fu_260_p2;
reg   [14:0] add_ln127_reg_397;
wire   [8:0] i_fu_266_p2;
reg   [8:0] i_reg_402;
wire   [0:0] icmp_ln129_fu_272_p2;
reg   [0:0] icmp_ln129_reg_407;
reg   [0:0] icmp_ln127_reg_412;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_icmp_ln1297_phi_fu_96_p6;
wire    ap_block_pp0_stage0;
reg   [8:0] ap_phi_mux_i_06_phi_fu_110_p6;
reg   [7:0] ap_phi_mux_j_02_phi_fu_124_p6;
reg   [14:0] ap_phi_mux_indvar_flatten1_phi_fu_138_p6;
reg   [10:0] ap_phi_mux_p_096_3_phi_fu_192_p4;
reg   [10:0] ap_phi_mux_p_0112_2_phi_fu_180_p4;
wire   [10:0] ap_phi_reg_pp0_iter1_p_0112_2_reg_176;
wire   [10:0] temp_V_fu_294_p2;
wire   [10:0] select_ln133_fu_359_p3;
wire   [10:0] ap_phi_reg_pp0_iter1_p_096_3_reg_188;
wire   [63:0] zext_ln131_fu_222_p1;
wire   [63:0] zext_ln131_3_fu_249_p1;
wire   [7:0] j_fu_200_p2;
wire   [8:0] select_ln129_fu_206_p3;
wire   [15:0] tmp_fu_231_p3;
wire   [16:0] zext_ln131_1_fu_227_p1;
wire   [16:0] zext_ln131_2_fu_239_p1;
wire   [16:0] add_ln131_fu_243_p2;
wire   [0:0] and_ln68_fu_284_p2;
wire   [10:0] zext_ln68_fu_290_p1;
wire   [0:0] trunc_ln1372_1_fu_313_p1;
wire   [1:0] tmp_11_fu_317_p3;
wire   [0:0] trunc_ln1372_fu_309_p1;
wire   [0:0] tmp_10_fu_301_p3;
wire   [1:0] sub_ln1372_fu_325_p2;
wire   [1:0] tmp_7_fu_331_p3;
wire   [1:0] select_ln1372_fu_339_p3;
wire   [0:0] icmp_ln879_1_fu_347_p2;
wire   [10:0] s_sum_V_fu_353_p2;
wire   [0:0] icmp_ln879_fu_368_p2;
reg   [0:0] ap_return_preg;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_103;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_return_preg = 1'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 1'd0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_return_preg <= icmp_ln879_fu_368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln127_reg_412 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_06_reg_106 <= i_reg_402;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        i_06_reg_106 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln127_reg_412 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1297_reg_92 <= icmp_ln129_reg_407;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        icmp_ln1297_reg_92 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln127_reg_412 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten1_reg_134 <= add_ln127_reg_397;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        indvar_flatten1_reg_134 <= 15'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln127_reg_412 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_02_reg_120 <= select_ln127_reg_378;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        j_02_reg_120 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln127_reg_412 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_0112_13_reg_162 <= ap_phi_mux_p_0112_2_phi_fu_180_p4;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        p_0112_13_reg_162 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln127_reg_412 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_096_14_reg_148 <= ap_phi_mux_p_096_3_phi_fu_192_p4;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        p_096_14_reg_148 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln127_reg_397 <= add_ln127_fu_260_p2;
        i_reg_402 <= i_fu_266_p2;
        icmp_ln129_reg_407 <= icmp_ln129_fu_272_p2;
        select_ln127_reg_378 <= select_ln127_fu_214_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln127_reg_412 <= icmp_ln127_fu_278_p2;
        icmp_ln132_reg_393 <= icmp_ln132_fu_254_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        H_ce0 = 1'b1;
    end else begin
        H_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_103)) begin
        if ((icmp_ln127_reg_412 == 1'd1)) begin
            ap_phi_mux_i_06_phi_fu_110_p6 = 9'd0;
        end else if ((icmp_ln127_reg_412 == 1'd0)) begin
            ap_phi_mux_i_06_phi_fu_110_p6 = i_reg_402;
        end else begin
            ap_phi_mux_i_06_phi_fu_110_p6 = i_06_reg_106;
        end
    end else begin
        ap_phi_mux_i_06_phi_fu_110_p6 = i_06_reg_106;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_103)) begin
        if ((icmp_ln127_reg_412 == 1'd1)) begin
            ap_phi_mux_icmp_ln1297_phi_fu_96_p6 = 1'd0;
        end else if ((icmp_ln127_reg_412 == 1'd0)) begin
            ap_phi_mux_icmp_ln1297_phi_fu_96_p6 = icmp_ln129_reg_407;
        end else begin
            ap_phi_mux_icmp_ln1297_phi_fu_96_p6 = icmp_ln1297_reg_92;
        end
    end else begin
        ap_phi_mux_icmp_ln1297_phi_fu_96_p6 = icmp_ln1297_reg_92;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_103)) begin
        if ((icmp_ln127_reg_412 == 1'd1)) begin
            ap_phi_mux_indvar_flatten1_phi_fu_138_p6 = 15'd0;
        end else if ((icmp_ln127_reg_412 == 1'd0)) begin
            ap_phi_mux_indvar_flatten1_phi_fu_138_p6 = add_ln127_reg_397;
        end else begin
            ap_phi_mux_indvar_flatten1_phi_fu_138_p6 = indvar_flatten1_reg_134;
        end
    end else begin
        ap_phi_mux_indvar_flatten1_phi_fu_138_p6 = indvar_flatten1_reg_134;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_103)) begin
        if ((icmp_ln127_reg_412 == 1'd1)) begin
            ap_phi_mux_j_02_phi_fu_124_p6 = 8'd0;
        end else if ((icmp_ln127_reg_412 == 1'd0)) begin
            ap_phi_mux_j_02_phi_fu_124_p6 = select_ln127_reg_378;
        end else begin
            ap_phi_mux_j_02_phi_fu_124_p6 = j_02_reg_120;
        end
    end else begin
        ap_phi_mux_j_02_phi_fu_124_p6 = j_02_reg_120;
    end
end

always @ (*) begin
    if ((icmp_ln132_reg_393 == 1'd0)) begin
        ap_phi_mux_p_0112_2_phi_fu_180_p4 = temp_V_fu_294_p2;
    end else if ((icmp_ln132_reg_393 == 1'd1)) begin
        ap_phi_mux_p_0112_2_phi_fu_180_p4 = 11'd0;
    end else begin
        ap_phi_mux_p_0112_2_phi_fu_180_p4 = ap_phi_reg_pp0_iter1_p_0112_2_reg_176;
    end
end

always @ (*) begin
    if ((icmp_ln132_reg_393 == 1'd0)) begin
        ap_phi_mux_p_096_3_phi_fu_192_p4 = p_096_14_reg_148;
    end else if ((icmp_ln132_reg_393 == 1'd1)) begin
        ap_phi_mux_p_096_3_phi_fu_192_p4 = select_ln133_fu_359_p3;
    end else begin
        ap_phi_mux_p_096_3_phi_fu_192_p4 = ap_phi_reg_pp0_iter1_p_096_3_reg_188;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_fu_278_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln127_reg_412 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_return = icmp_ln879_fu_368_p2;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        c_ce0 = 1'b1;
    end else begin
        c_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((ap_reset_idle_pp0 == 1'b0)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_reset_idle_pp0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign H_address0 = zext_ln131_3_fu_249_p1;

assign add_ln127_fu_260_p2 = (ap_phi_mux_indvar_flatten1_phi_fu_138_p6 + 15'd1);

assign add_ln131_fu_243_p2 = (zext_ln131_1_fu_227_p1 + zext_ln131_2_fu_239_p1);

assign and_ln68_fu_284_p2 = (c_q0 & H_q0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_103 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter1_p_0112_2_reg_176 = 'bx;

assign ap_phi_reg_pp0_iter1_p_096_3_reg_188 = 'bx;

assign c_address0 = zext_ln131_fu_222_p1;

assign i_fu_266_p2 = (select_ln129_fu_206_p3 + 9'd1);

assign icmp_ln127_fu_278_p2 = ((ap_phi_mux_indvar_flatten1_phi_fu_138_p6 == 15'd32767) ? 1'b1 : 1'b0);

assign icmp_ln129_fu_272_p2 = ((i_fu_266_p2 == 9'd256) ? 1'b1 : 1'b0);

assign icmp_ln132_fu_254_p2 = ((select_ln129_fu_206_p3 == 9'd255) ? 1'b1 : 1'b0);

assign icmp_ln879_1_fu_347_p2 = ((select_ln1372_fu_339_p3 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln879_fu_368_p2 = ((ap_phi_mux_p_096_3_phi_fu_192_p4 == 11'd128) ? 1'b1 : 1'b0);

assign j_fu_200_p2 = (ap_phi_mux_j_02_phi_fu_124_p6 + 8'd1);

assign s_sum_V_fu_353_p2 = (11'd1 + p_096_14_reg_148);

assign select_ln127_fu_214_p3 = ((ap_phi_mux_icmp_ln1297_phi_fu_96_p6[0:0] === 1'b1) ? j_fu_200_p2 : ap_phi_mux_j_02_phi_fu_124_p6);

assign select_ln129_fu_206_p3 = ((ap_phi_mux_icmp_ln1297_phi_fu_96_p6[0:0] === 1'b1) ? 9'd0 : ap_phi_mux_i_06_phi_fu_110_p6);

assign select_ln133_fu_359_p3 = ((icmp_ln879_1_fu_347_p2[0:0] === 1'b1) ? s_sum_V_fu_353_p2 : p_096_14_reg_148);

assign select_ln1372_fu_339_p3 = ((tmp_10_fu_301_p3[0:0] === 1'b1) ? sub_ln1372_fu_325_p2 : tmp_7_fu_331_p3);

assign sub_ln1372_fu_325_p2 = (2'd0 - tmp_11_fu_317_p3);

assign temp_V_fu_294_p2 = (zext_ln68_fu_290_p1 + p_0112_13_reg_162);

assign tmp_10_fu_301_p3 = temp_V_fu_294_p2[32'd10];

assign tmp_11_fu_317_p3 = {{1'd0}, {trunc_ln1372_1_fu_313_p1}};

assign tmp_7_fu_331_p3 = {{1'd0}, {trunc_ln1372_fu_309_p1}};

assign tmp_fu_231_p3 = {{select_ln127_fu_214_p3}, {8'd0}};

assign trunc_ln1372_1_fu_313_p1 = temp_V_fu_294_p2[0:0];

assign trunc_ln1372_fu_309_p1 = temp_V_fu_294_p2[0:0];

assign zext_ln131_1_fu_227_p1 = select_ln129_fu_206_p3;

assign zext_ln131_2_fu_239_p1 = tmp_fu_231_p3;

assign zext_ln131_3_fu_249_p1 = add_ln131_fu_243_p2;

assign zext_ln131_fu_222_p1 = select_ln129_fu_206_p3;

assign zext_ln68_fu_290_p1 = and_ln68_fu_284_p2;

endmodule //check_formula