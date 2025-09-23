module priority4to2 (out, v, in);

    //Output ports
    output reg [1:0] out;
    output reg v;

    //Input ports
    input [3:0] in;

    //Behavioral
    always @ (*) begin
        if (in[3]) begin
            out = 2'b11; v = 1;
        end else if (in[2]) begin
            out = 2'b10; v = 1;
        end else if (in[1]) begin
            out = 2'b01; v = 1;
        end else if (in[0]) begin
            out = 2'b00; v = 1;
        end else begin
            out = 2'b00; v = 0;
        end
    end
endmodule
