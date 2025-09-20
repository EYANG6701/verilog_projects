module comparator2_tb ();

    //Input reg
    input reg [1:0] a, b;

    //Output wire
    output wire lt, eq, gt;

    //Instantiate DUT
    comparator2_behavioral DUT (.lt(lt), .eq(eq), .gt(gt), .a(a), .b(b));

    //Testing
    $display (" time | a b | lt, eq, gt ");
    $monitor (" %4t | %02b %02b | %b %b %b ");
    initial begin 
        a = 2'b10; b = 2'b01; #10;
        a