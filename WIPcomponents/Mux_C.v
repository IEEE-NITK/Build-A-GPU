module Mux_C(cCF, cCD, cRD, cRF, cLD, cIDLE, CLK, SEL, cOut);
input wire [15:0] cCF, cCD, cRD, cRF, cLD, cIDLE, CLK, SEL, cOut;
input wire CLK;
input wire [3:0] SEL;
output wire [15:0] cOut;
reg [15:0] cReg;
assign cOut = cReg;

parameter [3:0] CF = 4'd0, //circle fill
                CD = 4'd1, //circle draw
                RF = 4'd2, //rectangle fill
                RD = 4'd3, //rectangle draw
                LD = 4'd4, //line draw
                FU = 4'd10, //frame update
                IDLE = 4'd15; //IDLE

always @(posedge CLK) begin
    case (SEL)
        CF: begin cReg<=cCF; end
        CD: begin cReg<=cCD; end
        RF: begin cReg<=cRF; end
        RD: begin cReg<=cRD; end
        LD: begin cReg<=cLD; end
        FU: begin cReg<=cFU; end
        IDLE: begin cReg<=cIDLE; end
        default: begin
            cReg <= 16'hF000
        end
    endcase
end

endmodule
