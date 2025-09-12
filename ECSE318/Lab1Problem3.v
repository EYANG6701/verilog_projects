module csa (sum, c_out, a, b, c);

output sum, c_out;
input a, b, c;

assign sum = a ^ b ^ c;
assign c_out = (a & b) | (a & c) | (b & c);

endmodule

