module dflip_tb ();

    //Outputs are wires
    wire q, q_bar;

    //Inputs are registers
    reg d, clk, reset;

    //Initialize the DUT
    dflip DUT (.q(q), .q_bar(q_bar), .d(d), .clk(clk), .reset(reset));

    //Start
    initial begin
        $display (" time | d reset | q q_bar ");
        $monitor ("%04t | %b %b | %b %b ", $time, d, reset, q, q_bar);

        //Clock generator
        always #5 clk = ~clk;

        repeat (10) begin
            d = $random % 2;
            reset = $random % 2;
            #10
        end

        $finish;
    end
endmodule
