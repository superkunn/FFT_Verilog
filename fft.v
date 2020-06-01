module fft (
  inr_0, inr_1, inr_2, inr_3, inr_4, inr_5, inr_6, inr_7,
  ini_0, ini_1, ini_2, ini_3, ini_4, ini_5, ini_6, ini_7,
  
  outr_0, outr_1, outr_2, outr_3, outr_4, outr_5, outr_6, outr_7, 
  outi_0, outi_1, outi_2, outi_3, outi_4, outi_5, outi_6, outi_7);

  input      signed [32 - 1:0] inr_0, inr_1, inr_2, inr_3, inr_4, inr_5, inr_6, inr_7;
  input      signed [32 - 1:0] ini_0, ini_1, ini_2, ini_3, ini_4, ini_5, ini_6, ini_7;
  
  output     signed [32 - 1:0] outr_0, outr_1, outr_2, outr_3, outr_4, outr_5, outr_6, outr_7;
  output     signed [32 - 1:0] outi_0, outi_1, outi_2, outi_3, outi_4, outi_5, outi_6, outi_7;

  //1 + 0i
  parameter signed W0_REAL = 32'h00010000;
  parameter signed W0_IMAG = 32'h00000000;
  
  //0.7071067812 - 0.7071067812i
  parameter signed W1_REAL = 32'h0000B504;
  parameter signed W1_IMAG = 32'hFFFF4AFC;
  
  //0 - 1i
  parameter signed W2_REAL = 32'h00000000;
  parameter signed W2_IMAG = 32'hFFFF0000;
  
  //-0.7071067812 - 0.7071067812i
  parameter signed W3_REAL = 32'hFFFF4AFC;
  parameter signed W3_IMAG = 32'hFFFF4AFC;
  
wire signed [32 - 1:0] w0_0r, w0_1r, w0_2r, w0_3r, w0_4r, w0_5r, w0_6r, w0_7r;
wire signed [32 - 1:0] w0_0i, w0_1i, w0_2i, w0_3i, w0_4i, w0_5i, w0_6i, w0_7i;

wire signed [32 - 1:0] w1_0r, w1_1r, w1_2r, w1_3r, w1_4r, w1_5r, w1_6r, w1_7r;
wire signed [32 - 1:0] w1_0i, w1_1i, w1_2i, w1_3i, w1_4i, w1_5i, w1_6i, w1_7i;

wire signed [32 - 1:0] w2_0r, w2_1r, w2_2r, w2_3r, w2_4r, w2_5r, w2_6r, w2_7r;
wire signed [32 - 1:0] w2_0i, w2_1i, w2_2i, w2_3i, w2_4i, w2_5i, w2_6i, w2_7i;

wire signed [32 - 1:0] w3_0r, w3_1r, w3_2r, w3_3r, w3_4r, w3_5r, w3_6r, w3_7r;
wire signed [32 - 1:0] w3_0i, w3_1i, w3_2i, w3_3i, w3_4i, w3_5i, w3_6i, w3_7i;

    assign w0_0r = inr_0;
    assign w0_0i = ini_0;
    
    assign w0_1r = inr_4;
    assign w0_1i = ini_4;
    
    assign w0_2r = inr_2;
    assign w0_2i = ini_2;
    
    assign w0_3r = inr_6;
    assign w0_3i = ini_6;
    
    assign w0_4r = inr_1;
    assign w0_4i = ini_1;
    
    assign w0_5r = inr_5;
    assign w0_5i = ini_5;
    
    assign w0_6r = inr_3;
    assign w0_6i = ini_3;
    
    assign w0_7r = inr_7;
    assign w0_7i = ini_7;
    
    
    butterfly round0_0(w0_0r, w0_0i, w0_1r, w0_1i, w1_0r, w1_0i, w1_1r, w1_1i, W0_REAL, W0_IMAG);
    butterfly round0_1(w0_2r, w0_2i, w0_3r, w0_3i, w1_2r, w1_2i, w1_3r, w1_3i, W0_REAL, W0_IMAG);
    butterfly round0_2(w0_4r, w0_4i, w0_5r, w0_5i, w1_4r, w1_4i, w1_5r, w1_5i, W0_REAL, W0_IMAG);
    butterfly round0_3(w0_6r, w0_6i, w0_7r, w0_7i, w1_6r, w1_6i, w1_7r, w1_7i, W0_REAL, W0_IMAG);
    
    butterfly round1_0(w1_0r, w1_0i, w1_2r, w1_2i, w2_0r, w2_0i, w2_2r, w2_2i, W0_REAL, W0_IMAG);
    butterfly round1_1(w1_1r, w1_1i, w1_3r, w1_3i, w2_1r, w2_1i, w2_3r, w2_3i, W2_REAL, W2_IMAG);
    butterfly round1_2(w1_4r, w1_4i, w1_6r, w1_6i, w2_4r, w2_4i, w2_6r, w2_6i, W0_REAL, W0_IMAG);
    butterfly round1_3(w1_5r, w1_5i, w1_7r, w1_7i, w2_5r, w2_5i, w2_7r, w2_7i, W2_REAL, W2_IMAG);
    
    butterfly round2_0(w2_0r, w2_0i, w2_4r, w2_4i, w3_0r, w3_0i, w3_4r, w3_4i, W0_REAL, W0_IMAG);
    butterfly round2_1(w2_1r, w2_1i, w2_5r, w2_5i, w3_1r, w3_1i, w3_5r, w3_5i, W1_REAL, W1_IMAG);
    butterfly round2_2(w2_2r, w2_2i, w2_6r, w2_6i, w3_2r, w3_2i, w3_6r, w3_6i, W2_REAL, W2_IMAG);
    butterfly round2_3(w2_3r, w2_3i, w2_7r, w2_7i, w3_3r, w3_3i, w3_7r, w3_7i, W3_REAL, W3_IMAG);
    
    assign outr_0 = w3_0r;
    assign outi_0 = w3_0i;
    
    assign outr_1 = w3_1r;
    assign outi_1 = w3_1i;
    
    assign outr_2 = w3_2r;
    assign outi_2 = w3_2i;
    
    assign outr_3 = w3_3r;
    assign outi_3 = w3_3i;
    
    assign outr_4 = w3_4r;
    assign outi_4 = w3_4i;
    
    assign outr_5 = w3_5r;
    assign outi_5 = w3_5i;
    
    assign outr_6 = w3_6r;
    assign outi_6 = w3_6i;
    
    assign outr_7 = w3_7r;
    assign outi_7 = w3_7i;
    
endmodule

