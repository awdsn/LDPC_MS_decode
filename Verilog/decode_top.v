`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/30 17:11:30
// Design Name: 
// Module Name: decode_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decode_top(
   clk_in1,
   clk_in2,
    ap_rst,
    oTXDATA//串口发送数据
    //oDATA//串口接收数据
    );
 input clk_in1;
 input clk_in2;
 input ap_rst;
 output oTXDATA; 
 //output oDATA;
 wire ap_clk;
 wire clk_50;
 wire c_ce0;
 wire c_we0;
 wire ap_done;
 wire ap_idle;
 wire ap_ready;
 wire [7:0]c_address0; 
 wire c_d0;
 reg c_q0;
 reg ena;
 wire [7:0]addra;
 reg [7:0]addrb;
 wire doutb;
 reg [7:0]iDATA;
 wire oTXDATA;
 wire oFINISH;
 //wire [7:0]oDATA;
 //wire oDONE;
 reg mem_kaishi=0;
 
 reg RS232_kaishi=0;
 reg [7:0]mem_temp[31:0];//将1位发送数据转变为8位
 assign addra=c_address0-1'b1;
 
 always@(posedge ap_clk)begin
    if(ap_done)
          mem_kaishi<=1;////译码完成的数据已经写入mem中，可以读取；并且关闭写入。
 end
 reg kaishi_temp=0;
 always@(posedge ap_clk)begin///////负责控制mem中是否写入数据
    if(mem_kaishi)begin
        ena<=0;
       end
    else 
        ena<=c_ce0;
 end
 always@(posedge ap_clk)begin
    if(!ap_rst)
        addrb<=0;
    if(mem_kaishi)
          case(kaishi_temp)
           1'b0:  begin
             addrb<=0;
             kaishi_temp<=1;
             end
            1'b1:   addrb<=addrb+1;
          endcase
        if(addrb==8'hff)
            RS232_kaishi<=1;
 end
 reg [4:0]temp;
 always@(posedge ap_clk)begin
    temp=addrb[7:3];//转变成8位后的数目
 end
        
 always@(posedge ap_clk)begin
      case(addrb[2:0])
        3'b000:mem_temp[temp][0]<=doutb;
        3'b001:mem_temp[temp][1]<=doutb;
        3'b010:mem_temp[temp][2]<=doutb;
        3'b011:mem_temp[temp][3]<=doutb;
        3'b100:mem_temp[temp][4]<=doutb;
        3'b101:mem_temp[temp][5]<=doutb;
        3'b110:mem_temp[temp][6]<=doutb;
        3'b111:mem_temp[temp][7]<=doutb;
    endcase
 end
 reg [3:0]i=0;
 always@(posedge ap_clk)begin
    if(!ap_rst)
        iDATA<=8'hzz;
    if(RS232_kaishi)
        iDATA<=mem_temp[i];
        if(oFINISH)
            i=i+1;
 end
 wire locked;
  clk_g instance_name
   (
    // Clock out ports
    .clk_out1(ap_clk),     // output clk_out1
    .clk_out2(clk_50),     // output clk_out2
    // Status and control signals
    .reset(!ap_rst), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1_p(clk_in1),    // input clk_in1_p
    .clk_in1_n(clk_in2)       // input clk_in1_n
    );    
MS_decode MS_decode (
  .c_ce0(c_ce0),            // output wire c_ce0
  .c_we0(c_we0),            // output wire c_we0
  .ap_clk(ap_clk),          // input wire ap_clk
  .ap_rst(!ap_rst),          // input wire ap_rst
  .ap_start(1),      // input wire ap_start
  .ap_done(ap_done),        // output wire ap_done
  .ap_idle(ap_idle),        // output wire ap_idle
  .ap_ready(ap_ready),      // output wire ap_ready
  .c_address0(c_address0),  // output wire [7 : 0] c_address0
  .c_d0(c_d0),              // output wire [0 : 0] c_d0
  .c_q0(c_q0)              // input wire [0 : 0] c_q0
);
mem decode_mem (
  .clka(ap_clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(c_we0),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [7 : 0] addra
  .dina(c_d0),    // input wire [0 : 0] dina
  .clkb(ap_clk),    // input wire clkb
  .addrb(addrb),  // input wire [7 : 0] addrb
  .doutb(doutb)  // output wire [0 : 0] doutb
);
RS232_tx	RS232_tx
(
	.clk_s			(clk_50	),
	.rstn_s			(ap_rst	),
	.iSEND			(RS232_kaishi	),
	.iDATA			(iDATA	),
	.oDATA			(oTXDATA),
	.oFINISH		(oFINISH)	
);
//rx_rs232	rx_rs232_INST
//(
//	.clk_s			(clk_50	),		//clk=143MHz
//	.rstn_s			(ap_rst	),		//rstn_s=0 effect
//	.iDATA			(oTXDATA	),
//	.oDATA			(oDATA	),
//	.oDONE			(oDONE	)		//1Frame finish oDONE=1
//);
endmodule
