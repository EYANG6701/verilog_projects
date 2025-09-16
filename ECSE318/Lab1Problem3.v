module csa (sum, c_out, a, b, c);

    output sum, c_out;
    input a, b, c;

    wire w1, w2, w3;

    xor (w1, a, b);
    and (w2, a, b);
    xor (sum, c_in, w1);
    and (w3, w1, c_in);
    or (c_out, w2, w3);

endmodule

