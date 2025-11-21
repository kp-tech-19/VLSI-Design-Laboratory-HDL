module MEALY_OVER_1011_TB;

    reg clk = 0;
    reg rst;
    reg in;
    wire out;

    MEALY_OVER_1011 uut(
        .in(in),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor($time, " clk=%b, rst=%b, in=%b, out=%b", clk, rst, in, out);

        rst = 1; in = 0;
        #10 rst = 0;

        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        #10 $finish;
    end

endmodule
