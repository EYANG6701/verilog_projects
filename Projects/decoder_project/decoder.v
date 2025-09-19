module decoder (
    input  [1:0] in,
    output [3:0] out
);

    assign out[3] = (in == 2'b00);
    assign out[2] = (in == 2'b01);
    assign out[1] = (in == 2'b10);
    assign out[0] = (in == 2'b11);

endmodule
