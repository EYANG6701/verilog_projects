module comparator2_behavioral (lt, eq, gt, a, b);

    //Output ports
    output reg lt, eq, gt;

    //Input ports 
    input [1:0] a, b;

    //Behavioral
    always @ (*) begin
        lt = (a[1] < b[1]);
        gt = (a[1] > b[1]);
        if (a[1] == b[1])
            lt = (a[0] < b[0]);
            gt = (a[0] > b[0]);
            eq = (a[0] == b[0]);
        end
    end
endmodule

