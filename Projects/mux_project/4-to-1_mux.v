module mux(y, a, b, sel);

    output y;
    input a, b, sel;

    assign y = (sel == 0) ? a : b;
endmodule

module mux4to1 (y, a, b, c, d, sel);

    output y;
    input a, b, c, d;
    input [1:0] sel;

    //Internal wires go here 
    wire w0, w1;

    //First stage
    mux mux0 (.y(w0), .a(a), .b(b), .sel(sel[0]));
    mux mux1 (.y(w1), .c(c), .d(d), .sel(sel[0]));

    //Second stage
    mux mux2 (.y(y), .a(w0), .b(w1), .sel(sel[1]));

endmodule 

//Looping Testbench
module tb_mux4;
    // Inputs are registers
    reg a, b, c, d;
    reg [1:0] sel;
    // Output is a wire
    wire y;

    // Instantiate the DUT
    mux4to1 dut (.y(y), .a(a), .b(b), .c(c), .d(d), .sel(sel));

    // Apply stimulus
    initial begin
        // Print header
        $display(" time | sel a b c d | y");
        $monitor("%4t  | %2b  %b %b %b %b | %b",
                 $time, sel, a, b, c, d, y);

        // Assign some values to inputs
        a = 1; b = 0; c = 1; d = 0;

        // Cycle sel through 00, 01, 10, 11
        for (sel = 0; sel < 4; sel = sel + 1) begin
            #10; // wait 10 time units before changing
        end

        $finish;
    end
endmodule

//Randomied Testbench
module tb_mux4_random;
    // Inputs are registers
    reg a, b, c, d;
    reg [1:0] sel;
    // Output is a wire
    wire y;

    // Instantiate the DUT
    mux4to1 dut (.y(y), .a(a), .b(b), .c(c), .d(d), .sel(sel));

    // Apply stimulus
    initial begin
        $display(" time | sel a b c d | y");

        // Run 10 random test cases
        repeat (10) begin
            // Randomize inputs
            a   = $random % 2;   // 0 or 1
            b   = $random % 2;
            c   = $random % 2;
            d   = $random % 2;
            sel = $random % 4;   // 0,1,2,3

            // Wait a little so monitor can print
            #10;
            $display("%4t  | %2b  %b %b %b %b | %b",
                     $time, sel, a, b, c, d, y);
        end

        $finish;
    end
endmodule

//Self Checking Testbench
module tb_mux4;
    // Inputs are registers
    reg a, b, c, d;
    reg [1:0] sel;
    // Output from DUT
    wire y;
    // Expected output (golden reference)
    reg expected;

    // Instantiate the DUT
    mux4to1 dut (.y(y), .a(a), .b(b), .c(c), .d(d), .sel(sel));

    // Apply stimulus
    initial begin
        $display(" time | sel a b c d | y (expected) | result");

        // Run 10 random test cases
        repeat (10) begin
            // Randomize inputs
            a   = $random % 2;
            b   = $random % 2;
            c   = $random % 2;
            d   = $random % 2;
            sel = $random % 4;

            // Wait a little for DUT to update
            #1;

            // Compute expected output
            case(sel)
                2'b00: expected = a;
                2'b01: expected = b;
                2'b10: expected = c;
                2'b11: expected = d;
            endcase

            // Compare DUT output against expected
            if (y !== expected)
                $display("%4t  | %2b  %b %b %b %b | %b (%b) | FAIL",
                         $time, sel, a, b, c, d, y, expected);
            else
                $display("%4t  | %2b  %b %b %b %b | %b (%b) | PASS",
                         $time, sel, a, b, c, d, y, expected);

            #9; // advance simulation time before next test
        end

        $finish;
    end
endmodule
