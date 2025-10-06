module halfadder (g, p, a, b);

    //Output ports
    output g, p;

    //Input ports
    input a, b;

    //Structural 
    and #10 (g, a, b);
    xor #10 (p, a, b);
endmodule