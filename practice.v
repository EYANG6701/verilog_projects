module two_bit_mux (
    input a,
    input b,
    input sel,
    output reg y
);

    //Behavioral Code
    always @(*) begin
        if (sel) begin
            y = a;
        end else begin
            y = b;
        end
    end
endmodule

module four_bit_mux (
    input a,
    input b,
    input c,
    input d,
    input [1:0] sel,
    output y
);

    //Wires
    wire w1, w2;

    //Heirarchy
    two_bit_mux mux0(
        .a(a),
        .b(b),
        .sel(sel[0]),
        .y(w1)
    );

    two_bit_mux mux1(
        .a(c),
        .b(d),
        .sel(sel[0]),
        .y(w2)
    );  

    two_bit_mux mux2(
        .a(w1),
        .b(w2),
        .sel(sel[1]),
        .y(y)
    );  