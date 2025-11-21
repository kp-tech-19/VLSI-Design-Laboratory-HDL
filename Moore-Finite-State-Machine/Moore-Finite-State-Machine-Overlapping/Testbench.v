module MOORE_TESTBENCH;
    reg clk = 0, rst, in;
    wire out;

    MOORE_OVER_1011 moore(.in(in), .clk(clk), .rst(rst), .out(out));

    always #5 clk = ~clk;

    initial begin
        $monitor($time," in=%b, clk=%b, rst=%b, out=%b", in, clk, rst, out);
        rst = 1; in = 0;
        #10 rst = 0;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        #10 $finish;
    end
endmodule
