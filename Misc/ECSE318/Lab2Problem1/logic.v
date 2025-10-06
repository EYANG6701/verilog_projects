module logic (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
    ouput reg [15:0] C,
);
    //Code 
    always @(*) begin 
        if (code == 3'b000) begin
            C <= A && B;
        end else if (code == 3'b001) begin
            C <= A || B;
        end else if (code == 3'b010) begin
            C <= A ^ B;
        end else if (code == 3'b100) begin
            C <= ~A;
        end
    end
endmodule 