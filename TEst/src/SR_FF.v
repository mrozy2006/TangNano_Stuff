module SR_FF 
(
    input clk,
    input d,
    input s,
    input r,
    output q
);

    reg qReg;
    assign q = qReg;

    always @(posedge clk or posedge s or posedge r)
    begin
        if (r)
        begin
            qReg <= 1'b0;
        end
        else if (s)
        begin
            qReg <= 1'b1;
        end
        else if (clk)
        begin
            qReg <= d;
        end
    end

endmodule