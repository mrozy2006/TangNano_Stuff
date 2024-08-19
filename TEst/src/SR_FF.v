module SR_FF 
(
    input clk,
    input s,
    input r,
    output q
);

    reg qReg = 1'b1;
    assign q = qReg;
    always @(s or r)
    begin
        if (s && !r)
        begin
            qReg <= 1'b1;
        end
        else if (!s && r)
        begin
            qReg <= 1'b0;
        end
        else
        begin
            qReg <= qReg;
        end
    end

endmodule