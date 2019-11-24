`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/19 19:34:01
// Design Name: 
// Module Name: difference
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


module difference
(
	input			wire			clk,
	//input						rst_n,
	
	input		wire	[7:0]		data1,
	input		wire	[7:0]		data2,
	
	input			wire			hsync,
	input				wire		vsync,
	input			wire			en,
	
	output			wire		hsynco,
	output			wire		vsynco,
	output			wire		eno,
	
	output	wire			monoc,
	output     reg buff
);

always @(posedge clk)

		//if(!rst_n)
			//monoc	<=	1'b0;
				if(data2 >= data1)
			buff	<=	(((data2 - data1)>64)?	1'b1 : 1'b0);
			else
			buff	<=	(((data1 - data2)>64)?	1'b1 : 1'b0);
			//else	if(data2 < data1)
			//monoc	<=	(((data1 - data2)>50)?	1'b1 : 1'b0);


////////////////////////////////////////////////////////
/*reg							hsync_d;
reg							vsync_d;
reg							en_d;

assign		hsynco	=	hsync_d;
assign		vsynco	=	vsync_d;
assign		eno		=	en_d;

always @(posedge clk )
begin


			hsync_d	<=	hsync;
			vsync_d	<=	vsync;
			en_d		<=	en;	end*/
			
reg		per_frame_vsync_r;
reg		per_frame_href_r;	
reg		per_frame_clken_r;
always@(posedge clk)

		begin
		per_frame_vsync_r 	<= 	vsync;
		per_frame_href_r 	<= 	hsync;
		per_frame_clken_r 	<=     en;
		end

assign	vsynco 	= 	per_frame_vsync_r;
assign	hsynco 	= 	per_frame_href_r;
assign	eno 	= 	per_frame_clken_r;			
assign	monoc		=	hsynco ? buff : 1'b0;

endmodule
