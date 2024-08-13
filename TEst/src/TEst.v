module TEst
(
    input [1:0] KEY,
    input CLK,
    output [5:0] LEDS
);

reg [20:0] count;
wire [5:0] ledd;
assign LEDS = ~ledd;
OE TestOE(count[13],ledd[0]);

always @(posedge CLK) count <= count + 1'b1;

endmodule

module OE
(
    input CLK,
    output Q
);

wire BufferEn, BufferClkOut; //Buffer Wires
wire [1:0] Address;
reg [1:0] AddressReg;
wire AddressIncrement;
wire [3:0] ClkInCounters, ClkOutCounters, COutCounters;
wire [10:0] QCounters [3:0];
wire SRReset;
wire SRSet;



Buffer ClkBuffer(CLK,BufferEn,BufferClkOut);

Demux1to4 InputDemux(BufferClkOut, Address, ClkInCounters);

OneTimeCounterWcout #(5'd11,11'd100) X1counter(ClkInCounters[0], COutCounters[1], COutCounters[0], QCounters[0]);
OneTimeCounterWcout #(5'd11,11'd200) X2counter(ClkInCounters[1], COutCounters[2], COutCounters[1], QCounters[1]);
OneTimeCounterWcout #(5'd11,11'd400) X3counter(ClkInCounters[2], COutCounters[3], COutCounters[2], QCounters[2]);
OneTimeCounterWcout #(5'd11,11'd800) X4counter(ClkInCounters[3], COutCounters[0], COutCounters[3], QCounters[3]);

Mux4to1 OutputMux({|QCounters[0],|QCounters[1],|QCounters[2],|QCounters[3]}, Address,Q);


OneTimeCounterWcout #(4'd3,3'd4)SRSafetyDelay(CLK,AddressIncrement,SRReset);
OneTimeCounterWcout #(4'd4,4'd10) SignalCounter(CLK,AddressIncrement,SRSet);

SR_FF BufferSR(1'b0,1'b0,SRSet,SRReset,BufferEn);


assign AddressIncrement = |COutCounters;
assign Address = AddressReg;

always @(posedge AddressIncrement) AddressReg <= AddressReg + 1'b1; 

endmodule



