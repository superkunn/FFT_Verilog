
run: mul.v fft.v ifft.v butterfly.v mul_complex.v mod10.v test.v 
	iverilog -o test mul.v fft.v ifft.v butterfly.v mul_complex.v mod10.v test.v
	
	
sim: test
	vvp -n test -lxt2
	cp test.vcd test.lxt
	gtkwave test.lxt
clean:
	rm test test.vcd test.lxt
	
