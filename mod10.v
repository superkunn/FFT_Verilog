module mod10(a, b, c, d);
input  signed [32 - 1:0] a, b;

output signed [32 - 1:0] c, d;

assign c = (a + b) % 10;
assign d = (a + b) / 10;

endmodule
