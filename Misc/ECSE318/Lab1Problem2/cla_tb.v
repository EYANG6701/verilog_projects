`timescale 1ns/1ps

module tb_generic_cla;

    // Inputs
    reg [3:0] a, b;
    reg c0;

    // Outputs
    wire [3:0] sum;
    wire cout;

    // Instantiate the CLA
    generic_cla uut (
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b),
        .c0(c0)
    );

    // Test procedure
    initial begin
        $display("Time |   a   b  c0 | sum cout | Expected");
        $display("-----+-------------+----------+---------");

        // Apply a few test vectors
        a = 4'b0000; b = 4'b0000; c0 = 0; #10;
        $display("%4t | %b %b %b |  %b   %b  | %05b", 
                  $time, a, b, c0, sum, cout, a+b+c0);

        a = 4'b0101; b = 4'b0011; c0 = 0; #10;
        $display("%4t | %b %b %b |  %b   %b  | %05b", 
                  $time, a, b, c0, sum, cout, a+b+c0);

        a = 4'b1111; b = 4'b0001; c0 = 0; #10;
        $display("%4t | %b %b %b |  %b   %b  | %05b", 
                  $time, a, b, c0, sum, cout, a+b+c0);

        a = 4'b1010; b = 4'b0101; c0 = 1; #10;
        $display("%4t | %b %b %b |  %b   %b  | %05b", 
                  $time, a, b, c0, sum, cout, a+b+c0);

        a = 4'b1111; b = 4'b1111; c0 = 1; #10;
        $display("%4t | %b %b %b |  %b   %b  | %05b", 
                  $time, a, b, c0, sum, cout, a+b+c0);

        $finish;
    end

endmodule
