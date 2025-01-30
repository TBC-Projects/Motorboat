// This module defines states and logic for the traffic lights design
module intersection (clk, SN, SS, RedPixels, GrnPixels);
	input logic clk, SN, SS;
	output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs
   output logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	logic dir, dir2;// West east, north south
	
	// State variables
	enum { R, NG, NY, EG, EY, SG, SY, WG, WY } ps, ns;
	
	// Next State logic
	always_comb begin
		case (ps)
		NG:    ns = NY;
		NY:	 ns = R;
		EG:    ns = EY;
		EY:	 ns = R;
		SG:    ns = SY;
		SY:	 ns = R;
		WG:    ns = WY;
		WY:	 ns = R;
		
		S -> sensor
		T-> timer
		L-> long timer (direction)
		
		R:		 if(~T) ns = R;
		       else if((L&T) | (~S & T)) ns = HG;
				 else(~L & T & S) ns = FG;
		HG:    if(~L | ~T | ~S) ns = HG;
				 else(S & T & L) ns = HY;
		HY:    if(T) ns = R;
				 else ns = HY;	
		FG:	 if(~T) ns = FG;
				 else ns = FY;
		FY:	 if(T) ns = R;
				 else ns = FY;	
				 
		
		
		currentstate: if(condition) ns = nextstate;
				 else if(SS & ~SN) ns = SG;
				 else if(dir & dir2) ns = SG;
				 else if(dir & ~dir2) ns = NG;
				 else if(~dir & dir2) ns = EG;
				 else ns = WG;
		endcase
	end
	
	// Output logic
	always_comb begin
		case (ps)
		NG:    begin
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
		  
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000111000000;
		  GrnPixels[01] = 16'b0000000000000000;
		  GrnPixels[02] = 16'b0000000000000000;
		  GrnPixels[03] = 16'b0000000000000000;
		  GrnPixels[04] = 16'b0000000000000000;
		  GrnPixels[05] = 16'b0000000000000000;
		  GrnPixels[06] = 16'b0000000000000000;
		  GrnPixels[07] = 16'b0000000000000000;
		  GrnPixels[08] = 16'b0000000000000000;
		  GrnPixels[09] = 16'b0000000000000000;
		  GrnPixels[10] = 16'b0000000000000000;
		  GrnPixels[11] = 16'b0000000000000000;
		  GrnPixels[12] = 16'b0000000000000000;
		  GrnPixels[13] = 16'b0000000000000000;
		  GrnPixels[14] = 16'b0000000000000000;
		  GrnPixels[15] = 16'b0000000000000000;

		end
		NY:	 begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
		  
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000111000000;
		  GrnPixels[01] = 16'b0000000000000000;
		  GrnPixels[02] = 16'b0000000000000000;
		  GrnPixels[03] = 16'b0000000000000000;
		  GrnPixels[04] = 16'b0000000000000000;
		  GrnPixels[05] = 16'b0000000000000000;
		  GrnPixels[06] = 16'b0000000000000000;
		  GrnPixels[07] = 16'b0000000000000000;
		  GrnPixels[08] = 16'b0000000000000000;
		  GrnPixels[09] = 16'b0000000000000000;
		  GrnPixels[10] = 16'b0000000000000000;
		  GrnPixels[11] = 16'b0000000000000000;
		  GrnPixels[12] = 16'b0000000000000000;
		  GrnPixels[13] = 16'b0000000000000000;
		  GrnPixels[14] = 16'b0000000000000000;
		  GrnPixels[15] = 16'b0000000000000000;

		end
		EG:    begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000000;
		  RedPixels[08] = 16'b0000000000000000;
		  RedPixels[09] = 16'b0000000000000000;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
		  
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000000000000;
		  GrnPixels[01] = 16'b0000000000000000;
		  GrnPixels[02] = 16'b0000000000000000;
		  GrnPixels[03] = 16'b0000000000000000;
		  GrnPixels[04] = 16'b0000000000000000;
		  GrnPixels[05] = 16'b0000000000000000;
		  GrnPixels[06] = 16'b0000000000000000;
		  GrnPixels[07] = 16'b0000000000000001;
		  GrnPixels[08] = 16'b0000000000000001;
		  GrnPixels[09] = 16'b0000000000000001;
		  GrnPixels[10] = 16'b0000000000000000;
		  GrnPixels[11] = 16'b0000000000000000;
		  GrnPixels[12] = 16'b0000000000000000;
		  GrnPixels[13] = 16'b0000000000000000;
		  GrnPixels[14] = 16'b0000000000000000;
		  GrnPixels[15] = 16'b0000000000000000;

		end
		EY:	 begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
		  
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000000000000;
		  GrnPixels[01] = 16'b0000000000000000;
		  GrnPixels[02] = 16'b0000000000000000;
		  GrnPixels[03] = 16'b0000000000000000;
		  GrnPixels[04] = 16'b0000000000000000;
		  GrnPixels[05] = 16'b0000000000000000;
		  GrnPixels[06] = 16'b0000000000000000;
		  GrnPixels[07] = 16'b0000000000000001;
		  GrnPixels[08] = 16'b0000000000000001;
		  GrnPixels[09] = 16'b0000000000000001;
		  GrnPixels[10] = 16'b0000000000000000;
		  GrnPixels[11] = 16'b0000000000000000;
		  GrnPixels[12] = 16'b0000000000000000;
		  GrnPixels[13] = 16'b0000000000000000;
		  GrnPixels[14] = 16'b0000000000000000;
		  GrnPixels[15] = 16'b0000000000000000;

		end
		SG:    begin
		    RedPixels[00] = 16'b0000000111000000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000000;
          RedPixels[06] = 16'b1000000000000000;
          RedPixels[07] = 16'b1000000000000001;
          RedPixels[08] = 16'b0000000000000001;
          RedPixels[09] = 16'b0000000000000001;
          RedPixels[10] = 16'b0000000000000000;
          RedPixels[11] = 16'b0000000000000000;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000000000000000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000000000000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000000;
          GrnPixels[05] = 16'b0000000000000000;
          GrnPixels[06] = 16'b0000000000000000;
          GrnPixels[07] = 16'b0000000000000000;
          GrnPixels[08] = 16'b0000000000000000;
          GrnPixels[09] = 16'b0000000000000000;
          GrnPixels[10] = 16'b0000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000001110000000;

		end
		SY:	 begin
		    RedPixels[00] = 16'b0000000111000000;
          RedPixels[01] = 16'b0000000000000000;
          RedPixels[02] = 16'b0000000000000000;
          RedPixels[03] = 16'b0000000000000000;
          RedPixels[04] = 16'b0000000000000000;
          RedPixels[05] = 16'b0000000000000000;
          RedPixels[06] = 16'b1000000000000000;
          RedPixels[07] = 16'b1000000000000001;
          RedPixels[08] = 16'b0000000000000001;
          RedPixels[09] = 16'b0000000000000001;
          RedPixels[10] = 16'b0000000000000000;
          RedPixels[11] = 16'b0000000000000000;
          RedPixels[12] = 16'b0000000000000000;
          RedPixels[13] = 16'b0000000000000000;
          RedPixels[14] = 16'b0000000000000000;
          RedPixels[15] = 16'b0000001110000000;

          //                  FEDCBA9876543210
          GrnPixels[00] = 16'b0000000000000000;
          GrnPixels[01] = 16'b0000000000000000;
          GrnPixels[02] = 16'b0000000000000000;
          GrnPixels[03] = 16'b0000000000000000;
          GrnPixels[04] = 16'b0000000000000000;
          GrnPixels[05] = 16'b0000000000000000;
          GrnPixels[06] = 16'b0000000000000000;
          GrnPixels[07] = 16'b0000000000000000;
          GrnPixels[08] = 16'b0000000000000000;
          GrnPixels[09] = 16'b0000000000000000;
          GrnPixels[10] = 16'b0000000000000000;
          GrnPixels[11] = 16'b0000000000000000;
          GrnPixels[12] = 16'b0000000000000000;
          GrnPixels[13] = 16'b0000000000000000;
          GrnPixels[14] = 16'b0000000000000000;
          GrnPixels[15] = 16'b0000001110000000;

		end
		WG:    begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0000000000000000;
		  RedPixels[07] = 16'b0000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
		  
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000000000000;
		  GrnPixels[01] = 16'b0000000000000000;
		  GrnPixels[02] = 16'b0000000000000000;
		  GrnPixels[03] = 16'b0000000000000000;
		  GrnPixels[04] = 16'b0000000000000000;
		  GrnPixels[05] = 16'b0000000000000000;
		  GrnPixels[06] = 16'b1000000000000000;
		  GrnPixels[07] = 16'b1000000000000000;
		  GrnPixels[08] = 16'b0000000000000000;
		  GrnPixels[09] = 16'b0000000000000000;
		  GrnPixels[10] = 16'b0000000000000000;
		  GrnPixels[11] = 16'b0000000000000000;
		  GrnPixels[12] = 16'b0000000000000000;
		  GrnPixels[13] = 16'b0000000000000000;
		  GrnPixels[14] = 16'b0000000000000000;
		  GrnPixels[15] = 16'b0000000000000000;

		end
		WY:	 begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
		  
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000000000000;
		  GrnPixels[01] = 16'b0000000000000000;
		  GrnPixels[02] = 16'b0000000000000000;
		  GrnPixels[03] = 16'b0000000000000000;
		  GrnPixels[04] = 16'b0000000000000000;
		  GrnPixels[05] = 16'b0000000000000000;
		  GrnPixels[06] = 16'b1000000000000000;
		  GrnPixels[07] = 16'b1000000000000000;
		  GrnPixels[08] = 16'b0000000000000000;
		  GrnPixels[09] = 16'b0000000000000000;
		  GrnPixels[10] = 16'b0000000000000000;
		  GrnPixels[11] = 16'b0000000000000000;
		  GrnPixels[12] = 16'b0000000000000000;
		  GrnPixels[13] = 16'b0000000000000000;
		  GrnPixels[14] = 16'b0000000000000000;
		  GrnPixels[15] = 16'b0000000000000000;

		end
		R:		 begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
			GrnPixels = '0;

		end
		default: begin
		  RedPixels[00] = 16'b0000000111000000;
		  RedPixels[01] = 16'b0000000000000000;
		  RedPixels[02] = 16'b0000000000000000;
		  RedPixels[03] = 16'b0000000000000000;
		  RedPixels[04] = 16'b0000000000000000;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b1000000000000000;
		  RedPixels[07] = 16'b1000000000000001;
		  RedPixels[08] = 16'b0000000000000001;
		  RedPixels[09] = 16'b0000000000000001;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0000000000000000;
		  RedPixels[12] = 16'b0000000000000000;
		  RedPixels[13] = 16'b0000000000000000;
		  RedPixels[14] = 16'b0000000000000000;
		  RedPixels[15] = 16'b0000001110000000;
			GrnPixels = '0;

		end
		endcase
		
	end
	
	// DFFs
	always_ff @(posedge clk) begin
			if(dir) dir2 <= ~dir2;
			dir <= ~dir;
			ps <= ns;
	end
	
endmodule

//Intersection testbench
module intersection_testbench();
    logic clk, SN, SS;
    logic [15:0][15:0] RedPixels_tb;
    logic [15:0][15:0] GrnPixels_tb;
    
    intersection dut (
        .clk(clk),
        .SN(SN),
        .SS(SS),
        .RedPixels(RedPixels_tb),
        .GrnPixels(GrnPixels_tb)
    );

    // Set up a simulated clock.
    parameter CLOCK_PERIOD = 10;
    always #CLOCK_PERIOD clk = ~clk;

    // Initialize inputs
    initial begin
        clk = 0;
        SN = 0;
        SS = 0;
        
        // Apply stimulus
        #40 SN = 1; SS = 0; // North cycle, rest red
        #40 SN = 0; SS = 1; // South cycle, rest red
        #40 SN = 0; SS = 0; // Normal (counterclockwise) cycle
        #150 SN = 1; SS = 0; // North cycle
        #80 SN = 0; SS = 0; // Normal cycle
        #80 SN = 1; SS = 1; // Normal cycle
        #80 $stop; // End the simulation
    end
    
endmodule
