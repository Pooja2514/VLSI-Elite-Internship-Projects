module ram_tb;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

ram uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

// Clock generation
always #5 clk = ~clk;

initial begin
  $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;

    // WRITE operation
    we = 1; addr = 4'b0001; din = 8'b10101010; #10;
    we = 1; addr = 4'b0010; din = 8'b11110000; #10;

    // READ operation
    we = 0; addr = 4'b0001; #10;
    we = 0; addr = 4'b0010; #10;

    $finish;
end

endmodule
