`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2020 11:00:58 AM
// Design Name: 
// Module Name: LED_segment_env
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


module LED_segment_env;
  reg clk = 0;
  reg rst = 0;
  wire digit_select;
  wire [6:0]seg_led;
  parameter CYC = 1000; // Time Interval   

  seg_led_top tb (
  .clk      (clk),
  .rst      (rst),
  .digit_select      (digit_select),
  .seg_led  (seg_led)
  ); 
 // Generate System Clock 1us
   initial 
   begin
     forever #(CYC/2) clk = !clk;
   end  
  initial begin
  rst = 1'b0; #(CYC*2)
  rst = 1'b0; #(CYC*100)

  $finish;
  end
endmodule
