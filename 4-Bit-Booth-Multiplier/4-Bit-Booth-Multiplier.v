module BOOTH_MULTIPLIER(
    input signed [3:0] a, b,
    output reg signed [7:0] product
); 
    reg signed [3:0] A, Q, M; 
    reg Q_1; 
    integer count; 

    always @(*) begin 
        A = 4'd0; 
        M = a; 
        Q = b; 
        Q_1 = 1'd0; 
        count = 4; 

        while(count > 0) begin 
            case({Q[0], Q_1}) 
                2'b01: A = A + M; 
                2'b10: A = A - M; 
                default: ; 
            endcase 

            {A, Q, Q_1} = {A[3], A, Q, Q_1} >>> 1; 
            count = count - 1; 
        end 

        product = {A, Q}; 
    end 
endmodule
