module Buffer
(
    input data,
    input en,
    output q
);

assign q = en ? (data) : (1'b0);
endmodule