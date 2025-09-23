module priority_tb ();

    //Outputs are wires
    wire [1:0] out;
    wire v;

    //Inputs are registers
    reg [3:0] in;

    //Instantiate the DUT
    priority4to2 DUT (.out(out), .v(v), .in(in));

    //Display
    initial begin
        $display (" time |  in  | out v ");
        $monitor (" %04t | %4b | %b  %b ", $time, in, out, v);
            #10 in = 4'b1111;
            #10 in = 4'b0111;
            #10 in = 4'b0011;
            #10 in = 4'b0001;
            #10 in = 4'b0000;
            #10 in = 4'b1011;
            #10 in = 4'b0101;
            #10 in = 4'b1110;
        $finish;
    end

endmodule