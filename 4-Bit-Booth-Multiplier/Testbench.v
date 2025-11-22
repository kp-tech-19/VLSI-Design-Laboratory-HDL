module BOOTH_TESTBENCH; 
    reg signed [3:0] a, b; 
    wire signed [7:0] product; 

    BOOTH_MULTIPLIER booth(.a(a), .b(b), .product(product)); 

    initial begin 
        $monitor($time," a=%b, b=%b, product=%b", a, b, product); 

        a = 0; b = 0; 
        #10 a = 2; b = 4; 
        #10 a = 5; b =-8; 
        #10 a = -3; b = 6; 
        #10 $finish; 
    end 
endmodule
