module four_bit_adder (
    input [3:0] A,
    input [3:0] B,
    input cin,
    output [3:0] sum,
    output cout
);

    //Wires
    wire c1, c2, c3;

    //Code 
    fulladder fa0 (
        .a(A[0]),
        .b(B[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c1)
    );

    fulladder fa1 (
        .a(A[1]),
        .b(B[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    fulladder fa2 (
        .a(A[2]),
        .b(B[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );

    fulladder fa3 (
        .a(A[3]),
        .b(B[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(cout)
    );
endmodule