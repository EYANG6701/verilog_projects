module arithmetic (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
    input cin,
    input coe,
    output [15:0] C,
    output vout,
    output cout
);

    //Wire 
    wire [16:0] total

    //Behavioral code 
    always @(*) begin

        //Carry Overflow Enable check
        if (coe) begin
            cout = 1'bx;
        end

        //Code 
        if (code == 3'b000) begin //Signed addition
            total = A + B + cin;
            C = total[15:0];
            vout = (A[15] == B[15]) && (C[15] != A[15]);
        end else if (code == 3'b001) begin //Unsigned addition 
            {cout, C} = A + B + cin;
        end else if (code == 3'b010) begin //Signed subtration
            total = A + ~B + cin;
            C = total[15:0];
            cout = (A[15] != B[15]) && (total[15] != A[15]);
        end else if (code == 3'b011) begin //Unsigned subtration 
            total = A + ~B + cin;
            C = total[15:0];
            cout = total[16];
        end else if (code == 3'b100) begin //signed increment
            total = A + 1;
            C = total[15:0];
            if (A == 16'b0111111111111111) begin
                vout = 1'b1;
            end else begin
                vout = 1'b0;
            end
        end else if (code == 3'b101) begin //signed decrement
            total = A - 1;
            C = total[15:0];
            cout = total[16];
            if (A == 16'b1000000000000000) begin
                vout = 1'b1;
            end else begin
                vout = 1'b0;
            end 
        end
    end
endmodule




