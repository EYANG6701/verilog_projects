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
            #10;
            $display (" %4t | %b %b %b | %b %b ", $time, a, b, c_in, sum, c_out);
        end

        $finish;
    end
endmodule


