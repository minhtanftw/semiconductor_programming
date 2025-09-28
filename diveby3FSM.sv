module diveby3FSM (input logic clk,
                   input logic rst_n,
                   output logic y);

    logic [1:0] state, next_state;
    //State Register
    always_ff @(posedge clk or negedege rst_n) begin
        if (!rst_n)
            state < = 2'b00;
        else
            state <= next_state;
    end
    //Next State Logic
    always_comb
    case(state)
        2'b00: next_state = 2'b01;
        2b'01: nex_state = 2'b10;
        2'b10: next_state = 2'b00;
        default: next_state = 2'b00;
    endcase
    //Output logic
    assign y =( state == 2'b00);
    endmodule
