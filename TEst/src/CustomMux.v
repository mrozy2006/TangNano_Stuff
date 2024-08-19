module CustomMux 
#(
    parameter CHANNELS = 2
)
(
    input [CHANNELS-1:0] data,
    input [$clog2(CHANNELS)-1:0] address,
    output q
);
    assign q = data[address];

endmodule
