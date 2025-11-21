module MEALY_NON_1011_TB;

    reg clk = 0;
    reg rst;
    reg in;
    wire out;

    MEALY_NON_1011 uut(
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
        // Apply test sequence
        in = 1; #10;  // 1
        in = 0; #10;  // 0
        in = 1; #10;  // 1
        in = 1; #10;  // 1 -> sequence 1011 detected
        in = 0; #10;  // Next sequence
        in = 1; #10;  // 1
        in = 0; #10;  // 0
        in = 1; #10;  // 1
        in = 1; #10;  // 1 -> sequence detected again
        in = 0; #10;  // 0
        in = 1; #10;  // 1
        in = 1; #10;  // 1 -> another detection
        #10 $finish; // End simulation
    end

endmodule
