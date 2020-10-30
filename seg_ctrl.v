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


module led_segment(
    input clk,   //125Mhz 
	input rst,
	output reg digit_select,  // select SSD display
	output reg  [6:0] seg_led
    );
//    wire ce =0;
	wire [7:0] value;
	wire [3:0] display;
	reg clk_divider = 1'b0;  // 1Hz clock
	
	integer cnt_select = 0; // 32bits counter select SSD for display
	integer counter = 0; // 32bits counter for clock divider
	
    integer counter_display =0;  // 32bits counter
    localparam select_timer_value = 999999;  // ~60Hz for change digit display
	localparam div_value = 62499999;   // ~1Hz for counter display

assign value[7:4] = counter_display/10;    // display 2nd digit
assign value[3:0] = counter_display % 10;  // display 1st digit
assign display = digit_select ? value[7:4] : value[3:0];

// select SSD for display
always @(posedge clk) begin
    if(cnt_select == select_timer_value)
      cnt_select <= 0;
	else 
	  cnt_select <= cnt_select + 1;
	end
	
always @(posedge clk) begin
    if(cnt_select == select_timer_value)
       digit_select <= ~digit_select;
	end	
	
// clock divider f = 1hz
always @(posedge clk) begin
    if(counter == div_value)
      counter <= 0;
	else 
	  counter <= counter + 1;
	end
always @(posedge clk) begin
    if(counter == div_value)
      clk_divider <= ~clk_divider;
	else 
	  clk_divider <= clk_divider;
	end
	
// set a counter +1 after 1s	
always @(posedge clk_divider or posedge rst) begin
    if (rst)
      counter_display <= 0;
    else if (counter_display == 99)
	  counter_display <= 0;
	else
      counter_display <= counter_display + 1;	
	end
always @(display or seg_led) begin
	case (display)
            4'h0:		seg_led <= 7'b0111111;
			4'h1:		seg_led <= 7'b0000110;
			4'h2:		seg_led <= 7'b1011011;
			4'h3:		seg_led <= 7'b1001111;
			4'h4:		seg_led <= 7'b1100110;
			4'h5:		seg_led <= 7'b1101101;
			4'h6:		seg_led <= 7'b1111101;
			4'h7:		seg_led <= 7'b0000111;
			4'h8:		seg_led <= 7'b1111111;
			4'h9:		seg_led <= 7'b1101111;
	default: seg_led <= 7'b1111110;
	endcase
 end
  endmodule