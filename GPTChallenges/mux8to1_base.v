module mux8to1_base(y, a, b, sel);

    output [2:0] y;
    input [2:0] a, b;
    input sel;

    assign y = (sel == 0) ? a : b;
endmodule