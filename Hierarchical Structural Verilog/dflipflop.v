module dflipflop(I,Clock,Q);
	input I;
	input Clock;
	output reg Q;
	
	always @(posedge Clock) begin
	
		Q <= I;
		
	end
	
endmodule
