// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module variable_note_pos (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        H_address0,
        H_ce0,
        H_q0,
        qi_V_4_address1,
        qi_V_4_ce1,
        qi_V_4_we1,
        qi_V_4_d1,
        r_V_address0,
        r_V_ce0,
        r_V_q0
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_pp0_stage0 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [14:0] H_address0;
output   H_ce0;
input  [0:0] H_q0;
output  [7:0] qi_V_4_address1;
output   qi_V_4_ce1;
output   qi_V_4_we1;
output  [7:0] qi_V_4_d1;
output  [14:0] r_V_address0;
output   r_V_ce0;
input  [4:0] r_V_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg H_ce0;
reg qi_V_4_ce1;
reg qi_V_4_we1;
reg r_V_ce0;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln82_fu_307_p2;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [7:0] P_address0;
reg    P_ce0;
wire   [4:0] P_q0;
reg   [0:0] icmp_ln845_reg_130;
reg   [7:0] j_04_reg_144;
reg   [8:0] i_02_reg_158;
reg   [14:0] indvar_flatten1_reg_172;
reg  signed [7:0] p_Val2_3_reg_201;
wire   [8:0] select_ln82_fu_242_p3;
reg   [8:0] select_ln82_reg_535;
wire   [63:0] zext_ln86_fu_250_p1;
reg   [63:0] zext_ln86_reg_540;
wire   [0:0] icmp_ln89_fu_283_p2;
reg   [0:0] icmp_ln89_reg_555;
wire   [14:0] add_ln82_fu_289_p2;
reg   [14:0] add_ln82_reg_559;
wire   [7:0] j_fu_295_p2;
reg   [7:0] j_reg_569;
wire   [0:0] icmp_ln84_fu_301_p2;
reg   [0:0] icmp_ln84_reg_574;
reg   [0:0] icmp_ln82_reg_579;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0_subdone;
reg   [0:0] ap_phi_mux_icmp_ln845_phi_fu_134_p6;
wire    ap_block_pp0_stage0;
reg   [7:0] ap_phi_mux_j_04_phi_fu_148_p6;
reg   [8:0] ap_phi_mux_i_02_phi_fu_162_p6;
reg   [14:0] ap_phi_mux_indvar_flatten1_phi_fu_176_p6;
reg   [7:0] ap_phi_mux_p_Val2_s_phi_fu_220_p4;
wire   [7:0] ap_phi_reg_pp0_iter0_p_Val2_s_reg_215;
reg   [7:0] ap_phi_reg_pp0_iter1_p_Val2_s_reg_215;
wire  signed [7:0] p_Val2_8_fu_421_p3;
wire   [63:0] zext_ln1265_2_fu_277_p1;
wire   [8:0] i_fu_228_p2;
wire   [7:0] select_ln84_fu_234_p3;
wire   [15:0] tmp_fu_259_p3;
wire   [16:0] zext_ln1265_fu_255_p1;
wire   [16:0] zext_ln1265_1_fu_267_p1;
wire   [16:0] add_ln1265_fu_271_p2;
wire  signed [5:0] rhs_V_fu_317_p3;
wire  signed [8:0] sext_ln728_fu_325_p1;
wire  signed [8:0] lhs_V_fu_313_p1;
wire   [8:0] ret_V_2_fu_333_p2;
wire  signed [7:0] sext_ln1192_fu_329_p1;
wire   [7:0] p_Val2_6_fu_347_p2;
wire   [0:0] p_Result_4_fu_353_p3;
wire   [0:0] p_Result_3_fu_339_p3;
wire   [0:0] xor_ln786_fu_361_p2;
wire   [0:0] xor_ln340_fu_379_p2;
wire   [0:0] xor_ln340_2_fu_373_p2;
wire   [0:0] underflow_fu_367_p2;
wire   [7:0] select_ln388_fu_399_p3;
wire   [0:0] or_ln340_fu_385_p2;
wire   [0:0] and_ln340_fu_415_p2;
wire   [7:0] select_ln340_fu_391_p3;
wire   [7:0] select_ln86_fu_407_p3;
wire  signed [5:0] lhs_V_1_fu_430_p3;
wire  signed [8:0] rhs_V_1_fu_442_p1;
wire  signed [8:0] sext_ln728_1_fu_438_p1;
wire   [8:0] ret_V_fu_450_p2;
wire  signed [7:0] sext_ln1192_1_fu_446_p1;
wire   [7:0] p_Val2_10_fu_464_p2;
wire   [0:0] p_Result_2_fu_470_p3;
wire   [0:0] p_Result_s_fu_456_p3;
wire   [0:0] xor_ln786_1_fu_478_p2;
wire   [0:0] xor_ln340_1_fu_496_p2;
wire   [0:0] xor_ln340_3_fu_490_p2;
wire   [0:0] underflow_1_fu_484_p2;
wire   [0:0] or_ln340_2_fu_502_p2;
wire   [7:0] select_ln340_1_fu_508_p3;
wire   [7:0] select_ln388_1_fu_516_p3;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_121;
reg    ap_condition_39;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

