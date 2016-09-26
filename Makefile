run: build
	./adder4bit.o

build:
	iverilog -Wall -o adder4bit.o adder4bit.t.v

clean:
	rm *.o *.vcd
