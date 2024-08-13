module Mux4to1
(
    input [3:0] inputs,
    input [1:0] address,
    output out
);

assign out = address[1] ? (address[0] ? (inputs[3]) : (inputs[2])) : (address[0] ? (inputs[1]) : (inputs[0]));
endmodule