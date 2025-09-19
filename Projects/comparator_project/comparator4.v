module comparator4_behavioral (lt, eq, gt, a, b);

    //Output ports
    output lt, eq, gt;

    //Input ports
    input [3:0] a, b;

    //Integer
    integer i;

    //Behavioral
    always @ (*) begin
        for (i = 4; i > 0; i = i - 1)
            
