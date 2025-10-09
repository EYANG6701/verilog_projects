module shift (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
    output reg [15:0] C
);
    always @(*) begin
        case (code)
            3'b000: C = A << B;
            3'b001: C = A >> B;
            3'b010: C = A <<< B;
            3'b011: C = A >>> B;
            default: C = 16'b0;
        endcase
    end
endmodule
