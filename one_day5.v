module counter (clk, rst, enable, count);

//Input Ports
input clk, rst, enable;

//Output Ports
output [3:0] count;
reg [3:0] count;

always @ (posedge clk or posedge rst)
if (rst) begin
    count <= 0;
end else begin : COUNT
    while (enable) begin
        count <= count + 1;
        disable COUNT;
    end
end

endmodule