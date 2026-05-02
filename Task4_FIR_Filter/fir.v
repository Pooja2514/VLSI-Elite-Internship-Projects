module fir_filter(
    input clk,
    input [7:0] x,           
    output reg [15:0] y      
);


parameter h0 = 1;
parameter h1 = 2;
parameter h2 = 3;
parameter h3 = 4;


reg [7:0] x1, x2, x3;

always @(posedge clk) begin
    // Shift operation
    x3 <= x2;
    x2 <= x1;
    x1 <= x;

    // FIR equation
    y <= (h0 * x) + (h1 * x1) + (h2 * x2) + (h3 * x3);
end

endmodule
