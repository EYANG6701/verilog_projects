module fulladder (sum, cout, a, b, cin);

output sum, cout;
input a, b, c;

    always @ (*) begin
        {cout, sum} = a + b + cin;
    end

endmodule