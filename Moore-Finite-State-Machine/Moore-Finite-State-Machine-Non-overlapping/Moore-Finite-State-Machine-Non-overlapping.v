//Detection 1011 sequence
module MOORE_NON_OVER_1011(
    input in, clk, rst,
    output reg out
);
    reg [3:0] state, next_state;
    parameter s0=4'd0, s1=4'd1, s2=4'd2, s3=4'd3, s4=4'd4;

    // State update
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case(state)
            s0: next_state = (in) ? s1 : s0;
            s1: next_state = (in) ? s1 : s2;
            s2: next_state = (in) ? s3 : s0;
            s3: next_state = (in) ? s4 : s2;
            s4: next_state = s0;  // Non-overlapping: go to start after detection
            default: next_state = s0;
        endcase
    end

    // Output logic
    always @(*) begin
        out = (state == s4) ? 1'b1 : 1'b0;  // 1 when sequence detected
    end
endmodule
