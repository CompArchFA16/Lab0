// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
	reg [4:0] a;
	reg [4:0] b;
    wire overflow, carryout;
    wire [3:0] sum; 

    FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]);

    initial begin

    	$dumpfile("FullAdder4bit.vcd");
		$dumpvars(0, testFullAdder4bit);
		
		$display("Testing : ");
		$display("a  b | sum | expected sum | overflow | expected overflow");
		a = 14; b = 14; #1000
		$display("%d %d | %d |      %d      |    %d     |%d", a, b, sum, a + b, overflow, 1);

		$display("Testing : ");
		$display("a  b | sum | expected sum | overflow | expected overflow");
		a = 2; b = 8; #1000
		$display("%d %d | %d |      %d      |    %d     |%d", a, b, sum, a + b, overflow, 0);
		
		$display(" a  b | sum | overflow | carryout");
		
		for(a=0; a< 16; a = a + 1) begin
			for(b=0;b<16;b = b + 1) begin
				#1000
				$display("%d %d | %d  |    %d     |   %d", a, b, sum, overflow, carryout);
			end
		end
	end
endmodule
