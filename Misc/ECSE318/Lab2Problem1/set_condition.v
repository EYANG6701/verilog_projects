module set_condition (
    input [15:0] A,
    input [15:0] B,
    input [2:0] code,
    output reg [15:0] C,
);

    //Code 
    always @(*) begin
        if (code == 3'b000) begin
            if (A <= B) begin
                C <= 4'b0000000000000001;
            end
        end else if (code == 3'b001) begin
            if (A < B) begin
                C <= 4'b0000000000000001;
            end
        end else if (code == 3'b010) begin
            if (A >= B) begin
                C <= 4'b0000000000000001;
            end
        end else if (code == 3'011) begin
            if (A > B) begin
                C <= 4'b0000000000000001;
            end
        end else if (code == 3'100) begin
            if (A == B) begin
                C <= 4'b0000000000000001;
            end
        end else if (code == 3'b101) begin
            if (A != B) begin
                C <= 4'b0000000000000001;
            end
        end else begin
            C <= 4'b0000000000000000;
        end
    end
endmodule
