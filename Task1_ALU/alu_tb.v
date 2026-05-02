module alu_tb;

reg [3:0] a, b;
reg [2:0] sel;
wire [3:0] y;

alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin
  $monitor($time,"a=%b,b=%b,sel=%b,y=%b",a,b,sel,y);
$dumpfile("dump.vcd"); $dumpvars;
    a = 4'b0101; b = 4'b0011;

    sel = 3'b000; #10; // ADD
    sel = 3'b001; #10; // SUB
    sel = 3'b010; #10; // AND
    sel = 3'b011; #10; // OR
    sel = 3'b100; #10; // NOT

end

endmodule
