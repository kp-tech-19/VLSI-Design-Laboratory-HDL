module MAC_TESTBENCH; 
    reg [7:0] a, b; 
    reg clk = 0; 
    reg rst; 
    wire [15:0] acc; 

    MAC_UNIT mac(.a(a), .b(b), .clk(clk), .rst(rst), .acc(acc)); 

    always #5 clk = ~clk;  

    initial begin 
        $monitor($time," a=%b, b=%b, clk=%b, rst=%b, acc=%b", a, b, clk, rst, acc); 

        rst = 1; a = 0; b = 0; 
        #10 rst = 0; a = 2; b = 4; 
        #10 rst = 0; a = 4; b = 4; 
        #10 rst = 0; a = 3; b = 5; 
        #20 $finish; 
    end 
endmodule
