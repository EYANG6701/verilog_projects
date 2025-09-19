module hello_world;

    initial begin
        $Display ("Hello World by Eric");
        #10 $finish;
    end
endmodule