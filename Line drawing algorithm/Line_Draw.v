`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2024 15:34:31
// Design Name: 
// Module Name: Line_Draw
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


module Line_Draw(
  input clk,
  input reset,
  input signed [8:0] x1, x2, // Starting coordinates
  input signed [7:0] y1, y2, // Ending coordinates
  input wire done_in,
  input [2:0] ctrl_ALU,
  output reg signed [8:0] x_out,
  output reg signed [7:0] y_out,  // Current pixel coordinates
  output reg done_out // Line drawing completion flag
);
reg signed [8:0] dx;
reg signed [7:0] dy;
reg state;
initial state=0;
initial done_out=0;

always @(posedge reset or posedge clk) begin
  if (ctrl_ALU==3'b100) begin
  if (reset) begin
    done_out = 0;
  end 
   else if (!done_in || !done_out) begin
   if(!state) begin
   done_out=0;
   state=1;
   x_out = x1;
   y_out = y1;
   end
   else if (x_out != x2 || y_out != y2) begin
    dx = x2 - x_out;
    dy = y2 - y_out;
    if(dx > 0)
        x_out = x_out + 1'b1;
    if(dx < 0)
        x_out = x_out - 1'b1;
    if(dy > 0)
        y_out = y_out + 1'b1;
    if(dy < 0)
        y_out = y_out - 1'b1;
  end 
  else if (x_out == x2 && y_out == y2) begin
    done_out = 1;
  end
end
end
end


endmodule



