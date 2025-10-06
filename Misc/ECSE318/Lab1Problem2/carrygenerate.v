module carrygenerate (c0, c, cout, g, p);
    output [2:0] c;
    output cout;
    input [3:0] g, p;
    input c0;

    assign c[0] = g[0] | (p[0] & c0);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c0);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c0);
    assign cout = g[3] | (p[3] & c[2]);
endmodule
