`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 19:40:40
// Design Name: 
// Module Name: Instruction_decoder
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


module Instruction_decoder(instruction,reset,done_in,ctrl_ALU,x1,x2,y1,y2,done_out);

input wire [35:0] instruction;
input wire reset;
input wire done_in;
output reg [2:0] ctrl_ALU;
output reg [8:0] x1, x2;
output reg [7:0] y1, y2;
output reg done_out;

// Parameter definitions
parameter   LD=2'b00,
            RD=2'b01,
            CD=2'b10,
            DISP=2'b11;

parameter   ALU_LD=3'b100,
            ALU_RD=3'b101,
            ALU_CD=3'b110,
            ALU_DISP=3'b111;

always @(instruction or posedge reset) begin
    if (reset) begin
    done_out=1;
    end
    else if (done_in || done_out) begin
        case(instruction[35:34])
            LD: begin
                x1 = instruction[33:25];
                y1 = instruction[24:17];
                x2 = instruction[16:8];
                y2 = instruction[7:0];
                ctrl_ALU = ALU_LD;
                done_out=0;
            end
            RD: begin
                x1 = instruction[33:25];
                y1 = instruction[24:17];
                x2 = instruction[16:8];
                y2 = instruction[7:0];
                ctrl_ALU = ALU_RD;
                done_out=0;
            end
            CD: begin
                x1 = instruction[33:25];
                y1 = instruction[24:17];
                x2 = instruction[16:8];
                y2 = instruction[7:0];
                ctrl_ALU = ALU_CD;
                done_out=0;
            end
            DISP: begin
                ctrl_ALU = ALU_DISP;
            end
            default: begin
                ctrl_ALU = ALU_DISP;
            end
        endcase
    end
end
endmodule