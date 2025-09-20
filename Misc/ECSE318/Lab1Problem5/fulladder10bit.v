module fulladder10bit (sum, c_out, a, b, c_in);

    output [9:0] sum;
    output c_out;
    input [9:0] a, b;
    input c_in;

    wire c1, c2, c3, c4, c5, c6, c7, c8, c9;

    fulladder fa0(sum[0], c1, a[0], b[0], c_in);
    fulladder fa1(sum[1], c2, a[1], b[1], c1);
    fulladder fa2(sum[2], c3, a[2], b[2], c2);
    fulladder fa3(sum[3], c4, a[3], b[3], c3);
    fulladder fa4(sum[4], c5, a[4], b[4], c4);
    fulladder fa5(sum[5], c6, a[5], b[5], c5);
    fulladder fa6(sum[6], c7, a[6], b[6], c6);
    fulladder fa7(sum[7], c8, a[7], b[7], c7);
    fulladder fa8(sum[8], c9, a[8], b[8], c8);
    fulladder fa9(sum[9], c_out, a[9], b[9], c9);

endmodule