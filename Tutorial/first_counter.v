module first_counter (clock, reset, enable, counter_out);

    input clock;
    input reset;
    input enable;

    output [3:0] counter_out;

    wire clock;
    wire reset;
    wire enable;

    reg [3:0] counter_out;

    always @ (posedge clock) 
    begin : COUNTER 
        if (reset == 1'b1) begin
            counter_out <= #1 4'b0000;
        end 
        else if (enable == 1'b1) begin
            counter_out <= #1 counter_out + 1;
        end 
    end 
endmodule 

module first_counter_tb();

reg clock, reset, enable;
wire [3:0] counter_out;

initial begin
    $display ("time\t clk reset enable counter");
    $monitor ("%g\t %b %b %b %b", $time, clock, reset, enable, counter_out);
    clock = 1;
    reset = 0;
    enable = 0;
    #5 reset = 1;
    #10 reset = 1;
    #10 enable = 0;
    100 enable = 0; //Add the # symbol. VSCode is tweaking.
    #5 $finish;
end

always begin
    #5 clock = ~clock;
end

first_counter DUT (clock, reset, enable, counter_out);

endmodule


