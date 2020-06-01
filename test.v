
//测试模块
module test;

  reg      signed [32 - 1:0] x0, x1, x2, x3;
  reg      signed [32 - 1:0] y0, y1, y2, y3;
  
  wire     signed [32 - 1:0] z0, z1, z2, z3, z4, z5, z6, z7;
  
  initial
    begin
    // vcd dump
    $dumpfile("test.vcd");          //指定VCD文件的名字为test.vcd，仿真信息将记录到此文件
    // the variable 'testmul' is what GTKWave will label the graphs with
    $dumpvars(0, testmul);

    // 测试数据
    
    #100
    x0 = 1;
    x1 = 2;
    x2 = 3;
    x3 = 4;
    
    y0 = 5;
    y1 = 6;
    y2 = 7;
    y3 = 8;
    
    #100
    x0 = 0;
    x1 = 0;
    x2 = 0;
    x3 = 9;
    
    y0 = 0;
    y1 = 0;
    y2 = 0;
    y3 = 9;
    
    #100
    x0 = 9;
    x1 = 9;
    x2 = 9;
    x3 = 9;
    
    y0 = 9;
    y1 = 9;
    y2 = 9;
    y3 = 9;
    
    #100 $finish;
    end
   
   initial
     begin
       $monitor("%1d%1d%1d%1d * %1d%1d%1d%1d = %1d%1d%1d%1d%1d%1d%1d%1d",x0, x1, x2, x3, y0, y1, y2, y3, z0, z1, z2, z3, z4, z5, z6, z7);
    end
    
   mul testmul(x0, x1, x2, x3,
               y0, y1, y2, y3,
               z0, z1, z2, z3, z4, z5, z6, z7);
   
endmodule
