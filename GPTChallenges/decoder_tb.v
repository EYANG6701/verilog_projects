module decoder_tb;

    //Outputs are wires
    wire [3:0] out;

    //Inputs are registers
    reg [1:0] in;

    //Instantiate DUT
    decoder dut (.out(out), .in(in));
	integer i;
    //Display stuff
    initial begin 
        $display (" time  |  in out ");
        $monitor (" %4t | %2b %4b ", $time, in, out);
	
	//Loop through all combos
	for (i = 0; i < 4; i = i + 1) begin
		in = i;
		#10;
	end
	$finish;
    end
endmodule 



