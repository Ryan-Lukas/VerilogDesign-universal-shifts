module UniversalShiftBehavioral(L,S,Clock, Q);
	input [0:3]L;
	input [2:0]S;
	input Clock;
	output reg [0:3]Q;

	
	//Q[3] MSB
	//Q[0] LSB
	always@(posedge Clock)
		begin
			if(S == 3'b000)begin
				Q[0] <= Q[0];
				Q[1] <= Q[1];
				Q[2] <= Q[2];
				Q[3] <= Q[3];
				end
		
			if(S == 3'b001)begin
				Q[0] <= Q[3];
				Q[1] <= Q[0];
				Q[2] <= Q[1];
				Q[3] <= Q[2];
				end
				
			if(S == 3'b010)begin
				Q[0] <= Q[1];
				Q[1] <= Q[2];
				Q[2] <= Q[3];
				Q[3] <= Q[0];
				end
			
			if(S == 3'b011)begin
				Q[0] <= 1'b0;
				Q[1] <= Q[0];
				Q[2] <= Q[1];
				Q[3] <= Q[2];
				end
				
			if(S == 3'b100)begin
				Q[0] <= Q[1];
				Q[1] <= Q[2];
				Q[2] <= Q[3];
				Q[3] <= 1'b0;
				end
			
			if(S == 3'b101)begin
				Q[0] <= Q[0];
				Q[1] <= Q[0];
				Q[2] <= Q[1];
				Q[3] <= Q[2];
				end
		
			if(S == 3'b110)begin
				Q[0] <= Q[1];
				Q[1] <= Q[2];
				Q[2] <= Q[3];
				Q[3] <= 1'b0;
				end
				
			if(S == 3'b111)begin
				Q[0] <= L[0];
				Q[1] <= L[1];
				Q[2] <= L[2];
				Q[3] <= L[3];
				end
		end
		
endmodule

