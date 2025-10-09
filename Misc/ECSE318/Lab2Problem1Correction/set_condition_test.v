module set_condition (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
    output reg [15:0] C
);
    always @(*) begin
        C = 16'b0;
        case (code)
            3'b000: if (A <= B) C = 16'b1;
            3'b001: if (A <  B) C = 16'b1;
            3'b010: if (A >= B) C = 16'b1;
            3'b011: if (A >  B) C = 16'b1;
            3'b100: if (A == B) C = 16'b1;
            3'b101: if (A != B) C = 16'b1;
            default: C = 16'b0;
        endcase
    end
endmodule
