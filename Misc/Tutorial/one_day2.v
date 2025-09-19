if (enable = 1'b1) begin
    data = 10;
    address = 16'hDEAD;
    wr_enable = 1'b1;
end else begin
    data = 32'b0;
    wr_enable = 1'b0;
    address = address + 1;
end
