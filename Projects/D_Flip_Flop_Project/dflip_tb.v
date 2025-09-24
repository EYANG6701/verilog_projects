module dflip_tb ();

    //Outputs are wires
    wire q, q_bar;

    //Inputs are registers
    reg d, clk, reset;

    //Initialize the DUT
    dflip DUT (.q(q), .q_bar(q_bar), .d(d), .clk(clk), .reset(reset));

    //Clock generator
    initial clk = 0;
    always #5 clk = ~clk;  // toggle every 5 time units

    //Stimulus
    initial begin
        $display (" time | d reset | q q_bar ");
        $monitor ("%04t |   %b    %b   |  %b   %b ", $time, d, reset, q, q_bar);

        repeat (10) begin
            d = $random % 2;      // random data
            reset = $random % 2;  // random reset
            #10;                  // wait for next cycle
        end

        $finish;
    end
endmodule
