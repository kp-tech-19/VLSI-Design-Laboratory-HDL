module MEALY_OVER_1011(
    input in, clk, rst,
    output reg out
); 
    reg [1:0] state; 
    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11; 

    always @(posedge clk or negedge rst) begin 
        if (rst) begin
            state <= s0;
            out <= 0;
        end else begin
            case(state) 
                s0: begin
                    if (in) state <= s1; 
                    else state <= s0; 
                    out <= 0;
                end
                s1: begin
                    if (in) state <= s1; 
                    else state <= s2; 
                    out <= 0;
                end
                s2: begin
                    if (in) state <= s3; 
                    else state <= s0; 
                    out <= 0;
                end
                s3: begin
                    if (in) begin
                        state <= s1;   
                        out <= 1;      // Sequence detected
                    end else begin
                        state <= s2;
                        out <= 0;
                    end
                end  
            endcase
        end 
    end 
endmodule
