module sumgenerator (sum, c0, c, p);

    //Output ports
    output [3:0] sum;

    //Input ports
    input c0;
    input [3:0] p;
    input [2:0] c;

    //Structural
    xor (sum[0], p[0], c0);
    xor (sum[1], p[1], c[0]);
    xor (sum[2], p[2], c[1]);
    xor (sum[3], p[3], c[2]);
endmodule

