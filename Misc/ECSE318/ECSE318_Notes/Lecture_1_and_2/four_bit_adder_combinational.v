module add4 (s, co, a, b, ci);
    //I/O Ports
    output [3:0] s;
    output co;
    input [3:0] a, b;
    input ci;

    //Behavioral
    assign {co, s} = a + b + ci;
endmodule