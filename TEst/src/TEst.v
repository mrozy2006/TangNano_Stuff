module TEst
(
    input [1:0] KEY,
    input CLK,
    output [5:0] LEDS
);
wire [5:0] ledd;
assign LEDS = ~ledd;
wire ClkLine;

OE #(5, 2500) TestOE(CLK,ledd[0]);
freqDiv TestFreqDiv(CLK,ClkLine);

endmodule



module freqDiv
(
    input CLK,
    output reg CLKOut
);
reg [5:0] counts;
reg clkOut;
assign CLKOut = clkOut;
always @(posedge CLK) begin
    if(counts == 6'd11) begin
        counts <= 6'd0;
        clkOut <= ~clkOut;
    end
    else begin
        counts <= counts + 6'd1;
    end

end

endmodule