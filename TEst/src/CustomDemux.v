module CustomDemux 
#(
    parameter CHANNELS = 2
) 
(
    input data, 
    input [$clog2(CHANNELS)-1:0] address, 
    output [CHANNELS-1:0] q
);

genvar i;

generate
    for(i=0;i<CHANNELS;i=i+1)begin : DemuxGen
        assign q[i] = (address == i) ? data : 1'b0;
    end
endgenerate

endmodule