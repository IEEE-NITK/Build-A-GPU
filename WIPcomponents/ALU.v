//ctrl refers to the instruction parameter it refers, based in the 3 line signals from the bit alu logic
//A and B are inputs while Res is the output with numerous status flags
module ALU(ctrl, A, B, Res, ZF, NF, EF, GF, LF);
input wire [3:0] ctrl;
input wire signed [31:0] A, B;
output reg [31:0] Res;
output wire ZF, NF, EF, GF, LF;
assign isNegative = 0;
assign isZero = (C == 0) ? 1: 0;
assign isEqual = (A == B) ? 1 : 0;
assign isGT = (A > B) ? 1 : 0;
assign isLT = (A < B) ? 1 : 0;
parameter [3:0]  Add = 4'd0,
                Sub = 4'd1,
                SL = 4'd2,
                SR = 4'd3,
                AND = 4'd4,
                OR = 4'd5,
                XOR = 4'd6,
                NAND = 4'd7,
                NOT = 4'd8,
                NOR = 4'd9;
always @ (ctrl, A, B) begin
    case(ctrl)
    add: begin
        C = A + B;
    end
    subtract: begin
        C = A - B;
        end
    shiftLeft: begin
        C = A << B;
        end
    shiftRight: begin
        C = A >> B;
        end
    AND: begin
        C = A & B;
    end
    OR: begin
        C = A | B;
    end
    XOR: begin
        C = A ^ B;
    end
    NAND: begin
        C = ~(A & B);
    end
    NOT: begin
        C = ~A;
    end
    NOR: begin
        C = ~(A | B);
    end
    default: begin
        C = 0;
    end
endcase
end
endmodule
