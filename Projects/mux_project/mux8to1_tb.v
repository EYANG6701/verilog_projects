module mux8to1_tb;

	//Inputs are registers
	reg [2:0] a, b, c, d, e, f, g, h, sel;

	//Outputs are wires
	wire [2:0] y;

	//Instantiate DUT
	mux8to1_behavioral DUT (.y(y), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .sel(sel));

	//Integer for looping
	integer i;

	//Start looping
	initial begin
		//Display 
		a = 3'b000; b = 3'b001; c = 3'b010; d = 3'b011; e = 3'b100; f = 3'b101; g = 3'b110; h = 3'b111;
		$display (" time | y | sel ");
		$monitor (" %4t | %03b | %03b ", $time, y, sel);
		for (i = 0; i < 8; i = i + 1) begin
			sel = i;
			#10; //Wait 10 time units
		end
		$finish;
	end
endmodule