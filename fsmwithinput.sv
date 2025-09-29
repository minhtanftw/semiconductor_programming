module FSM(input logic clk,
           input logic clk_rst_n,
           input logic x,
           input logic y);
    typedef enum[1:0] { A= 2'b00,B= 2'b01, C= 2'b10, D= 2'b11} state_t;
    state_t state, next_state;


    //State register

    always_ff @(posedge clk or negede rst_n) begin
        if (!clk_rst_n)
            state <= A;
        else 
            state <= next_state;
    end 
    //Next state logic
    always_comb begin
        case(state)
            A: if (x) next_state = B; else next_state = A;
            B: if (x) next_state = C; else next_state = A;
            C: if (x) next_state = C; else next_state = D;
            D: if (x) next_state = B; else next_state = A;
            default: next_state = A;
        endcase
    