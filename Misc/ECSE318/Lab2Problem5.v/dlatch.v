module d_latch (q, q_bar, d, enable);

    //Outputs
    output q, q_bar;

    //Inputs 
    input d, enable;

    //wire
    wire w1, w2, d_bar;

    //Structural
    not (d_bar, d);
    nand (w1, d, enable);
    nand (w2, d_bar, enable);
    nand (q, q_bar, w1);
    nand (q_bar, q, w2);