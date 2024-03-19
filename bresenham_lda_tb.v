`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 09:41:14
// Design Name: 
// Module Name: bresenham_lda_tb
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


module bresenham_lda_tb;

reg clk, reset;
reg draw;
reg [9:0] x1, y1, x2, y2;
wire [9:0] x_out, y_out;

bresenham_lda dut (
    .clk(clk),
    .reset(reset),
    .draw(draw),
    .x1(x1),
    .y1(y1),
    .x2(x2),
    .y2(y2),
    .x_out(x_out),
    .y_out(y_out)
);

initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;

    // Test case 1: Horizontal line
    draw=1;
    x1 = 5;
    y1 = 5;
    x2 = 13;
    y2 = 9;
    #100 draw=0;
    #10 reset=1;
    #10 reset=0;
    draw=1;
    x1=1;
    y1=1;
    x2=5;
    y2=3;
    #80 draw=0;
    #50

    $finish;
end

always #5 clk = ~clk;

endmodule
