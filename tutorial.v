module dff4(
	input trigger, 
	input[3:0] d,
	output[3:0] q
	);

	reg[3:0] q;
	always @(posedge trigger) begin
	q<=d;
	end
endmodule


module hw_wrapper(
	input[3:0] sw,
	input clk,
	output[3:0] led
);

	dff4 device(clk, sw, led);

endmodule