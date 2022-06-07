############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_resource -core RAM_2P_LUTRAM "check_note_update" r
set_directive_resource -core RAM_2P_LUTRAM "variable_note_pos" r
set_directive_resource -core RAM_2P_LUTRAM "decode" r
set_directive_resource -core RAM_2P_LUTRAM "check_note_update" q
set_directive_resource -core RAM_2P_LUTRAM "check_note_update" r_copy
set_directive_resource -core RAM_2P_LUTRAM "variable_note_update" q
set_directive_resource -core RAM_2P_LUTRAM "variable_note_update" r_copy
set_directive_resource -core RAM_2P_LUTRAM "variable_note_update" qi
set_directive_resource -core RAM_2P_LUTRAM "decode" q
set_directive_resource -core RAM_2P_LUTRAM "decode" r_copy
set_directive_resource -core RAM_2P_LUTRAM "decode" qi
set_directive_resource -core RAM_2P_LUTRAM "variable_note_pos" qi
set_directive_resource -core RAM_2P_LUTRAM "panjue" qi
set_directive_resource -core ROM_2P_LUTRAM "decode" P
set_directive_dependence -variable r -class array -type intra -direction WAR -dependent false "check_note_update/LOOP_check_note_update1"
