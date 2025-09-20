module partial_product (p1, p2, p3, p4, p5, a, b);

    //Output ports
    output [8:0] p1, p2, p3, p4, p5;

    //Input ports
    input [4:0] a, b;

    //Structural
    integer i;

    //Stage 1
    for (i = 0; i < 5; i = i + 1) begin
        p1[i] = a[i] & b[0];
    end
    for (i = 5; i < 9; i = i + 1) begin
        p1[i] = b[0];
    end

    //Stage 2
    for (i = 0; i < 5; i = i + 1) begin
        p2[i + 1] = a[i] & b[1];
    end
    for (i = 6; i < 9; i = i + 1) begin
        p2[i] = b[1];
    end

    //Stage 3
    for (i = 0; i < 5; i = i = 1) begin
        p3[i + 2] = a[i] & b[2];
    end
    for (i = 7; i < 9; i = i + 1) begin
        p3[i] = b[2];
    end

    //Stage 4
    for (i = 0; i < 5; i = i + 1) begin
        p4[i + 3] = a[i] & b[3];
    end
    for (i = 8; i < 9; i = i + 1) begin
        p4[i] = b[3];
    end

    //Stage 5
    for (i = 0; i < 5; i = i + 1) begin
        p5[i + 4] = a[i] & b[4];
    end
    
endmodule
    