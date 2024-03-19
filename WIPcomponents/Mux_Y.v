module Mux_Y(yCF, yCD, yRF, yRD, yLD, yIDLE, CLK, SEL, yOut);
input wire [8:0] yCF, yCD, yRF, yRD, yLD, yIDLE;
input wire CLK;
input wire [3:0] SEL;
output wire [8:0] yOut;
reg [8:0] yReg;
assign yOut = yReg;

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
            yReg <= yCF;
        end
        CD: begin
            yReg <= yCD;
        end
        RF: begin
            yReg <= yRF;
        end
        RD: begin
            yReg <= yRD;
        end
        FU: begin
            yReg <= yFU;
        end
        IDLE: begin
            yReg <= yIDLE;
        end
        default: begin
            yReg <= 0;
        end
    endcase()
end

endmodule 
