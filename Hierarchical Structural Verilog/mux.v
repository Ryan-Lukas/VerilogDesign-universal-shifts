module mux(S,X,Out);

input [2:0]S;
input [7:0]X;
output reg Out;

	always @(*) begin
	
	case(S)
		0: Out <= X[0];
		1: Out <= X[1];
		2: Out <= X[2];
		3: Out <= X[3];
		4: Out <= X[4];
		5: Out <= X[5];
		6: Out <= X[6];
		7: Out <= X[7];
	endcase
end

endmodule
