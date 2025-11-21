module ALU_TESTBENCH; 
    reg [3:0] a, b; 
    reg [3:0] sel; 
    wire [7:0] result; 

    ALU_UNIT alu(.a(a), .b(b), .sel(sel), .result(result)); 

    integer i; 
    initial begin 
        $monitor($time, " a=%b, b=%b, sel=%b, result=%b", a, b, sel, result); 
        a = 2; b = 3; 
        for(i = 0; i < 16; i = i + 1) begin 
            sel = i; 
            #10; 
        end 
        #10 $finish; 
    end 
endmodule
