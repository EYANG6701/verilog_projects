module 2to1mux_behavioral (out, a, b, sel);

    output reg out;
    input a, b, sel;

    always @ (*) begin
        if (sel == 0)
            out = a;
        else
            out = b;
    end
endmodule 