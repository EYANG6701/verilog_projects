module register (q, d, reset_l, clk);

    //I/O Ports
    output [7:0] q;
    input [7:0] d;
    input reset_l, clk;
    reg [7:0] q;

    //Behavioral
        always @ (posedge clk or negedge reset_l)
            if (!reset_l) begin
                q = 8'b00000000;
            end
            else begin
                q = d;
            end
endmodule