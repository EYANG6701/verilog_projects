module comparator1_behavioral (lt, eq, gt, a, b);

    //Output points
    output reg lt, eq, gt;

    //Input ports
    input a, b;

    //Behavioral 
    always @ (*) begin
        lt = (a < b);
        eq = (a == b);
        gt = (a > b);
    end
endmodule