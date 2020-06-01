/*
蝶行操作

(xr + xi) ----------------  --    ar + ai = (xr + xi) + [(yr + yi) * (wr + wi)] = (xr + yr * wr - yi * wi) + (xi + yr * wi + yi * wr)
                            \/             
                            /\              
(yr + yi) ---*(wr + wi)---  --    br + bi = (xr + xi) - [(yr + yi) * (wr + wi)] = (xr - yr * wr + yi * wi) + (xi - yr * wi - yi * wr) 
                            -1               
*/

module butterfly  (xr, xi, yr, yi, ar, ai, br, bi, wr, wi);

input signed [32 - 1:0] xr, xi, yr, yi;
input signed [32 - 1:0] wr, wi;

output signed [32 - 1:0] ar, ai, br, bi;

wire signed [2 * 32 - 1:0] yrwr, yiwi, yrwi, yiwr;

wire signed [2 * 32 - 1:0] oar, oai, obr, obi;

assign yrwr = yr * wr;
assign yiwi = yi * wi;
assign yrwi = yr * wi;
assign yiwr = yi * wr;

assign oar = (xr << 16) + yrwr - yiwi;
assign oai = (xi << 16) + yrwi + yiwr;
assign obr = (xr << 16) - yrwr + yiwi;
assign obi = (xi << 16) - yrwi - yiwr;

assign ar = oar[32 + 15:16];
assign ai = oai[32 + 15:16];
assign br = obr[32 + 15:16];
assign bi = obi[32 + 15:16];

endmodule
