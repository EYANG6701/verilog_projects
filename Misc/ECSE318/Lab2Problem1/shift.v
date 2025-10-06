module shift (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
);

    //Code 
    always @(*) begin
        if (code == 3'b000) begin
            A << B;
        end else if (code == 3'b001) begin 
            A >> B;
        end else if (code == 3'b010) begin
            A <<< B;
        end else if (code == 3'b011) begin
            A >>> B;
        end
    end
endmodule