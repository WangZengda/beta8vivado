`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/21 19:55:10
// Design Name: 
// Module Name: goal_position
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


module goal_position(
	input 				clk ,
	//input 				rst_n,
	input				ie,			//输入使能
	input 		[10:0]	hcnt,
	input 		[10:0]	vcnt,
	input				idat,		//输入二值像素
	
	output reg 			oe,			//输出标志
	output 				vidon,		//输出方框有效信号
	//output reg [10:0]	x_max,		//方框位置
	//output reg [10:0]	x_min,
	//output reg [10:0]	y_max,
	//output reg [10:0]	y_min
	output wire [10:0]x_position,
	output wire [10:0]y_position
);
wire rst_n = 1'b1;
reg [10:0]	x_max;		//方框位置
reg [10:0]	x_min;
reg [10:0]	y_max;
reg [10:0]	y_min;
reg [10:0] y_maxr;
reg [10:0] x_maxr;
reg [10:0] y_minr;
reg [10:0] x_minr;

 (* KEEP="TRUE"*)  wire comp_tc ;//获得前一帧数据
assign comp_tc = (hcnt==10 && vcnt ==1)? 1'b1:1'b0;
 (* KEEP="TRUE"*)  wire comp_tc2 ;//开始本帧数据
assign comp_tc2 = (hcnt==20 && vcnt ==1)? 1'b1:1'b0;
//assign comp_tc = (vga_vsync)? 1'b1:1'b0;
/******************************************************/
(*KEEP="TRUE"*) wire debug_xmaxr ;
assign debug_xmaxr = ((idat)&&(x_maxr <= hcnt)&& ie)? 1'b1 :1'b0 ;
always@(posedge clk)
begin
	if(!rst_n)
		x_maxr <= 420 ;
	else if(comp_tc2)
		x_maxr <= 420 ;
	else if(ie && hcnt < 720 && hcnt >420 && vcnt < 400 && vcnt > 180 )begin
		if((idat)&&(x_maxr <= hcnt))
			x_maxr <= hcnt ;	
	end
end
(*KEEP="TRUE"*) wire [10:0] x_maxr2 =  x_maxr ;
(*KEEP="TRUE"*) wire debug_xminr ;
assign debug_xminr = ((idat)&&(x_minr >= hcnt)&& ie)? 1'b1 :1'b0 ;

always@(posedge clk)
begin
	if(!rst_n)
		x_minr <= 720 ;
	else if(comp_tc2)
		x_minr <= 720 ;
	else if(ie && hcnt < 720 && hcnt >420 && vcnt < 400 && vcnt > 180 )begin
		if((idat)&&(x_minr >= hcnt))
			x_minr <= hcnt ;	
	end
end
(*KEEP="TRUE"*) wire [10:0] x_minr2 =  x_minr ;
/*****************************************/
(*KEEP="TRUE"*) wire debug_ymaxr ;
assign debug_ymaxr = ((idat)&&(y_maxr <= vcnt)&& ie)? 1'b1 :1'b0 ;
always@(posedge clk)
begin
	if(!rst_n)
		y_maxr <= 180 ;
	else if(comp_tc2)
		y_maxr <= 180 ;
	else if(ie && hcnt < 720 && hcnt >420 && vcnt < 400 && vcnt > 180 )begin
		if((idat)&&(y_maxr <= vcnt))
			y_maxr <= vcnt ;
		else
			y_maxr <= y_maxr ;		
	end
end
(*KEEP="TRUE"*) wire [10:0] y_maxr2 =  y_maxr ;
(*KEEP="TRUE"*) wire debug_yminr ;
assign debug_yminr = ((idat)&&(y_minr >= vcnt)&& ie)? 1'b1 :1'b0 ;

always@(posedge clk)
begin
	if(!rst_n)
		y_minr <= 400 ;
	else if(comp_tc2)
		y_minr <= 400 ;
	else if(ie && hcnt < 720 && hcnt >420 && vcnt < 400 && vcnt > 180)begin
		if((idat)&&(y_minr >= vcnt))
			y_minr <= vcnt ;	
	end
end

 (*KEEP="TRUE"*) wire [10:0] y_minr2 =  y_minr ;
/*****************************************/
always@(posedge clk)
begin
	if(!rst_n)begin
		x_max <= 0 ;
		y_max <= 0 ;
		x_min <= 0 ;
		y_min <= 0 ;
	end
	else if(comp_tc)begin
		x_max <= x_maxr ;
		x_min <= x_minr ;
		y_max <= y_maxr ;
		y_min <= y_minr ;
	end
	else begin
		x_max <= x_max ;
		x_min <= x_min ;
		y_max <= y_max ;
		y_min <= y_min ;
	end
end

always@(posedge clk)
begin
	if(!rst_n)
		oe <= 0 ;
	else
		oe <= comp_tc ;
end

//修正量
parameter FIX = 8;
assign vidon = ((vcnt == y_min | vcnt == y_max)&&(((hcnt > x_min - FIX))&((hcnt < x_max - FIX))) ||
					 (hcnt == (x_min - FIX) | hcnt == (x_max - FIX))&&((vcnt > y_min)&(vcnt < y_max)) )? 1'b1 : 1'b0;
				 
reg [10:0]x_pos;
reg [10:0]y_pos;
always @(posedge clk)
begin
    x_pos <= x_max + x_min - 840;//((x_maxr + x_minr ) >> 1'b1 - 420);
    y_pos <= y_max + y_min - 360 ;//max 180+400>>>>10+230>>>>>>minus170+170
end
assign x_position = x_pos;
assign y_position = y_pos;
endmodule
