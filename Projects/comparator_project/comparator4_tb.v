module comparator4_tb ();

    //Output wires
    wire lt, eq, gt;

    //Input registers
    reg [3:0] a, b;

    //Loop counters
    integer i, j;

    //Instantiate the DUT
    comparator4_behavioral DUT (.lt(lt), .eq(eq), .gt(gt), .a(a), .b(b));

    initial begin
        $display (" time |    a     b  | lt eq gt ");
        $monitor (" %4t  | %b  %b |  %b   %b   %b ", $time, a, b, lt, eq, gt);

        // Nested loop to cover all 256 cases
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i;   // assign loop value to a
                b = j;   // assign loop value to b
                #5;           // delay to let signals settle
            end
        end

        $finish;
    end
endmodule

