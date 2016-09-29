all : adder.o

adder.o : adder.v adder.t.v
	iverilog adder.t.v -o adder.o

clean:
	rm adder.o
