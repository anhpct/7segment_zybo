`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/03 11:29:13
// Design Name: 
// Module Name: 7_segment
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


module seg_led_top(
    input  clk,
	input  rst,
	output digit_select,
	output [6:0]seg_led	
    );
// 7 segment led control module	
led_segment seg(
   .clk          (clk),
   .rst          (rst),
   .digit_select (digit_select),
   .seg_led      (seg_led)
);	

  endmodule