module UNIVERSAL_SHIFT_TESTBENCH; 
    reg clk = 0; 
    reg rst, serial_in_left, serial_in_right; 
    reg [3:0] parallel_load; 
    reg [1:0] mode; 
    wire [3:0] q; 

    UNIVERSAL_SHIFT_REG shift(
        .clk(clk),
        .rst(rst),
        .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .parallel_load(parallel_load),
        .mode(mode),
        .q(q)
    ); 

    always #5 clk = ~clk;  

    initial begin 
        $monitor($time, " clk=%b, rst=%b, serial_in_right=%b, serial_in_left=%b, parallel_load=%b, mode=%b, q=%b",
                 clk, rst, serial_in_right, serial_in_left, parallel_load, mode, q); 

        rst = 1; serial_in_right = 0; serial_in_left = 0; parallel_load = 4'b0000; mode = 2'd0; 
        #10 rst = 0; 

        mode = 2'b11; parallel_load = 4'b0010; #10; // parallel load
        mode = 2'b00; #10;                          // hold
        mode = 2'b10; serial_in_left = 1; #10;     // shift left
        mode = 2'b10; #10;                          // shift left again
        mode = 2'b01; serial_in_right = 0; #10;    // shift right
        mode = 2'b01; #10;                          // shift right again
        mode = 2'b11; parallel_load = 4'b0110; #10;// parallel load
        #10 $finish; 
    end 
endmodule
