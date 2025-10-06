module alu (
    input [15:0] a, b,
    input [4:0] alu_code,
    output [15:0] c,
    output overflow
);

    //Instantiate
    always @(*) begin
        if (alu_code[4:3] == 2'b00) begin
            arithmetic a0(
                .A(a),
                .B(b),
                .code(alu_code[2:0]),
                .C(c),
                .vout(overflow),
                .cout(overflow)
            );
        end else if (alu_code[4:3] == 2'b01) begin
            logic l0(
                .A(a),
                .B(b),
                .code(alu_code[2:0]),
                .C(c)
            );
        end else if (alu_code[4:3] == 2'b10) begin
            shift s0(
                .A(a),
                .B(b),
                .code(alu_code[2:0])
            );
        end else if (alu_code[4:3] = 2'b11) begin
            set_condition sc0(
                .A(a),
                .B(b),
                .code(alu_code[2:0])
                .C(c)
            );
        end
    end
endmodule
    