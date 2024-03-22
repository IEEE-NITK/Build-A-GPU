`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2024 15:24:17
// Design Name: 
// Module Name: CDA
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


module Circle_Draw_1 (
    input clk,
    input reset,
    input signed [8:0] xc,
    input signed [7:0] yc,
    input [8:0] r,
    input wire done_in,
    input [2:0] ctrl_ALU,
    output reg signed [8:0] x_out,
    output reg signed [7:0] y_out,
    output reg done_out
);

reg signed [8:0] p;
reg signed [8:0] x;
reg signed [7:0] y;
reg [3:0] state;
parameter start=4'd9, finish=4'd10;
initial state=start;
initial x=0;
initial y=0;
initial p =0;
initial done_out=0;
always @(posedge clk or posedge reset) begin
    if (ctrl_ALU==3'b110) begin
    if (reset) begin
            done_out<=0;  
    end 
    else if (!done_in || !done_out) begin
                if (x <= y) begin
                    case (state)
                        start: begin
                            x <= 0;
                            y <= r;
                            p <= 2'd3-(2*r);
                            state <= 4'd0;
                            done_out<=0; 
                        end
                        4'd0: begin
                            x_out <= xc + x;
                            y_out <= yc + y;
                            state <= 4'd1;
                        end
                        4'd1: begin
                            x_out <= xc - x;
                            y_out <= yc + y;
                            state <= 4'd2;
                        end
                        4'd2: begin
                            x_out <= xc + x;
                            y_out <= yc - y;
                            state <= 4'd3;
                        end
                        4'd3: begin
                            x_out <= xc - x;
                            y_out <= yc - y;
                            state <= 4'd4;
                        end
                        4'd4: begin
                            x_out <= xc + y;
                            y_out <= yc + x;
                            state <= 4'd5;
                        end
                        4'd5: begin
                            x_out <= xc - y;
                            y_out <= yc + x;
                            state <= 4'd6;
                        end
                        4'd6: begin
                            x_out <= xc + y;
                            y_out <= yc - x;
                            state <= 4'd7;
                        end
                        4'd7: begin
                            x_out <= xc - y;
                            y_out <= yc - x;
                            if (p < 0) begin
                                x <= x + 1;
                                p <= p + (4 * x) + 10;
                            end 
                            else begin
                                x <= x + 1;
                                y <= y - 1;
                                p <= p + (4 * (x - y)) + 18;
                            end
                            state <= 4'd0;
                        end
                    endcase
                end
                else begin
                    x<=0;
                    y<=0;
                    x_out<=0;
                    y_out<=0;
                    done_out<=1;
                end
            end
        end
    end
endmodule