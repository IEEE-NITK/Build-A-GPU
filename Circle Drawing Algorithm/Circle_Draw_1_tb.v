`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 15:55:49
// Design Name: 
// Module Name: circle_draw_tb
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 15:27:38
// Design Name: 
// Module Name: CDA_tb
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

module circle_draw_tb;

    // Inputs
    reg clk;
    reg reset;
    reg signed [8:0] xc;
    reg signed [7:0] yc;
    reg [8:0] r;

    // Outputs
    wire signed [8:0] x_out;
    wire signed [7:0] y_out;
    wire done;

    // Instantiate the Unit Under Test (UUT)
    Circle_Draw_1 uut (
        clk,
        reset,
        xc,
        yc,
        r,
        x_out,
        y_out,
        done
    );

    // Clock signal
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        xc = 10'd0;
        yc = 10'd0;
        r = 10'd8;

        // Wait for some time
        #10;
        reset = 0;

        // Wait for the circle to be drawn
        #5000;
        // Finish the simulation
        $finish;
    end


endmodule