variable_note_pos_P #(
    .DataWidth( 5 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
P_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(P_address0),
    .ce0(P_ce0),
    .q0(P_q0)
);

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
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_39)) begin
        if ((icmp_ln89_fu_283_p2 == 1'd1)) begin
            ap_phi_reg_pp0_iter1_p_Val2_s_reg_215 <= 8'd0;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_p_Val2_s_reg_215 <= ap_phi_reg_pp0_iter0_p_Val2_s_reg_215;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln82_reg_579 == 1'd0))) begin
        i_02_reg_158 <= select_ln82_reg_535;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_reg_579 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        i_02_reg_158 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln82_reg_579 == 1'd0))) begin
        icmp_ln845_reg_130 <= icmp_ln84_reg_574;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_reg_579 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        icmp_ln845_reg_130 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln82_reg_579 == 1'd0))) begin
        indvar_flatten1_reg_172 <= add_ln82_reg_559;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_reg_579 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        indvar_flatten1_reg_172 <= 15'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln82_reg_579 == 1'd0))) begin
        j_04_reg_144 <= j_reg_569;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_reg_579 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        j_04_reg_144 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln82_reg_579 == 1'd0))) begin
        p_Val2_3_reg_201 <= ap_phi_mux_p_Val2_s_phi_fu_220_p4;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_reg_579 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        p_Val2_3_reg_201 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln82_reg_559 <= add_ln82_fu_289_p2;
        icmp_ln84_reg_574 <= icmp_ln84_fu_301_p2;
        j_reg_569 <= j_fu_295_p2;
        select_ln82_reg_535 <= select_ln82_fu_242_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln82_reg_579 <= icmp_ln82_fu_307_p2;
        icmp_ln89_reg_555 <= icmp_ln89_fu_283_p2;
        zext_ln86_reg_540[8 : 0] <= zext_ln86_fu_250_p1[8 : 0];
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        P_ce0 = 1'b1;
    end else begin
        P_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_reg_579 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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
    if ((1'b1 == ap_condition_121)) begin
        if ((icmp_ln82_reg_579 == 1'd1)) begin
            ap_phi_mux_i_02_phi_fu_162_p6 = 9'd0;
        end else if ((icmp_ln82_reg_579 == 1'd0)) begin
            ap_phi_mux_i_02_phi_fu_162_p6 = select_ln82_reg_535;
        end else begin
            ap_phi_mux_i_02_phi_fu_162_p6 = i_02_reg_158;
        end
    end else begin
        ap_phi_mux_i_02_phi_fu_162_p6 = i_02_reg_158;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_121)) begin
        if ((icmp_ln82_reg_579 == 1'd1)) begin
            ap_phi_mux_icmp_ln845_phi_fu_134_p6 = 1'd0;
        end else if ((icmp_ln82_reg_579 == 1'd0)) begin
            ap_phi_mux_icmp_ln845_phi_fu_134_p6 = icmp_ln84_reg_574;
        end else begin
            ap_phi_mux_icmp_ln845_phi_fu_134_p6 = icmp_ln845_reg_130;
        end
    end else begin
        ap_phi_mux_icmp_ln845_phi_fu_134_p6 = icmp_ln845_reg_130;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_121)) begin
        if ((icmp_ln82_reg_579 == 1'd1)) begin
            ap_phi_mux_indvar_flatten1_phi_fu_176_p6 = 15'd0;
        end else if ((icmp_ln82_reg_579 == 1'd0)) begin
            ap_phi_mux_indvar_flatten1_phi_fu_176_p6 = add_ln82_reg_559;
        end else begin
            ap_phi_mux_indvar_flatten1_phi_fu_176_p6 = indvar_flatten1_reg_172;
        end
    end else begin
        ap_phi_mux_indvar_flatten1_phi_fu_176_p6 = indvar_flatten1_reg_172;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_121)) begin
        if ((icmp_ln82_reg_579 == 1'd1)) begin
            ap_phi_mux_j_04_phi_fu_148_p6 = 8'd0;
        end else if ((icmp_ln82_reg_579 == 1'd0)) begin
            ap_phi_mux_j_04_phi_fu_148_p6 = j_reg_569;
        end else begin
            ap_phi_mux_j_04_phi_fu_148_p6 = j_04_reg_144;
        end
    end else begin
        ap_phi_mux_j_04_phi_fu_148_p6 = j_04_reg_144;
    end
end

always @ (*) begin
    if ((icmp_ln89_reg_555 == 1'd0)) begin
        ap_phi_mux_p_Val2_s_phi_fu_220_p4 = p_Val2_8_fu_421_p3;
    end else begin
        ap_phi_mux_p_Val2_s_phi_fu_220_p4 = ap_phi_reg_pp0_iter1_p_Val2_s_reg_215;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln82_fu_307_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        qi_V_4_ce1 = 1'b1;
    end else begin
        qi_V_4_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln89_reg_555 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        qi_V_4_we1 = 1'b1;
    end else begin
        qi_V_4_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r_V_ce0 = 1'b1;
    end else begin
        r_V_ce0 = 1'b0;
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
            end else if (((ap_reset_idle_pp0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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

assign H_address0 = zext_ln1265_2_fu_277_p1;

assign P_address0 = zext_ln86_fu_250_p1;

assign add_ln1265_fu_271_p2 = (zext_ln1265_fu_255_p1 + zext_ln1265_1_fu_267_p1);

assign add_ln82_fu_289_p2 = (ap_phi_mux_indvar_flatten1_phi_fu_176_p6 + 15'd1);

assign and_ln340_fu_415_p2 = (or_ln340_fu_385_p2 & H_q0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_121 = ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0));
end

always @ (*) begin
    ap_condition_39 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_p_Val2_s_reg_215 = 'bx;

assign i_fu_228_p2 = (ap_phi_mux_i_02_phi_fu_162_p6 + 9'd1);

assign icmp_ln82_fu_307_p2 = ((ap_phi_mux_indvar_flatten1_phi_fu_176_p6 == 15'd32767) ? 1'b1 : 1'b0);

assign icmp_ln84_fu_301_p2 = ((j_fu_295_p2 == 8'd128) ? 1'b1 : 1'b0);

assign icmp_ln89_fu_283_p2 = ((select_ln84_fu_234_p3 == 8'd127) ? 1'b1 : 1'b0);

assign j_fu_295_p2 = (select_ln84_fu_234_p3 + 8'd1);

assign lhs_V_1_fu_430_p3 = {{P_q0}, {1'd0}};

assign lhs_V_fu_313_p1 = p_Val2_3_reg_201;

assign or_ln340_2_fu_502_p2 = (xor_ln340_1_fu_496_p2 | p_Result_2_fu_470_p3);

assign or_ln340_fu_385_p2 = (xor_ln340_fu_379_p2 | p_Result_4_fu_353_p3);

assign p_Result_2_fu_470_p3 = p_Val2_10_fu_464_p2[32'd7];

assign p_Result_3_fu_339_p3 = ret_V_2_fu_333_p2[32'd8];

assign p_Result_4_fu_353_p3 = p_Val2_6_fu_347_p2[32'd7];

assign p_Result_s_fu_456_p3 = ret_V_fu_450_p2[32'd8];

assign p_Val2_10_fu_464_p2 = ($signed(sext_ln1192_1_fu_446_p1) + $signed(p_Val2_8_fu_421_p3));

assign p_Val2_6_fu_347_p2 = ($signed(p_Val2_3_reg_201) + $signed(sext_ln1192_fu_329_p1));

assign p_Val2_8_fu_421_p3 = ((and_ln340_fu_415_p2[0:0] === 1'b1) ? select_ln340_fu_391_p3 : select_ln86_fu_407_p3);

assign qi_V_4_address1 = zext_ln86_reg_540;

assign qi_V_4_d1 = ((or_ln340_2_fu_502_p2[0:0] === 1'b1) ? select_ln340_1_fu_508_p3 : select_ln388_1_fu_516_p3);

assign r_V_address0 = zext_ln1265_2_fu_277_p1;

assign ret_V_2_fu_333_p2 = ($signed(sext_ln728_fu_325_p1) + $signed(lhs_V_fu_313_p1));

assign ret_V_fu_450_p2 = ($signed(rhs_V_1_fu_442_p1) + $signed(sext_ln728_1_fu_438_p1));

assign rhs_V_1_fu_442_p1 = p_Val2_8_fu_421_p3;

assign rhs_V_fu_317_p3 = {{r_V_q0}, {1'd0}};

assign select_ln340_1_fu_508_p3 = ((xor_ln340_3_fu_490_p2[0:0] === 1'b1) ? 8'd127 : p_Val2_10_fu_464_p2);

assign select_ln340_fu_391_p3 = ((xor_ln340_2_fu_373_p2[0:0] === 1'b1) ? 8'd127 : p_Val2_6_fu_347_p2);

assign select_ln388_1_fu_516_p3 = ((underflow_1_fu_484_p2[0:0] === 1'b1) ? 8'd128 : p_Val2_10_fu_464_p2);

assign select_ln388_fu_399_p3 = ((underflow_fu_367_p2[0:0] === 1'b1) ? 8'd128 : p_Val2_6_fu_347_p2);

assign select_ln82_fu_242_p3 = ((ap_phi_mux_icmp_ln845_phi_fu_134_p6[0:0] === 1'b1) ? i_fu_228_p2 : ap_phi_mux_i_02_phi_fu_162_p6);

assign select_ln84_fu_234_p3 = ((ap_phi_mux_icmp_ln845_phi_fu_134_p6[0:0] === 1'b1) ? 8'd0 : ap_phi_mux_j_04_phi_fu_148_p6);

assign select_ln86_fu_407_p3 = ((H_q0[0:0] === 1'b1) ? select_ln388_fu_399_p3 : p_Val2_3_reg_201);

assign sext_ln1192_1_fu_446_p1 = lhs_V_1_fu_430_p3;

assign sext_ln1192_fu_329_p1 = rhs_V_fu_317_p3;

assign sext_ln728_1_fu_438_p1 = lhs_V_1_fu_430_p3;

assign sext_ln728_fu_325_p1 = rhs_V_fu_317_p3;

assign tmp_fu_259_p3 = {{select_ln84_fu_234_p3}, {8'd0}};

assign underflow_1_fu_484_p2 = (xor_ln786_1_fu_478_p2 & p_Result_s_fu_456_p3);

assign underflow_fu_367_p2 = (xor_ln786_fu_361_p2 & p_Result_3_fu_339_p3);

assign xor_ln340_1_fu_496_p2 = (p_Result_s_fu_456_p3 ^ 1'd1);

assign xor_ln340_2_fu_373_p2 = (p_Result_4_fu_353_p3 ^ p_Result_3_fu_339_p3);

assign xor_ln340_3_fu_490_p2 = (p_Result_s_fu_456_p3 ^ p_Result_2_fu_470_p3);

assign xor_ln340_fu_379_p2 = (p_Result_3_fu_339_p3 ^ 1'd1);

assign xor_ln786_1_fu_478_p2 = (p_Result_2_fu_470_p3 ^ 1'd1);

assign xor_ln786_fu_361_p2 = (p_Result_4_fu_353_p3 ^ 1'd1);

assign zext_ln1265_1_fu_267_p1 = tmp_fu_259_p3;

assign zext_ln1265_2_fu_277_p1 = add_ln1265_fu_271_p2;

assign zext_ln1265_fu_255_p1 = select_ln82_fu_242_p3;

assign zext_ln86_fu_250_p1 = select_ln82_fu_242_p3;

always @ (posedge ap_clk) begin
    zext_ln86_reg_540[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
end

endmodule //variable_note_pos
