module generic_cla (sum, cout, a, b, c0);

    //Output ports
    output [3:0] sum;
    output cout;

    //Input ports
    input [3:0] a, b;
    input c0;

    //Wires
    wire [3:0] g, p;
    wire [2:0] c;

    //Structural
    pggenerator pg1 (.g(g), .p(p), .a(a), .b(b));
    carrygenerate cg1 (.c0(c0), .c(c), .cout(cout), .g(g), .p(p));
    sumgenerator sg1 (.sum(sum), .c0(c0), .c(c), .p(p));
endmodule
