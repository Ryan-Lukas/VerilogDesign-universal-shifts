//This is the hierarchical structural code
module UniversalShift(L,S,Clock,Q);
	input [0:3]L;
	input [2:0]S;
	input Clock;
	output [0:3]Q;
	wire i, i1, i2, i3;
	
	
	mux u(.S(S),.X({L[0],Q[1],Q[0],Q[1],1'b0,Q[1],Q[3],Q[0]}),.Out(i));
	mux u1(.S(S),.X({L[1],Q[2],Q[0],Q[2],Q[0],Q[2],Q[0],Q[1]}),.Out(i1));
	mux u2(.S(S),.X({L[2],Q[3],Q[1],Q[3],Q[1],Q[3],Q[1],Q[2]}),.Out(i2));
	mux u3(.S(S),.X({L[3],1'b0,Q[2],1'b0,Q[2],Q[0],Q[2],Q[3]}),.Out(i3));
	
	
	dflipflop q(i,Clock, Q[0]);
	dflipflop q1(i1,Clock, Q[1]);
	dflipflop q2(i2,Clock, Q[2]);
	dflipflop q3(i3,Clock, Q[3]);
	
endmodule
