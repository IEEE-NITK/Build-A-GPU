module Mux_X(xCF, xCD, xRF, xRD, xLD, xIDLE, CLK, SEL, xOut);
input wire [8:0] xCF, xCD, xRF, xRD, xLD, xIDLE;
input wire CLK;
input wire [3:0] SEL;
output wire [8:0] xOut;
reg [8:0] xReg;
assign xOut = xReg;

parameter [3:0] CF = 4'd0, //circle fill
                CD = 4'd1, //circle draw
                RF = 4'd2, //rectangle fill
                RD = 4'd3, //rectangle draw
                LD = 4'd4, //line draw
                FU = 4'd10, //frame update
                IDLE = 4'd15; //IDLE

always @(posedge CLK) begin
    case (SEL)
        CF: begin
            xReg <= xCF;
        end
        CD: begin
            xReg <= xCD;
        end
        RF: begin
            xReg <= xRF;
        end
        RD: begin
            xReg <= xRD;
        end
        FU: begin
            xReg <= xFU;
        end
        IDLE: begin
            xReg <= xIDLE;
        end
        default: begin
            xReg <= 0;
        end
    endcase()
end

endmodule 
