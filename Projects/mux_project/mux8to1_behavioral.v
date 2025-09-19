module mux8to1_behavioral (y, a, b, c, d, e, f, g, h, sel);

	output reg [2:0] y;
	input [2:0] a, b, c, d, e, f, g, h, sel;

	always @ (*) begin
		case(sel)
			3'b000: y = a;
			3'b001: y = b;
			3'b010: y = c;
			3'b011: y = d;
			3'b100: y = e;
			3'b101: y = f;
			3'b110: y = g;
			3'b111: y = h;
			default: y = 3'b000;
		endcase
	end
endmodule
	