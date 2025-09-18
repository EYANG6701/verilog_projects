module adder (sum, c_out, a, b, c);

    output sum, c_out;
    input a, b, c;

    wire w1, w2, w3;

    //sum calculation
    assign w1 = a ^ b;
    assign sum = w1 ^ c_in;

    //carry calculation
    assign w2 = a & b;
    assign w3 = w1 & c_in;
    assign c_out = w2 | w3;

endmodule

module 9bitadder ()