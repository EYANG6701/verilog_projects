module sreg8 (q, d, load, shft_in, reset_l, clk);

    //I/O Ports
    output [7:0] q;
    input [7:0] d;
    input load, shft_in, reset_l, clk;
    reg [7:0] q;

        //Behavioral
        always @ (posedge clk or negedge reset_l)
            if (!reset_l) begin q = 8'b00000000;
            else if (load) q = d;
            else q = {q[6:0], shft_in};
endmodule