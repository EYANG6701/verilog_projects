module pggenerator (g, p, a, b);

    //Output ports
    output [3:0] g, p;

    //Input ports
    input [3:0] a, b;

    //Structural 
    halfadder ha0 (.g(g[0]), .p(p[0]), .a(a[0]), .b(b[0]));
    halfadder ha1 (.g(g[1]), .p(p[1]), .a(a[1]), .b(b[1]));
    halfadder ha2 (.g(g[2]), .p(p[2]), .a(a[2]), .b(b[2]));
    halfadder ha3 (.g(g[3]), .p(p[3]), .a(a[3]), .b(b[3]));
endmodule

