module OneTimeCounterWcout
#(
    parameter BUS_WIDTH = 4'd12,
    parameter MOD = 10'd1000
)
(   
    input clk,
    input rst,
    output cout,
    output [BUS_WIDTH-1:0] q
);

reg [BUS_WIDTH-1:0] count = 0;
reg cout_reg = 0;
reg rstFlag = 0;
assign q = count;
assign cout = cout_reg;
initial begin
count <= 0;
cout_reg <= 0;
rstFlag <= 0;
end
always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        cout_reg <= 0;
        rstFlag <= 0;
    end else if (count < (MOD-1)) begin
        count <= count + 1'b1;
    end else if ((count == (MOD-1)) && !rstFlag) begin
        cout_reg <= 1'b1;
        rstFlag <= 1'b1;
    end else if (rstFlag) begin
        cout_reg <= 0;
    end
end

endmodule