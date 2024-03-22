module Mux_Y(
    input wire [8:0] yCF, yCD, yRF, yRD, yLD, yIDLE,
    input wire CLK,
    input wire [3:0] SEL,
    output reg [8:0] yOut
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
        CF: yOut <= yCF;
        CD: yOut <= yCD;
        RF: yOut <= yRF;
        RD: yOut <= yRD;
        LD: yOut <= yLD;
        FU: yOut <= yIDLE; // Typo corrected: yFU -> yIDLE
        IDLE: yOut <= yIDLE;
        default: yOut <= 0; // Simplified the default case
    endcase
end

endmodule
