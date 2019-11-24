`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 18:28:32
// Design Name: 
// Module Name: topvivado
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


module vivadotop(
input clk100,
input wire pclk,
input wire vsync,
input wire href,
input wire [7:0] d,

input wire key, 
//--------------------------SRAM
inout wire [15:0] 	sram_data,

output reg			sram_oe_r,
output reg			sram_ce_r,
output reg			sram_we_r,
output reg			sram_ub_r,
output reg			sram_lb_r,
output wire [18:0] 	sram_addr,
//------------------------------
output wire[4:0] vga_red,
output wire[5:0] vga_green,
output wire[4:0] vga_blue, 
output wire vga_hsync,
output wire vga_vsync,
output wire xclk,
output wire I2C_SCLK,
output wire I2C_SDAT,
output wire pwdm,
output wire reset_cam,
input wire uart_rxd,
output wire uart_txd
    );
      parameter hRez   = 800;
      parameter hStartSync   = 840;
      parameter hEndSync     = 800+40+128;
      parameter hMaxCount    = 1056;
    
      parameter vRez         = 600;
      parameter vStartSync   = 601;
      parameter vEndSync     = 600+1+4;
      parameter vMaxCount    = 628;
    
    parameter hsync_active   =0;
    parameter vsync_active  = 0;
    reg[10:0] hCounter;
    reg[10:0] vCounter;    
    reg[16:0] address;  
    reg blank;
    
    wire [15:0] frame_pixel;
    wire [16:0] frame_addr;
	
	wire [10:0] HCnt;
	wire [10:0] VCnt;
	wire   clk25;
	wire   clk40;
//----------------------------cap
	reg [15:0]	cap_pixel;
	reg 		blank_cap = 1;
	reg [18:0]	cap_addr;
//------------------------------	
   initial   hCounter = 10'b0;
   initial   vCounter = 10'b0;  
   initial   address = 17'b0;   
   initial   blank = 1'b1;    
   
     wire pwdm;
   wire reset_cam;
   
   assign pwdm = 1'b0;
   assign reset_cam = 1'b1;
   assign xclk = clk40;   //摄像头时钟
   
   assign frame_addr = address;
   assign HCnt = hCounter;
   assign VCnt = vCounter;
   
   always@(posedge clk40)begin
            if( hCounter == hMaxCount-1 )begin
   				hCounter <=  10'b0;
   				if (vCounter == vMaxCount-1 )
   					vCounter <=  10'b0;
   				else
   					vCounter <= vCounter+1;
   				end
   			else
   				hCounter <= hCounter+1;
   
   			if (blank ==0) begin
 //  				vga_red   <= 5'b1;//frame_pixel[15:11] ; 
 //  				vga_green <= 6'b1;//frame_pixel[10:5];
 //  				vga_blue  <= 5'b1;//frame_pixel[4:0];
   				red_post  <= 5'b1;//frame_pixel[15:11] ; 
   				green_post <= 6'b1;//frame_pixel[10:5];
   				blue_post  <= 5'b1;//frame_pixel[4:0];
   				end
			//-------------------------------------
			else if(blank_cap == 0) begin
//				vga_red   <= cap_pixel[15:11] ; 
//				vga_green <= cap_pixel[10:5];
//				vga_blue  <= cap_pixel[4:0];
				red_post   <= cap_pixel[15:11] ; 
				green_post <= cap_pixel[10:5];
				blue_post  <= cap_pixel[4:0];
				end
			//-------------------------------------
   			else begin
//   				vga_red   <= 5'b0;
//   				vga_green <= 6'b0;
//   				vga_blue  <= 5'b0;
   				red_post   <= 5'b0;
   				green_post <= 6'b0;
   				blue_post  <= 5'b0;   				
   			     end;
   	
   			if(  vCounter  >= 360+50 || vCounter  < 120+50) begin
   				address <= 17'b0; 
   				blank <= 1;
				//----------
				cap_addr <= 0;
				blank_cap <= 1;
				//----------
   				end
   			else begin
   				if ( hCounter  < 480-160 && hCounter  >= 160-160) begin
   					blank <= 0;
   					address <= address+1;
   					end
   				else
   					blank <= 1;
				//-------------------------------------------------------
				if ( hCounter  < 480+250 && hCounter  >= 160+250) begin
					blank_cap <= 0;
					cap_addr <= cap_addr+1;
					end
				else 
					blank_cap <= 1;
				//-------------------------------------------------------
   				end;
			if( hCounter > hStartSync && hCounter <= hEndSync)
//   				vga_hsync <= hsync_active;
   				hsync_post <= hsync_active;
   			else
//   				vga_hsync <= ~ hsync_active;
   				hsync_post <= ~ hsync_active;
   			if( vCounter >= vStartSync && vCounter < vEndSync )
//   				vga_vsync <= vsync_active;
   				vsync_post <= vsync_active;
   			else
//   				vga_vsync <= ~ vsync_active;
   				vsync_post <= ~ vsync_active;

   end 
//--------------------------------
wire wclk; 
wire we;
wire [15:0] dout;
wire [16:0] addr;

//--------------------------------
     clk_wiz_0 clk_wiz_0
    (
     // Clock out ports
     .clk_out1(clk25),     // output clk_out1
     .clk_out2(clk40), 
    // .clk_out3(clk80),
     //.clk_out4(clk10),  
    // Clock in ports
     .clk_in1(clk100));      // input clk_in1
//----------------------
blk_mem_gen_0 blk_mem_gen_0 (
  .clka(wclk),    // input wire clka
  .wea(we),      // input wire [0 : 0] wea
  .addra(addr),  // input wire [16 : 0] addra
  .dina(dout),    // input wire [15 : 0] dina
  .clkb(clk40),    // input wire clkb
  .addrb(frame_addr),  // input wire [16 : 0] addrb
  .doutb(frame_pixel)  // output wire [15 : 0] doutb
);    
//---------------------------
camCap_0 camCap_0 (
  .pclk(pclk),    // input wire pclk
  .vsync(vsync),  // input wire vsync
  .href(href),    // input wire href
  .d(d),          // input wire [7 : 0] d
  .addr(addr),    // output wire [16 : 0] addr
  .dout(dout),    // output wire [15 : 0] dout
  .we(we),        // output wire we
  .wclk(wclk)    // output wire wclk
);    
//------------------------
IICctrl_0 IICctrl_0 (
  .iCLK(clk25),          // input wire iCLK
  .I2C_SCLK(I2C_SCLK),  // output wire I2C_SCLK
  .I2C_SDAT(I2C_SDAT)  // inout wire I2C_SDAT
);  
//----------------------key
wire 		key1_flag;

key u_key(
	.clk		(clk40),
	.key1		(key),	
	.key1_flag  (key1_flag)
);
//-----------------SRAM_TIMING
parameter SRAM_ADDR_END = 76800;		
reg	[2:0]	state = 0;	
reg			en = 0;
reg [15:0]	sram_din;
reg 		read = 0;
	
assign sram_data = (en)? 16'bz:sram_din;
assign sram_addr = (read)? cap_addr:{2'b00,frame_addr};  //与BRAM的地址一致，保存BRAM的图像数据

always @(negedge clk40)
	//if(en == 0)
		sram_din <= {2{frame_pixel[10:5],2'b0}};
//---
always @(posedge clk40)
	case(state)
//	0:	if(key1_flag == 1)
//			state <= 1;
	0:	if(frame_addr == SRAM_ADDR_END-1) begin
	        udqm <= ~udqm;
			state <= 1;end
	1:	begin  //开始写数据
			sram_oe_r <= 1'b1;
			sram_we_r <= 1'b0;
			sram_ce_r <= 1'b0;
			sram_ub_r <= udqm;//1'b0;
			sram_lb_r <= ~udqm;//1'b0;
			en <=0;
			read <=0;
			if(frame_addr == SRAM_ADDR_END-1)
				state <= 2;
			end
	2:	begin //数据写完，开始读数据
			sram_oe_r <= 1'b0;
			sram_we_r <= 1'b1;
			sram_ce_r <= 1'b0;
			sram_ub_r <= 1'b0;
			sram_lb_r <= 1'b0;
			en <= 1;	
			read <= 1;
			state <= 0;
			end
	default: ;
	endcase
//---------------
always @(negedge clk40)
	if(en == 1)
		cap_pixel <= sram_data;
	else 
		cap_pixel <= 16'b00000_000000_00000;
//---
reg udqm = 1'b0;
//////////////////////////////////////////////////////////////////
reg [4:0]red_post;
reg [5:0]green_post;
reg [4:0]blue_post;
reg      hsync_post;
reg      vsync_post;
wire      vga_en;
assign vga_en = ((hCounter > hStartSync && hCounter <= hEndSync)&&(vCounter >= vStartSync && vCounter < vEndSync ))? 1'b0:1'b1;
difference u_difference
(
    .clk        (clk40),
//    .rst_n      (),
    .data1      ({green_post[2:0],blue_post[4:0]}),
    .data2      ({red_post[4:0],green_post[5:3]}),   
    .hsync      (hsync_post),
    .vsync      (vsync_post),
    .en         (vga_en),
    .hsynco     (hsync_next),
    .vsynco     (vsync_next),
    .eno        (diffen),
    
    .monoc      (monoc)    
);
//////////////////////////////////////////////////top for vga dim///////////////////
/*assign vga_red = red_post;
assign vga_green = green_post;
assign vga_blue = blue_post;
assign vga_hsync = hsync_post;
assign vga_vsync = vsync_post;
assign vga_red = {5{vga_bit}};
assign vga_green = {6{vga_bit}};
assign vga_blue = {5{vga_bit}};
assign vga_hsync = post_frame_href;
assign vga_vsync = post_frame_vsync;
assign vga_red = {5{vga_bit}};
assign vga_green = {6{vga_bit}};
assign vga_blue = {5{vga_bit}};
assign vga_hsync = post_frame_href_Erosion;
assign vga_vsync = post_frame_vsync_Erosion;*/
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////all for erosion testing////////
erosion u_erosion (
    .clk			            (clk40), 
    .per_frame_vsync			(vsync_next), 
    .per_frame_href				(hsync_next), 
    .per_frame_clken			(diffen), 
    .per_img_Bit				(monoc), 
    .post_frame_vsync			(post_frame_vsync_Erosion), 
    .post_frame_href			(post_frame_href_Erosion), 
    .post_frame_clken			(post_frame_clken_Erosion)
   // .post_img_Bit			    (vga_bit)
    );
/*   wire vga_bit;
   wire post_frame_href_Erosion;
   wire post_frame_vsync_Erosion;*/
//////////////////////////////////////////////////////////////////////////////////////all for erosion testing////////
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////
////////////
erosion2    u_erosion2(
	//global clock
	.clk               (clk40),  					//cmos video pixel clock
	//input		wire		rst_n,				//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (vsync_next),		//Prepared Image data vsync valid signal
	.per_frame_href    (hsync_next),		//Prepared Image data href vaild  signal
	.per_frame_clken   (diffen),		//Prepared Image data output/capture enable clock
	.per_img_Bit       (monoc),			//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync      (post_frame_vsync),	//Processed Image data vsync valid signal
    .post_frame_href       (post_frame_href),	//Processed Image data href vaild  signal
	.post_frame_clken      (post_frame_clken),	//Processed Image data output/capture enable clock
	.post_img_Bit          (vga_bit)		//Processed Image Bit flag outout(1: Value, 0:inValid)
);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dilation    u_dilation(
	//global clock
	.clk               (clk40),  					//cmos video pixel clock
	//input		wire		rst_n,				//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (post_frame_vsync),		//Prepared Image data vsync valid signal
	.per_frame_href    (post_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken   (post_frame_clken),		//Prepared Image data output/capture enable clock
	.per_img_Bit       (vga_bit),			//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync      (post_vsync),	//Processed Image data vsync valid signal
    .post_frame_href       (post_href),	//Processed Image data href vaild  signal
	.post_frame_clken      (post_clken),	//Processed Image data output/capture enable clock
	.post_img_Bit          (vga_bit_s)		//Processed Image Bit flag outout(1: Value, 0:inValid)
);
////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////top for vga dim///////////////////
/*assign vga_red = red_post;
assign vga_green = green_post;
assign vga_blue = blue_post;
assign vga_hsync = hsync_post;
assign vga_vsync = vsync_post;
assign vga_red = {5{vga_bit_s}};
assign vga_green = {6{vga_bit_s}};
assign vga_blue = {5{vga_bit_s}};
assign vga_hsync = post_href;
assign vga_vsync = post_vsync;
assign vga_red = {5{vga_bit}};
assign vga_green = {6{vga_bit}};
assign vga_blue = {5{vga_bit}};
assign vga_hsync = post_frame_href_Erosion;
assign vga_vsync = post_frame_vsync_Erosion;*/
//////////////////////////////////////////////////////////////////////////////////
goal_position	u_goal_position
(
	.clk				(clk40),
	//.rst_n			(sys_rst_n & Config_Done & sdram_init_done),
	.ie				(post_clken),
	.hcnt				(HCnt),
	.vcnt				(VCnt),
	.idat				(vga_bit_s),
	.oe				    (),
	.vidon			    (square_en),
	
	//.x_max			(),
	//.x_min			(),
	//.y_max			(),
	//.y_min			()
	.x_position           (x_position),
	.y_position           (y_position)
);
//
vga_output		u_vga_output
(
	.clk				(clk40),
	//.rst_n			(sys_rst_n & Config_Done & sdram_init_done),
	
	.hsync			(post_href),
	.vsync			(post_vsync),
	.enable			(post_clken),
	
	.monoc			(vga_bit_s),
	.square_en		(square_en),
	//////////////////final module output for vga display
	.hsync_vga		(last_hsync),
	.vsync_vga		(last_vsync),
	.enableout		(last_en),		
	.color_vga		(last_data),
	.color_in      (frame_pixel),
	.monoccontrol  (blank_cap)
);
wire [15:0]last_data;
//////////////////////////////////////////////////top for vga dim///////////////////
/*assign vga_red = red_post;
assign vga_green = green_post;
assign vga_blue = blue_post;
assign vga_hsync = hsync_post;
assign vga_vsync = vsync_post;*/
assign vga_red = last_data[15:11];
assign vga_green = last_data[10:5];
assign vga_blue = last_data[4:0];
assign vga_hsync = last_hsync;
assign vga_vsync = last_vsync;
/*assign vga_red = {5{vga_bit}};
assign vga_green = {6{vga_bit}};
assign vga_blue = {5{vga_bit}};
assign vga_hsync = post_frame_href_Erosion;
assign vga_vsync = post_frame_vsync_Erosion;*/
//////////////////////////////////////////////////////////////////////////////////
/////////////
wire [10:0] x_position;
wire [10:0] y_position;
reg [7:0] data_out;
//assign data_out = 8'b11100110;
reg[2:0] stage  = 0;
parameter SIZE = 50000;
reg [19:0] cnt;
reg uart_en;
always @(posedge clk40)
    if(cnt == SIZE) begin
        cnt <= 0;
        uart_en <= 1; end
       else begin
           cnt <= cnt + 1'b1;
           uart_en <= 0;end
always @(posedge uart_en)
	case(stage)
	//0:	if(uart_data_w == 8'b11011000)
	//		sta <= 1;
	0:	begin 
			data_out <= 8'b11100111;
			stage <= 1;
			end
	1:	begin
			data_out <= x_position[7:0];
			stage <= 2;
			end
	2:	begin 
			data_out <= x_position[10:8];
			stage <= 3;
			end
	3:	begin
			data_out <= y_position[7:0];
			stage <= 4;
			end
	4:	begin 
			data_out <= y_position[10:8];
			stage <= 0;
			end
			
	default: ;
	endcase

uart_recv #(                          //串口接收模块
    .CLK_FREQ       (CLK_FREQ),       //设置系统时钟频率
    .UART_BPS       (UART_BPS))       //设置串口接收波特率
u_uart_recv(                 
    .sys_clk        (clk40), 
   // .sys_rst_n      (sys_rst_n),
    
    .uart_rxd       (uart_rxd),
    .uart_done      (),
    .uart_data      (uart_data_w)
    );
    
uart_send #(                          //串口发送模块
    .CLK_FREQ       (CLK_FREQ),       //设置系统时钟频率
    .UART_BPS       (UART_BPS))       //设置串口发送波特率
u_uart_send(                 
    .sys_clk        (clk40),
   // .sys_rst_n      (sys_rst_n),
     
    .uart_en        (uart_en),
    .uart_din       (data_out),
    .uart_txd       (uart_txd)
    );
parameter  CLK_FREQ = 40000000;       //定义系统时钟频率
parameter  UART_BPS = 115200;         //定义串口波特率

////////////
endmodule