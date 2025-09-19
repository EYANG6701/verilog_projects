module mux8to1 (y, a, b, c, d, e, f, g, h, sel);

	output [2:0] y;
	input [2:0] a, b, c, d, e, f, g, h;
	input [2:0] sel;

	//Internal wires
	wire [2:0] w0, w1, w2, w3, w4, w5;

	//First stage
	mux8to1_base m0 (.y(w0), .a(a), .b(b), .sel(sel[0]));
	mux8to1_base m1 (.y(w1), .a(c), .b(d), .sel(sel[0]));
	mux8to1_base m2 (.y(w2), .a(e), .b(f), .sel(sel[0]));
	mux8to1_base m3 (.y(w3), .a(g), .b(h), .sel(sel[0]));

	//Second Stage
	mux8to1_base m4 (.y(w4), .a(w0), .b(w1), .sel(sel[1]));
	mux8to1_base m5 (.y(w5), .a(w2), .b(w3), .sel(sel[1]));

	//Third Stage
	mux8to1_base m6 (.y(y), .a(w4), .b(w5), .sel(sel[2]));

endmodule