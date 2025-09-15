module fulladder (sum, c_out, a, b, c_in);

    //output ports
    output sum, c_out;

    /input ports
    input a, b, c_in

    //wires
    wire w1, w2;

    xor (w1, a, b);
    
