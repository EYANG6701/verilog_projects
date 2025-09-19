module decoder_tb.v;

    //Outputs are registers
    reg [3:0] out;

    //Inputs are wires
    wire [1:0] in;

    //Instantiate DUT
    decoder_behavioral dut (.out(out), .in(in));

    //Display stuff
    initial begin 
        $display (" time  |  in out ");
        $monitor (" %4t | %2b %4b ", $time, in, out);

        #10 in = 2'b00;
        #10 in = 2'b11;
        #10 in = 2'b10;
        #10 in = 2'b01;
        $finish
    end
endmodule 



