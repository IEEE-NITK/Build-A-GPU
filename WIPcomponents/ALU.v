//ctrl refers to the instruction parameter it refers, based in the 3 line signals from the bit alu logic
//A and B are inputs while Res is the output with numerous status flags
module ALU(
    input wire [3:0] ctrl,
    input wire signed [31:0] A, B,
    output reg [31:0] C,
    output reg ZF, NF, EF, GF, LF
);

// Parameter definitions for operations
parameter [3:0]
    Add = 4'd0,
    Sub = 4'd1,
    SL = 4'd2,
    SR = 4'd3,
    AND = 4'd4,
    OR = 4'd5,
    XOR = 4'd6,
    NAND = 4'd7,
    NOT = 4'd8,
    NOR = 4'd9;

always @ (ctrl or A or B) begin
    case(ctrl)
        Add: begin
            C = A + B;
        end
        Sub: begin
            C = A - B;
        end
        SL: begin
            C = A << B;
        end
        SR: begin
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

    // Flag generation logic
    ZF = (C == 0);
    NF = (C < 0);
    EF = (C == A);
    GF = (A > B);
    LF = (A < B);
end

endmodule
