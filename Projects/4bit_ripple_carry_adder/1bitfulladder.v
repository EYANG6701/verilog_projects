module fulladder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a ^ b ^ c;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule