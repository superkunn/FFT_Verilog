## 用Verilog编写的8点的FFT



### 可以进行十进制乘法，多项式乘法，内部使用快速傅里叶变换。



#### 需要安装


* iverilog

```
sudo apt-get install iverilog
```

* gtkwave

```
sudo apt-get install gtkwave
```

* make

```
sudo apt-get install make
```

#### 使用方法

* 运行前清理文件

```makefile
make clean
```

* 编译

```makefile
make run
```

* 仿真查看波形

```makefile
make sim
```



#### 文件介绍

* mul.v 顶层模块

* fft.v fft模块

* ifft.v ifft模块

* butterfly.v 蝶行变换模块

* mul_complex.v 复数乘法模块

* mod10.v 多项式转换到十进制数模块

* test.v 测试模块

  

#### 注意事项

1. 因为fft涉及小数运算，本项目中设计的小数为原值乘 2^16 的有符号整数表示，所以做乘法后要再除以2^16。

