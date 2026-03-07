module TEst
(
    input clk,
    output [4:0] col,
    output [7:0] row
);

reg [25:0] count;

always @(posedge clk) begin
    count <= count + 1;
end
reg [4:0] colReg = 5'b0;
reg [7:0] rowReg = 5'b0;

reg [4:0] helloWorld [0:104] = {
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // H
        5'b10001, 5'b10001, 5'b11111, 5'b10001, 5'b10001,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // E
        5'b11111, 5'b10000, 5'b11111, 5'b10000, 5'b11111,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // L
        5'b10000, 5'b10000, 5'b10000, 5'b10000, 5'b11111,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // L
        5'b10000, 5'b10000, 5'b10000, 5'b10000, 5'b11111,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // O
        5'b01110, 5'b10001, 5'b10001, 5'b10001, 5'b01110,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // W
        5'b10001, 5'b10001, 5'b10001, 5'b10101, 5'b01010,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // O
        5'b01110, 5'b10001, 5'b10001, 5'b10001, 5'b01110,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // R
        5'b11110, 5'b10001, 5'b11110, 5'b10100, 5'b10010,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // L
        5'b10000, 5'b10000, 5'b10000, 5'b10000, 5'b11111,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000,
        // D
        5'b11110, 5'b10001, 5'b10001, 5'b10001, 5'b11110,
        // (space)
        5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000
    };

assign col = colReg;
assign row = rowReg;
reg [3:0] countReg = 1'b0;
reg [6:0] cursor = 7'b0;

function [4:0] reverseBits;
        input [4:0] bits;
        integer i;
        begin
            for (i = 0; i < 5; i = i + 1) begin
                reverseBits[i] = bits[4 - i];
            end
        end
    endfunction

always @(posedge count[6]) begin
    colReg <= ~reverseBits(helloWorld[countReg + cursor]);
    rowReg <= 1 << countReg;
    if (countReg == 7)
        countReg <= 0;
    else
        countReg <= countReg + 1;
end
always @(posedge count[22]) begin
    if(cursor == 99)
        cursor <= 0;
    else
        cursor <= cursor + 1;
end
endmodule

