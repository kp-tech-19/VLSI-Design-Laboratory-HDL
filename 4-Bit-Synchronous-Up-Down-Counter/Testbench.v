module UP_DOWN_TESTBENCH; 
    reg clk = 0; 
    reg rst, ud; 
    wire [3:0] counter; 

    UP_DOWN_COUNTER updown(.clk(clk), .rst(rst), .ud(ud), .counter(counter)); 

    always #5 clk = ~clk; 

    initial begin 
        $monitor($time," clk=%b, rst=%b, ud=%b, counter=%b", clk, rst, ud, counter); 

        rst = 1; ud = 1; 
        #10 rst = 0; 

        ud = 1; 
        repeat(16) @(posedge clk);  // count up 16 times

        ud = 0; 
        repeat(16) @(posedge clk);  // count down 16 times
    end 
endmodule
