`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 09:37:46
// Design Name: 
// Module Name: bresenham_lda
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


module bresenham_lda(
    input clk,
    input reset,
    input draw,
    input [9:0] x1, y1, x2, y2,
    output reg [9:0] x_out, y_out
);

localparam [1:0] IDLE = 2'b00, DRAW = 2'b01, DONE = 2'b10;

reg [1:0] state, next_state;
reg signed [10:0] dx, dy, p, p_next;
reg [9:0] x, x_next, y, y_next;
reg m;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        x_out <= 0;
        y_out <= 0;
        x <= 0;
        y <= 0;
    end
    else begin
        state <= next_state;
        x <= x_next;
        y <= y_next;
        p <= p_next;
    end
end

always @(*) begin
    case (state)
        IDLE: begin
            if (x1 != x2 || y1 != y2) begin
                dx <= x2 - x1;
                dy <= y2 - y1;
                m <= dy/dx;
                x_next <= x1;
                y_next <= y1;
                p_next <= 2 * dy - dx;
                if (draw) begin
                    next_state <= DRAW;
                end
                else begin
                    next_state <= IDLE;
                end
            end
            else begin
                next_state <= IDLE;
            end
        end
        DRAW: begin
            if (x == x2 && y == y2) begin
                next_state <= DONE;
            end
            else if (p < 0 && m < 1) begin
                p_next <= p + 2 * dy;
                x_next <= x + 1;
                y_next <= y;
                x_out <= x_next;
                y_out <= y_next;
                next_state <= DRAW;
            end
            else if(p>=0 && m < 1) begin
                p_next <= p + 2 * (dy - dx);
                x_next <= x + 1;
                y_next <= y + 1;
                x_out <= x_next;
                y_out <= y_next;
                next_state <= DRAW;
            end
            else if(p < 0 && m>=1) begin
                p_next <= p + 2 * dx;
                x_next <= x + 1;
                y_next <= y + 1;
                x_out <= x_next;
                y_out <= y_next;
                next_state <= DRAW;
            end
            else begin
                p_next <= p + 2 * (dx - dy);
                x_next <= x;
                y_next <= y + 1;
                x_out <= x_next;
                y_out <= y_next;
                next_state <= DRAW;
            end
        end
        DONE: begin
            next_state <= IDLE;
        end
    endcase
end

endmodule