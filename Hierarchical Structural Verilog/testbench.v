`timescale 1ns/1ps

module testbench;
	reg [2:0]S; 
	reg Clock;
	reg [3:0]L; 
	wire [3:0] Q;
	reg [0:3] P;
	integer i;
	reg [8*4:0] string;
	
	
	UniversalShift UUT(.L(L),.S(S),.Clock(Clock),.Q(Q));
	
	initial begin
			
		//Q[3] MSB
		//Q[0] LSB
		
		$display("NOTE: These tests use the PREVIOUS value from the test before, for example if ASL just happened, ASR will perform its operations from the value it got from ASL");
		$display("MSB -> LSB");
		
		$display();
		$display();
		
		
		//1010
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b1010; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//0101
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b0101; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//1100
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b1100; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//0011
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b0011; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//1001
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b1001; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//0110
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b0110; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//0010
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b0010; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
		//1101
		for(i = 7; i >= 0; i = i-1) begin
			S = i;
			#2
			if(S == 7)begin
				Clock = 0;
				#10
				L = 4'b1101; #10
				Clock = 1;#2
				Clock = 0;#10;
				$display("LOAD: %b ", L);
			end
			else
				begin
			
			case(S)
				0: string = "HLD:";
				1: string = "CSR:";
				2: string = "CSL:";
				3: string = "LSR:";
				4: string = "LSL:";
				5: string = "ASR:";
				6: string = "ASL:";
			endcase
			
			
			Clock = ~Clock;
			#10
			$display("%s Q = %b %b %b %b", string, Q[3],Q[2],Q[1],Q[0]);
			Clock = ~Clock;
			#10;
			
			if(S == 6 && Q !={P[1],P[2],P[3],1'b0})begin
				$error("Error in ASL "); end
			if(S == 5 && Q != {P[0],P[0],P[1],P[2]})begin	
				$error("Error in ASR"); end
			if(S == 4 && Q != {P[1],P[2],P[3],1'b0})begin	
				$error("Error in LSL" ); end
			if(S == 3 && Q != {1'b0,P[0],P[1],P[2]})begin	
				$error("Error in LSR %b Compared: %b %b %b %b", Q, 1'b0,P[0],P[1],P[2]); end
			if(S == 2 && Q != {P[1],P[2],P[3],P[0]})begin	
				$error("Error in CSL"); end
			if(S == 1 && Q != {P[3],P[0],P[1],P[2]})begin	
				$error("Error in CSR"); end
			if(S == 0 && Q != {P[0],P[1],P[2],P[3]})begin	
				$error("Error in HOLD  %b Compared: %b %b %b %b", Q,P[0],P[1],P[2],P[3]); end 
				
				
			
			end
			
			P = Q;
		end
		
		
		$display();
		$display();
		
	
		
		
		S = 7;
		#2
		Clock = 0;
		#10
		L = 4'b1001; #10
		Clock = 1;#2
		Clock = 0;#10;
		S = 3'b001;#2
		$display("LOAD: %b ", L);
		$display("Test: %b:", S);
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		
		
		$display();
		$display();
		
		
		S = 7;
		#2
		Clock = 0;
		#10
		L = 4'b1100; #10
		Clock = 1;#2
		Clock = 0;#10;
		S = 3'b001;#2
		$display("LOAD: %b ", L);
		$display("Test: %b:", S);
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		
		$display();
		$display();
		
		
		S = 7;
		#2
		Clock = 0;
		#10
		L = 4'b1000; #10
		Clock = 1;#2
		Clock = 0;#10;
		S = 3'b010;#2
		$display("LOAD: %b ", L);
		$display("Test: %b:", S);
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		
		$display();
		$display();
		
		S = 7;
		#2
		Clock = 0;
		#10
		L = 4'b1001; #10
		Clock = 1;#2
		Clock = 0;#10;
		S = 3'b110;#2
		$display("LOAD: %b ", L);
		$display("Test: %b:", S);
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		Clock = 1;#2
		Clock = 0;#10;
		$display("Q = %b %b %b %b",Q[3],Q[2],Q[1],Q[0]);
		
		
		
	end
endmodule 