//计算两个复数的乘积
module mul_complex(xr, xi, yr, yi, zr, zi);

input signed [32 - 1:0] xr, xi, yr, yi;

output signed[32 - 1:0] zr, zi;

wire signed [32 * 2 - 1:0] wr, wi;

assign wr = xr * yr - xi * yi;
assign wi = xr * yi + xi * yr;

assign zr = wr[32 + 15:16];
assign zi = wi[32 + 15:16];

endmodule
