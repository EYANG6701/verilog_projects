module arithmetic (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
    input cin,
    input coe,
    output reg [15:0] C,
    output reg vout,
    output reg cout
);
    reg [16:0] total;

    always @(*) begin
        vout = 0;
        cout = 0;
        total = 0;
        case (code)
            3'b000: begin // Signed addition
                total = A + B + cin;
                C = total[15:0];
                vout = (A[15] == B[15]) && (C[15] != A[15]);
            end
            3'b001: begin // Unsigned addition
                {cout, C} = A + B + cin;
            end
            3'b010: begin // Signed subtraction
                total = A + ~B + 1;
                C = total[15:0];
                vout = (A[15] != B[15]) && (C[15] != A[15]);
            end
            3'b011: begin // Unsigned subtraction
                {cout, C} = A - B;
            end
            3'b100: begin // Signed increment
                total = A + 1;
                C = total[15:0];
                vout = (A == 16'h7FFF);
            end
            3'b101: begin // Signed decrement
                total = A - 1;
                C = total[15:0];
                vout = (A == 16'h8000);
            end
            default: begin
                C = 16'b0;
                vout = 1'b0;
                cout = 1'b0;
            end
        endcase
    end
endmodule
