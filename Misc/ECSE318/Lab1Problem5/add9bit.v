module add9 (sum, a, b, c, d, e);

    //Output port
    output [11:0] sum;

    //Input port
    input [8:0] a, b, c, d, e;

    //assign
    assign sum = a + b + c + d + e;
endmodule