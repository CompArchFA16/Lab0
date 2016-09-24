// FullAdder4bit testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit ();

    wire [3:0] sum;
    reg [3:0] a, b;
    wire cout, overflow;

    FullAdder4bit fa4b(sum, cout, overflow, a, b);

	initial begin

        // Dump trace to a file. Open with gtkwave.
        //$dumpfile("multiplexer_trace.vcd");
        //$dumpvars();
        //$dumpall;

    	$display("  a    b  |overflow carryout   sum ");
    	for(a=3'b000; a<=3'b111; a=a+1) begin
            for (b=3'b000; b<=3'b111; b=b+1) begin
            	#1000
            	$display("%b%b%b%b %b%b%b%b |   %b       %b      %b%b%b%b", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], overflow, cout, sum[3], sum[2], sum[1], sum[0]);
            end
        end
    end

endmodule
