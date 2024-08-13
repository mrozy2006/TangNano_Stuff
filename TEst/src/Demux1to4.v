module Demux1to4
(
    input data, 
    input [1:0] address, 
    output [3:0] q
);
    assign q[0] = (address == 2'b00) ? data : 1'b0;
    assign q[1] = (address == 2'b01) ? data : 1'b0;
    assign q[2] = (address == 2'b10) ? data : 1'b0;
    assign q[3] = (address == 2'b11) ? data : 1'b0;
endmodule