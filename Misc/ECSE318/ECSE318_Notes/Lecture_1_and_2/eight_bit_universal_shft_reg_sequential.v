module sred8u (q, d, load, enbl, rht, rht_in, lft,in, reset_l, clk);

    //I/O Ports
    output [7:0] q;
    input [7:0] d;
    input load, enbl, rht, rht_in, left_in, reset_l, clk;
    reg [7:0] q;

        //Behavioral
        always @ (posedge clk or negedge reset_l)
            if (!reset_l) q = 8'b00000000;
            else if (load) q = d;
            else if (enbl && rht) q = {q[6:0], rht_in};
            else if (enbl && !rht) q = {lft_in, q[7:1]};
            else q = q;
endmodule