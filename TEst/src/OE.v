
module OE
#(
    parameter ColorDepth = 4,
    parameter LSBOnTime = 18'd25000
)
(
    input CLK,
    output Q
);



wire BufferEn, BufferClkOut; //Buffer Wires
wire [$clog2(ColorDepth)-1:0] Address;
reg [$clog2(ColorDepth)-1:0] AddressReg;
wire AddressIncrement;
wire [ColorDepth-1:0] ClkInCounters, ClkOutCounters, COutCounters;
wire [$clog2(LSBOnTime*(2**(ColorDepth-1)))-1:0] QCounters [ColorDepth-1:0];
wire SRReset;
wire SRSet;
wire [ColorDepth-1:0] InputsMux;

Buffer ClkBuffer(CLK,BufferEn,BufferClkOut);

CustomDemux #(ColorDepth) InputDemux(BufferClkOut, Address, ClkInCounters);

genvar i;
generate
    for(i=0;i<ColorDepth;i=i+1)begin : CounterGen
        OneTimeCounterWcout #($clog2(LSBOnTime*(2**(ColorDepth-1))),LSBOnTime*(2**i)) Xcounter(ClkInCounters[i], COutCounters[i], COutCounters[(i+1)%ColorDepth], QCounters[i]);
    end
endgenerate

genvar j;
generate
    for(j=0;j<ColorDepth;j=j+1)begin : MuxGen
        assign InputsMux[j] = |QCounters[j];
    end
endgenerate

CustomMux #(ColorDepth) OutputMux(InputsMux, Address, Q);

OneTimeCounterWcout #(4'd3,3'd1)SRSafetyDelay(CLK,!AddressIncrement,SRReset);
OneTimeCounterWcout #(4'd11,11'd1200) SignalCounter(CLK,AddressIncrement,SRSet);

SR_FF BufferSR(1'b0,SRSet,SRReset,BufferEn);

assign AddressIncrement = |COutCounters;
assign Address = AddressReg;

always @(negedge AddressIncrement) begin
    if (AddressReg == (ColorDepth - 1))
        AddressReg <= 0;
    else
        AddressReg <= AddressReg + 1'b1;
end

endmodule
