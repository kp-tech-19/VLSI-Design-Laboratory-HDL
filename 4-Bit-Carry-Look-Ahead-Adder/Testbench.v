module CLA_TESTBENCH; 
    reg [3:0] a, b; 
    reg cin; 
    wire [3:0] sum; 
    wire cout; 

    CARRYLOOK_AHEAD_ADDER cla(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    ); 

    initial begin 
        $monitor($time," a=%b, b=%b, cin=%b, sum=%b, cout=%b", a, b, cin, sum, cout); 

        a = 4'd0; b = 4'd0; cin = 1'b0; 
        #10 a = 4'd4; b = 4'd2; cin = 1'b0; 
        #10 a = 4'd2; b = 4'd6; cin = 1'b0; 
        #10 a = 4'd10; b = 4'd5; cin = 1'b0; 
        #10 a = 4'd10; b = 4'd5; cin = 1'b1; 
        #10 $finish; 
    end 
endmodule
