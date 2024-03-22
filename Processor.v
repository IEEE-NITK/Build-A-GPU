`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 20:26:00
// Design Name: 
// Module Name: Processor
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


module Processor(clk,reset,instruction,x_out,y_out);
    
input clk,reset;
input [35:0] instruction;
output signed [8:0]x_out;
output signed [7:0]y_out;

parameter   ALU_LD=3'b100,
            ALU_RD=3'b101,
            ALU_CD=3'b110,
            ALU_DISP=3'b111;

wire draw;
wire [2:0] ctrl_ALU;
wire signed [8:0]x1,x2;
wire signed [7:0]y1,y2;
wire done;

//comment out line_draw if you are using circle_draw and vice versa

Instruction_decoder ins(.instruction(instruction),.reset(reset),.done_in(done),.ctrl_ALU(ctrl_ALU),.x1(x1),.x2(x2),.y1(y1),.y2(y2),.done_out(done));
//Line_Draw line(.clk(clk),.reset(reset),.x1(x1),.y1(y1),.x2(x2),.y2(y2),.done_in(done),.ctrl_ALU(ctrl_ALU),.x_out(x_out),.y_out(y_out),.done_out(done));
Circle_Draw_1 circle(.clk(clk),.reset(reset),.xc(x1),.yc(y1),.r(x2),.done_in(done),.ctrl_ALU(ctrl_ALU),.x_out(x_out),.y_out(y_out),.done_out(done));

endmodule
