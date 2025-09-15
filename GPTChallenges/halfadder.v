module halfadder (sum, c_out, a, b);
    //Output ports
    output sum, c_out;

    //Input ports
    input a, b;

    //Structure
    assign sum = a ^ b;
    assign c_out = a & b;
endmodule

module tb_halfadder;
    //Outputs
    wire sum, c_out;

    //Register inputs
    reg a, b;

    //Instantiate the DUT
    halfadder DUT (.sum(sum), .c_out(c_out), .a(a), .b(b));

    //Test
    initial begin
        $display(" time | a b sum c_out ");
        $monitor(" %4t | %b %b %b %b ", time, a, b, sum, c_out);

        //Create tests
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 1; #10;
        a = 1; b = 0; #10;
        $finish;
    end
endmodule