module MAC_UNIT(
    input [7:0] a, b, 
    input clk, rst,
    output reg [15:0] acc
); 
    always @(posedge clk) begin 
        if(rst) 
            acc <= 16'd0; 
        else 
            acc <= acc + (a * b); 
    end 
endmodule
