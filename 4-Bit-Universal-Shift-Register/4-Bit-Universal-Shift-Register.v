module UNIVERSAL_SHIFT_REG(
    input clk, rst, serial_in_left, serial_in_right,
    input [3:0] parallel_load,
    input [1:0] mode,
    output reg [3:0] q
); 
    always @(posedge clk) begin 
        if (rst) 
            q <= 4'd0; 
        else 
            case(mode) 
                2'b00: q <= q;                         // Hold
                2'b01: q <= {serial_in_left, q[3:1]};  // Shift right
                2'b10: q <= {q[2:0], serial_in_right}; // Shift left
                2'b11: q <= parallel_load;             // Parallel load
            endcase
    end 
endmodule
