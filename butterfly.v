/*
蝶行操作

(xr + xi) ----------------  --    ar + ai = (xr + xi) + [(yr + yi) * (wr + wi)]
                            \/             
                            /\              
(yr + yi) ---*(wr + wi)---  --    br + bi = (xr + xi) - [(yr + yi) * (wr + wi)] 
                            -1               
*/

module butterfly  (xr, xi, yr, yi, ar, ai, br, bi, wr, wi);

input signed [32 - 1:0] xr, xi, yr, yi;
input signed [32 - 1:0] wr, wi;

output signed [32 - 1:0] ar, ai, br, bi;

wire signed [32 - 1:0] zr, zi;

mul_complex yw(yr, yi, wr, wi, zr, zi);

assign ar = xr + zr;
assign ai = xi + zi;
assign br = xr - zr;
assign bi = xi - zi;

endmodule
