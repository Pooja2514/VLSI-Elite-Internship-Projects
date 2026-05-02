module fir_tb;

reg clk;
reg [7:0] x;
wire [15:0] y;

fir_filter uut (
    .clk(clk),
    .x(x),
    .y(y)
);

// Clock
always #5 clk = ~clk;

initial begin
  $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;

    // Apply inputs
    x = 1; #10;
    x = 2; #10;
    x = 3; #10;
    x = 4; #10;
    x = 5; #10;

    $finish;
end

endmodule
