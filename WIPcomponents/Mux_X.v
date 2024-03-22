module Mux_X(
    input wire [8:0] xCF, xCD, xRF, xRD, xLD, xIDLE,
    input wire CLK,
    input wire [3:0] SEL,
    output reg [8:0] xOut
);

parameter [3:0] CF = 4'd0, //circle fill
                CD = 4'd1, //circle draw
                RF = 4'd2, //rectangle fill
                RD = 4'd3, //rectangle draw
                LD = 4'd4, //line draw
                FU = 4'd10, //frame update
                IDLE = 4'd15; //IDLE

always @(posedge CLK) begin
    case (SEL)
        CF: xOut <= xCF;
        CD: xOut <= xCD;
        RF: xOut <= xRF;
        RD: xOut <= xRD;
        LD: xOut <= xLD; // There was no case for xLD
        FU: xOut <= xIDLE; // Typo corrected: xFU -> xIDLE
        IDLE: xOut <= xIDLE;
        default: xOut <= 0; // Simplified the default case
    endcase
end

endmodule

