module dflip (q, q_bar, d, clk, reset);

    //Ouput ports
    output reg q, q_bar;

    //Input ports
    input d, clk, reset;

    //Behavioral
    always @ (posedge clk) begin
        if (reset) begin
            q <= 1'b0;
            q_bar <= 1'b1;
        end else begin
            q <= d;
            q_bar <= ~d;
	    end
    end
endmodule