module historyFSM( input logic clk,
                      input logic rst_n,
                      input logic x,
                      output logic y);

    typedef enum logic [1:0] {A=2'b00, B=2'b01, C=2'b10, D=2'b11} state_t;
    state_t state, next_state;

    //State Register
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= A;
        else
            state <= next_state;
    end

    //Next State Logic
    always_comb begin
        case(state)
            A: next_state = (x) ? B : A;
            B: next_state = (x) ? B : C;
            C: next_state = (x) ? D : A;
            D: next_state = (x) ? B : C;
            default: next_state = A;
        endcase
    end

    //Output Logic
    assign y = (state == D);