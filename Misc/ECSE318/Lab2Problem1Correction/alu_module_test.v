module alu_module (
    input [15:0] a, b,
    input [4:0] alu_code,
    output [15:0] c,
    output overflow
);
    // Wires 
    wire [15:0] c_arithmetic, c_logic, c_shift, c_set_condition;
    wire vout, cout;

    // Instantiate modules
    arithmetic a0(
        .A(a),
        .B(b),
        .code(alu_code[2:0]),
        .cin(1'b0),
        .coe(1'b0),
        .C(c_arithmetic),
        .vout(vout),
        .cout(cout)
    );

    logic l0(
        .A(a),
        .B(b),
        .code(alu_code[2:0]),
        .C(c_logic)
    );

    shift s0(
        .A(a),
        .B(b),
        .code(alu_code[2:0]),
        .C(c_shift)
    );

    set_condition sc0(
        .A(a),
        .B(b),
        .code(alu_code[2:0]),
        .C(c_set_condition)
    );

    // 4-to-1 mux
    assign c = (alu_code[4:3] == 2'b00) ? c_arithmetic :
               (alu_code[4:3] == 2'b01) ? c_logic :
               (alu_code[4:3] == 2'b10) ? c_shift :
                                          c_set_condition;

    assign overflow = vout || cout; 
endmodule
