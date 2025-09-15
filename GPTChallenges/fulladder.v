module fulladder (sum, c_out, a, b, c_in);

    //output ports
    output sum, c_out;

    /input ports
    input a, b, c_in

    //wires
    wire w1, w2, w3;

    xor (w1, a, b);
    and (w2, a, b);
    xor (sum, c_in, w1);
    and (w3, w1, c_in);
    or (c_out, w2, w3);
endmodule

module tb_fulladder;
    //output wires
    wire sum, c_out;

    //input registers
    reg a, b, c_in;

    //Instantiate 
    fulladder DUT (.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));

    //Test
    initial begin
        $display (" time | a b c_in | sum c_out ");

        //Loop
        repeat (10) begin
            a = $random % 2;
            b = $random % 2;
            c_in = $random % 2;
            #10
            $display (" %4t | %b %b %b | %b %b ", $time, a, b, c_in, sum, c_out);
        end

        $finish;
    end
endmodule


