`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/21 20:02:47
// Design Name: 
// Module Name: vga_output
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


module vga_output(
	input		wire		clk,
	//input				rst_n,

	input	wire		hsync,
	input	wire			vsync,

	input		wire		monoc,

	input	wire			square_en,

	output 		reg		hsync_vga,
	output 		reg		vsync_vga,

	output 	wire	[15:0]	color_vga,
	
	input	wire			enable,
	output	reg		enableout,
	input   wire      [15:0]color_in,
	input    wire      monoccontrol
);
wire rst_n = 1'b1;
//for vga h&v sync
always@(posedge clk)
begin
	if(!rst_n)begin
		hsync_vga	<= 1'b0;
		vsync_vga	<= 1'b0;
		enableout	<=	1'b0;
		end
	else	begin
		hsync_vga	<= hsync;
		vsync_vga	<= vsync;
		enableout	<=	enable;
		end
end

//for square and color
//assign color_vga 	=  (square_en == 1'b1)?	16'b00000_111111_00000 : {16{monoc}} ;
//assign color_vga 	=  (square_en == 1'b1)?	16'b00000_111111_00000 : color_in;
//assign color_vga 	= 	16'b00000_111111_00000 ;
wire [15:0]monoccolor;
assign monoccolor =  (square_en == 1'b1)?	16'b00000_111111_00000 : {16{monoc}} ;
assign color_vga = (monoccontrol == 1'b1)? color_in : monoccolor;
endmodule