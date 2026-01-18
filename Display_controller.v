module Display_Controller(
	input clock,
	input reset,
	input mode,
	input valid_vote_casted, 
	input [7:0] cand1_vote,
	input [7:0] cand2_vote, 
	input [7:0] cand3_vote, 
	input [7:0] cand4_vote, 
	input cand1_button_press, 
	input cand2_button_press, 
	input cand3_button_press, 
	input cand4_button_press, 
	output [6:0] seg, 
	output [3:0] an
);

wire [3:0] th1;
wire [3:0] h1;
wire [3:0] tl;
wire [3:0] o1;
	
wire [3:0] th2;
wire [3:0] h2;
wire [3:0] t2;
wire [3:0] o2;
	
wire [3:0] th3;
wire [3:0] h3;
wire [3:0] t3;
wire [3:0] o3;
	
wire [3:0] th4;
wire [3:0] h4;
wire [3:0] t4;
wire [3:0] o4;
	
reg [3:0] th;
reg [3:0] h;
reg [3:0] t;
reg [3:0] o;

	
binary_to_bcd btb_cand1 (
	.bin(cand1_vote),
	.thousands(th1),
	.hundreds(h1),
	.tens(t1),
	.ones(o1)
);

binary_to_bcd btb_cand2(
	.bin(cand2_vote),
	.thousands(th2),
	.hundreds(h2), 
	.tens(t2),
	.ones(o2)
);

binary_to_bcd btb_cand3 (
	.bin(cand3_vote),
	.thousands(th3),
	.hundreds(h3),
	.tens(t3),
	.ones(o3)
);

binary_to_bcd btb_cand4 (
	.bin(cand4_vote),
	.thousands(th4),
	.hundreds(h4),
	.tens(t4),
	.ones(o4)
);

Seven_Segment_Display ssd (
	.clk_100MHz(clock),
	.reset(reset),
	.ones(o),
	.tens(t),
	.hundreds(h),
	.thousands(th),
	.seg(seg),
	.digit(an)
);

// Active high reset
// Ones digit input
// Tens digit input
// Hundreds digit input
// Thousands digit input
// Segment output a-g (active low)

always@(posedge clock)
	begin
		if(mode == 1)
			begin
				if (cand1_button_press)
					begin
						th <= th1;
						h <= h1;
						t <= t1;
						o <= o1;
					end
				else if (cand2_button_press)
					begin
						th <= th2;
						h <= h2;
						t <= t2;
						o <= o2;
					end
				else if (cand3_button_press)
					begin
						th <= th3;
						h <= h3;
						t <= t3;
						o <= o3;
					end
				else if (cand4_button_press)
					begin
						th <= th4;
						h <= h4;
						t <= t4;
						o <= o4;
					end
			end
			
		else
			begin
				th <= 4'd0;
				h <= 4'd0;
				t <= 4'd0;
				o <= 4'd0;
			end  
	end
endmodule
