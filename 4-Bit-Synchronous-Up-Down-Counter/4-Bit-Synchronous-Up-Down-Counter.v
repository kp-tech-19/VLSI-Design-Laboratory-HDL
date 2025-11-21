module UP_DOWN_COUNTER(
    input clk, rst, ud,
    output reg [3:0] counter
); 
    always @(posedge clk) begin 
        if (rst) 
            counter <= 4'd0; 
        else if (ud) 
            counter <= counter + 1; 
        else 
            counter <= counter - 1; 
    end 
endmodule
