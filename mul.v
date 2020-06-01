/*
顶层模块mul
实现十进制非负整数乘法功能
  x * y = z
*/
module mul(
  x0, x1, x2, x3, 
  y0, y1, y2, y3, 
  z0, z1, z2, z3, z4, z5, z6, z7);
  
  input  signed [32 - 1:0] x0, x1, x2, x3;
  input  signed [32 - 1:0] y0, y1, y2, y3;
  
  output signed [32 - 1:0] z0, z1, z2, z3, z4, z5, z6, z7;
  
  wire    signed[32 - 1:0] xr0, xr1, xr2, xr3, xr4, xr5, xr6, xr7;
  wire    signed[32 - 1:0] xi0, xi1, xi2, xi3, xi4, xi5, xi6, xi7;
  
  wire    signed[32 - 1:0] yr0, yr1, yr2, yr3, yr4, yr5, yr6, yr7;
  wire    signed[32 - 1:0] yi0, yi1, yi2, yi3, yi4, yi5, yi6, yi7;
  
  wire    signed[32 - 1:0] zr0, zr1, zr2, zr3, zr4, zr5, zr6, zr7;
  wire    signed[32 - 1:0] zi0, zi1, zi2, zi3, zi4, zi5, zi6, zi7;
  
  wire    signed[32 - 1:0] wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7;
  wire    signed[32 - 1:0] wi0, wi1, wi2, wi3, wi4, wi5, wi6, wi7;
  
  fft xfft(0, 0, 0, 0, x0 << 16, x1 << 16, x2 << 16, x3 << 16, 
           0, 0, 0, 0, 0, 0, 0, 0,
           xr0, xr1, xr2, xr3, xr4, xr5, xr6, xr7,
           xi0, xi1, xi2, xi3, xi4, xi5, xi6, xi7
           );
           
  fft yfft(0, 0, 0, 0, y0 << 16, y1 << 16, y2 << 16, y3 << 16, 
           0, 0, 0, 0, 0, 0, 0, 0,
           yr0, yr1, yr2, yr3, yr4, yr5, yr6, yr7,
           yi0, yi1, yi2, yi3, yi4, yi5, yi6, yi7
           );
  
  mul_complex mul0(xr0, xi0, yr0, yi0, zr0, zi0);
  mul_complex mul1(xr1, xi1, yr1, yi1, zr1, zi1);
  mul_complex mul2(xr2, xi2, yr2, yi2, zr2, zi2);
  mul_complex mul3(xr3, xi3, yr3, yi3, zr3, zi3);
  mul_complex mul4(xr4, xi4, yr4, yi4, zr4, zi4);
  mul_complex mul5(xr5, xi5, yr5, yi5, zr5, zi5);
  mul_complex mul6(xr6, xi6, yr6, yi6, zr6, zi6);
  mul_complex mul7(xr7, xi7, yr7, yi7, zr7, zi7);
  
  ifft zifft(zr0, zr1, zr2, zr3, zr4, zr5, zr6, zr7,
             zi0, zi1, zi2, zi3, zi4, zi5, zi6, zi7,
             wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7,
             wi0, wi1, wi2, wi3, wi4, wi5, wi6, wi7
             );
 
  
  
  mod10 zmod10(0, wr0 >> 16, wr1 >> 16, wr2 >> 16, wr3 >> 16, wr4 >> 16, wr5 >> 16, wr6 >> 16,
               z0, z1, z2, z3, z4, z5, z6, z7);
  
endmodule
