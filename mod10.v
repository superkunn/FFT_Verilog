module mod10(x0, x1, x2, x3, x4, x5, x6, x7,
             z0, z1, z2, z3, z4, z5, z6, z7);
input  signed [32 - 1:0] x0, x1, x2, x3, x4, x5, x6, x7;

wire signed [32 - 1:0] y0, y1, y2, y3, y4, y5, y6, y7;

output signed [32 - 1:0] z0, z1, z2, z3, z4, z5, z6, z7;

assign z7 = x7 % 10;
assign y7 = x7 / 10;

assign z6 = (x6 + y7) % 10;
assign y6 = (x6 + y7) / 10;

assign z5 = (x5 + y6) % 10;
assign y5 = (x5 + y6) / 10;

assign z4 = (x4 + y5) % 10;
assign y4 = (x4 + y5) / 10;

assign z3 = (x3 + y4) % 10;
assign y3 = (x3 + y4) / 10;

assign z2 = (x2 + y3) % 10;
assign y2 = (x2 + y3) / 10;

assign z1 = (x1 + y2) % 10;
assign y1 = (x1 + y2) / 10;

assign z0 = (x0 + y1) % 10;
assign y0 = (x0 + y1) / 10;

endmodule
