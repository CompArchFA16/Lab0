run: build
	./adder4bit.o

build:
	iverilog -Wall -o adder4bit.o adder4bit.t.v

build-wrapper:
	iverilog -Wall -o lab0_wrapper.o lab0_wrapper.v

clean:
	rm *.o *.vcd
