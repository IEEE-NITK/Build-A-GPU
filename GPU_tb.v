`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 23:10:16
// Design Name: 
// Module Name: GPU_tb
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

module GPU_tb;

// Inputs
reg clk;
reg reset;
reg [35:0] instruction;

// Outputs
wire signed [8:0] x_out;
wire signed [7:0] y_out;

// Instantiate the Unit Under Test (UUT)
Processor uut (
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .x_out(x_out),
    .y_out(y_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test cases
initial begin
    // Reset the module
    reset = 1;
    #10 reset = 0;

    // Test case 2: Draw a circle
    instruction = {2'b10, 9'd5, 8'd0, 9'd8, 8'd0};
    #500; // Wait for the circle to be drawn

    // Add more test cases as needed

    $finish;
end

// Monitor the outputs
initial begin
    $monitor("Time: %0t, x_out: %d, y_out: %d", $time, x_out, y_out);
end

endmodule
