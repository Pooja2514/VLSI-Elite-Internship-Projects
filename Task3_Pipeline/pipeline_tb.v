module pipeline_tb;

reg clk;
reg [7:0] instr_in;
wire [7:0] result;

pipeline_processor uut (
    .clk(clk),
    .instr_in(instr_in),
    .result(result)
);

// Clock
always #5 clk = ~clk;

initial begin
  $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;

    // Initialize registers
    uut.regfile[0] = 10;
    uut.regfile[1] = 5;

    // ADD R0 + R1
    instr_in = 8'b00_00_01_00; #10;

    // SUB R0 - R1
    instr_in = 8'b01_00_01_00; #10;

    // LOAD (dummy)
    instr_in = 8'b10_00_00_00; #10;

    $finish;
end

endmodule
