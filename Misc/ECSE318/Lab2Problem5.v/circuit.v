module circuit (qa, qb, out, e, w, clk);

    //Output ports
    output reg qa, qb, out;

    //Input ports
    input e, w, clk;

    //Behavioral
    initial begin
        qa = 1'b0;
        qb = 1'b0;
        out = 1'b0;
    end

    always @ (posedge clk) begin
        //State 1
        if (~qa & ~qb) begin
            if (~e & ~w) begin
                out <= 1'b1;
            end else if (e & ~w) begin
                qa <= 1'b1;
                qb <= 1'b0;
                out <= 1'b0;
            end else if (~e & w) begin
                qa <= 1'b0;
                qb <= 1'b1;
                out <= 1'b0;
            end else if (e & w) begin
                qa <= 1'b1;
                qb <= 1'b1;
                out <= 1'b0;
            end
        //State 2
        end else if (~qa & qb) begin
            if (~e & ~w) begin
                out <= 1'b0;
            end else if (~e & w) begin
                out <= 1'b0;
            end else if (e & ~w) begin
                qa <= 1'b1;
                qb <= 1'b1;
                out <= 1'b0;
            end else if (e & w) begin
                qa <= 1'b1;
                qb <= 1'b1;
                out <= 1'b0;
            end
        //State 3
        end else if (qa & ~qb) begin
            if (~e & ~w) begin
                out <= 1'b0;
            end else if (e & ~w) begin
                out <= 1'b0;
            end else if (~e & w) begin
                qa <= 1'b1;
                qb <= 1'b1;
                out <= 1'b0;
            end else if (e & w) begin
                qa <= 1'b1;
                qb <= 1'b1;
                out <= 1'b0;
            end
        //State 4
        end else if (qa & qb) begin
            out <= 1'b0;
        end
    end
endmodule

                