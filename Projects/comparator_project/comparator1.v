module comparator1 (lt, eq, gt, a, b);

    //Output port
    output lt, eq, gt;

    //Input ports
    input a, b;

    //Wires
    wire w0, w1;

    //Structural
    not (w0, a);
    not (w1, b);
    and (lt, w0, b);
    and (gt, w1, a);
    nor (eq, lt, gt);

endmodule
    