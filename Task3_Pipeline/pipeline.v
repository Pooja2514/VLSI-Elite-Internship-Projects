module pipeline_processor(
    input clk,
    input [7:0] instr_in,
    output reg [7:0] result
);

// Pipeline registers
reg [7:0] IF_ID;
reg [7:0] ID_EX;
reg [7:0] EX_WB;

// Simple register file
reg [7:0] regfile [0:3];

// Opcodes
parameter ADD = 2'b00;
parameter SUB = 2'b01;
parameter LOAD = 2'b10;

// -------- Stage 1: FETCH --------
always @(posedge clk) begin
    IF_ID <= instr_in;
end

// -------- Stage 2: DECODE --------
always @(posedge clk) begin
    ID_EX <= IF_ID;
end

// -------- Stage 3: EXECUTE --------
always @(posedge clk) begin
    case(ID_EX[7:6])   // opcode
        ADD: EX_WB <= regfile[ID_EX[5:4]] + regfile[ID_EX[3:2]];
        SUB: EX_WB <= regfile[ID_EX[5:4]] - regfile[ID_EX[3:2]];
        LOAD: EX_WB <= ID_EX; // direct load (simplified)
        default: EX_WB <= 0;
    endcase
end

// -------- Stage 4: WRITE BACK --------
always @(posedge clk) begin
    result <= EX_WB;
end

endmodule
