module comparator4_behavioral (lt, eq, gt, a, b);

    //Output ports
    output reg lt, eq, gt;

    //Input ports
    input [3:0] a, b;

    //Behavioral
    always @ (*) begin
        lt = (a < b);
        eq = (a == b);
        gt = (a > b);
    end
endmodule
            
