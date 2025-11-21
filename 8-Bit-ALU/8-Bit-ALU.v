module ALU_UNIT(
    input [3:0] a, b,
    input [3:0] sel,
    output reg [7:0] result
); 
    always @(*) begin 
        case(sel) 
            4'd0:  result = a + b; 
            4'd1:  result = a - b; 
            4'd2:  result = a * b; 
            4'd3:  result = a / b; 
            4'd4:  result = a + 1; 
            4'd5:  result = a - 1; 
            4'd6:  result = a & b; 
            4'd7:  result = a | b; 
            4'd8:  result = ~a; 
            4'd9:  result = ~(a & b); 
            4'd10: result = ~(a | b); 
            4'd11: result = a ^ b; 
            4'd12: result = ~(a ^ b); 
            4'd13: result = a >> 1; 
            4'd14: result = a << 1; 
            4'd15: result = a >>> 1; 
            default: result = 16'd0; 
        endcase 
    end 
endmodule
