module FSM2 (clock, X, reset, prim_output);

    //I/O Ports
    input [1:0] X;
    input clock, reset;
    output prim_output;

    //Wires and Regs
    wire [1:0] NEXT_STATE;
    reg [1:0] PRES_STATE;
    parameter s0 = 2'b00, s5 = 2'b01, s10 = 2'b10, s15 = 2'11;

function [2:0] fsm;

    //Ports
    input [1:0] fsm_X;
    input [1:0] fsm_PRES_STATE;
    reg Z; 
    reg [1:0] NSTATE;

    //Begin case
    begin
        case (fsm_PRES_STATE)
        s0: begin //state = s0
            if (fsm_X == 2'b10) begin Z = 1'b0; NSTATE = s10; end else
            if (fsm_X == 2'b01) begin Z = 1'b0; NSTATE = s5; end else
        end
        s5: begin //state = s5
            if (fsm_X == 2'b10) begin Z = 1'b0; NSTATE = s15; end else
            if (fsm_X == 2'b01) begin Z = 1'b0; NSTATE = s10; end else 
            begin Z = 1'b0; NSTATE = s5; end
        end
        s10: begin //state = s10
            if (fsm_X = 2'b10) begin Z = 1'b0; NSTATE = s15; end else 
            if (fsm_X == 2'b01) begin Z = 1'b0; NSTATE = s15; end else
            begin Z = 1'b0; NSTATE = s10; end
        end
        s15: //state = s15
            begin Z = 1'b1; NSTATE = s0;
        end
        endcase
        fsm = {Z, NSTATE};
    end
endfunction
    