`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/20 19:04:15
// Design Name: 
// Module Name: erosion
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


module  erosion 
(
	//global clock
	input		wire		clk,  				//cmos video pixel clock
	//input				rst_n,				//global reset

	//Image data prepred to be processd
	input		wire		per_frame_vsync,	//Prepared Image data vsync valid signal
	input		wire		per_frame_href,		//Prepared Image data href vaild  signal
	input		wire		per_frame_clken,	//Prepared Image data output/capture enable clock
	input		wire		per_img_Bit,		//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	output		wire		post_frame_vsync,	//Processed Image data vsync valid signal
	output		wire		post_frame_href,	//Processed Image data href vaild  signal
	output		wire		post_frame_clken,	//Processed Image data output/capture enable clock
	output		wire		post_img_Bit		//Processed Image Bit flag outout(1: Value, 0:inValid)
);

//----------------------------------------------------
//Generate 1Bit 3X3 Matrix for Video Image Processor.
//Image data has been processd
wire			matrix_frame_vsync;	//Prepared Image data vsync valid signal
wire			matrix_frame_href;	//Prepared Image data href vaild  signal
wire			matrix_frame_clken;	//Prepared Image data output/capture enable clock	
wire 			matrix_p11;
wire            matrix_p12;
wire            matrix_p13;	
wire			matrix_p21;
wire            matrix_p22;
wire            matrix_p23;
wire			matrix_p31;
wire            matrix_p32;
wire            matrix_p33;

 
line_shift__9X9_1Bit u_line_shift__3X3_1Bi
(
	//global clock
	.clk					(clk),  				//cmos video pixel clock
	//.rst_n					(rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(per_frame_vsync),		//Prepared Image data vsync valid signal
	.per_frame_href			(per_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken		(per_frame_clken),		//Prepared Image data output/capture enable clock
	.per_img_Bit			(per_img_Bit),			//Prepared Image brightness input

	//Image data has been processd
	.matrix_frame_vsync		(matrix_frame_vsync),	//Processed Image data vsync valid signal
	.matrix_frame_href		(matrix_frame_href),	//Processed Image data href vaild  signal
	.matrix_frame_clken		(matrix_frame_clken),	//Processed Image data output/capture enable clock	
	.matrix_p11(matrix_p11),	
	.matrix_p12(matrix_p12), 	
	.matrix_p13(matrix_p13), 
	.matrix_p21(matrix_p21), 	
	.matrix_p22(matrix_p22), 	
	.matrix_p23(matrix_p23),  
	.matrix_p31(matrix_p31), 	
	.matrix_p32(matrix_p32), 	
	.matrix_p33(matrix_p33)
);


//Step1
reg	post_img_Bit1;
reg	post_img_Bit2;
reg post_img_Bit3;

always @(posedge clk)

		begin
		post_img_Bit1 <= matrix_p11 & matrix_p12 & matrix_p13;
		post_img_Bit2 <= matrix_p21 & matrix_p22 & matrix_p23;
		post_img_Bit3 <= matrix_p31 & matrix_p32 & matrix_p33;
		end


//Step 2
reg	post_img_Bit10;
always @(posedge clk )

		post_img_Bit10 <= post_img_Bit1 & post_img_Bit2 & post_img_Bit3;


//------------------------------------------
//lag 2 clocks signal sync  
reg	[1:0]	per_frame_vsync_r;
reg	[1:0]	per_frame_href_r;	
reg	[1:0]	per_frame_clken_r;
always@(posedge clk)

		begin
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[0], 	matrix_frame_vsync};
		per_frame_href_r 	<= 	{per_frame_href_r[0], 	matrix_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[0], 	matrix_frame_clken};
		end

assign	post_frame_vsync 	= 	per_frame_vsync_r[1];
assign	post_frame_href 	= 	per_frame_href_r[1];
assign	post_frame_clken 	= 	per_frame_clken_r[1];
assign	post_img_Bit		=	post_frame_href ? post_img_Bit10 : 1'b0;

endmodule
