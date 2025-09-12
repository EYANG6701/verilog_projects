//First attempt
module mux(y, a, b, sel);

output y;
input a, b, sel;

if (sel == 0) begin
    assign y = a;
end else begin
    assign y = b;
end

//Correct answer
//First way (Continuous assignment)
module mux(y, a, b, sel);

    output y;
    input a, b, sel;

    assign y = (sel == 0) ? a : b;
endmodule

//Second way (Procedural)
module mux(y, a, b, sel);

    output reg y;
    input a, b, sel;

    always @ (*) begin
        if (sel == 0)
            y = a;
        else
            y = b;
    end
endmodule

module tb_mux;
    //Inputs are Registers
    reg a, b, sel;
    //Output is wire (DUT drives it)
    wire y;

    //Instantiate the DUT (Device Under Test)
    mux dut (.y(y), .a(a), .b(b), .sel(sel));

    //Apply Stimulus 
    initial begin 
        //Print Header 
        $display(" time | sel a b | y ");
        $monitor("%4t |   %b   %b %b | %b", $time, sel, a, b, y);

        //Test Cases
        a = 0; b = 1; sel = 0; #10;  // expect y = a = 0
        a = 0; b = 1; sel = 1; #10;  // expect y = b = 1
        a = 1; b = 0; sel = 0; #10;  // expect y = a = 1
        a = 1; b = 0; sel = 1; #10;  // expect y = b = 0

        $finish; //End simulation
    end
endmodule
