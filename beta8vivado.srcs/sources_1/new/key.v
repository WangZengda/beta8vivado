`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 18:48:02
// Design Name: 
// Module Name: key
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


module key(
	input wire		clk,
	input wire		key1,
	
	output reg 		key1_flag

);

reg [24:0]	cnt;

parameter CNT_END = 33000000;   //递增频率
parameter TIME = 99;  //消抖时间


always @(posedge clk)
	if(key1)   //按键弹起
		cnt<=0;
	else if(cnt==CNT_END)
		cnt<=0;
	else if(!key1)    //按键按下
		cnt<=cnt+1;
//---
always @(posedge clk)
	if(cnt==TIME)
		key1_flag<=1;
	else 
		key1_flag<=0;
//---



endmodule
