`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 18:49:05
// Design Name: 
// Module Name: IICctrl_0
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


module IICctrl_0 (
  iCLK,
  I2C_SCLK,
  I2C_SDAT
);

input wire iCLK;
output wire I2C_SCLK;
inout wire I2C_SDAT;

  IICctrl #(
    .LUT_SIZE(193),
    .CLK_Freq(25000000),
    .I2C_Freq(10000)
  ) inst (
    .iCLK(iCLK),
    .I2C_SCLK(I2C_SCLK),
    .I2C_SDAT(I2C_SDAT)
  );
endmodule
