//计算两个复数的乘积
module mul_complex(a, b, c, d, x, y);

input signed [32 - 1:0] a, b, c, d;

output signed[32 - 1:0] x, y;

wire signed [32 * 2 - 1:0] ac, bd, xx, yy;
//(a + bi) * (c + di) = ac - bd + (bc + ad)i
//bc + ad = (a + b)(c + d) - ac - bd
assign ac = a * c;
assign bd = b * d;
assign xx = ac - bd;
assign yy = (a + b) * (c + d) - ac - bd;

assign x = xx[32 + 15:16];
assign y = yy[32 + 15:16];

endmodule
