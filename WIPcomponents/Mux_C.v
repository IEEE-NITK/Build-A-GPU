module Mux_C(
    input wire [15:0] cCF, cCD, cRD, cRF, cLD, cIDLE, CLK,
    input wire [3:0] SEL,
    output reg [15:0] cOut
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
        CF: cOut <= cCF;
        CD: cOut <= cCD;
        RF: cOut <= cRF;
        RD: cOut <= cRD;
        LD: cOut <= cLD;
        FU: cOut <= cIDLE; // There was a typo here, should be cIDLE instead of cFU
        IDLE: cOut <= cIDLE;
        default: cOut <= 16'hF000;
    endcase
end

endmodule

