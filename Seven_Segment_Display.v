module Seven_Segment_Display(
  input clk_100MHz, 
  input reset,
  input [3:0] ones, 
  input [3:0] tens, 
  input [3:0] hundreds, 
  input [3:0] thousands,
  output reg [6:0] seg,
  output reg [3:0] digit
);

// 100 MHz Basys-3 clock 
// Active high reset 
// Ones digit input 
// Tens digit input 
// Hundreds digit input 
// Thousands digit input
// Segment output a-g (active low) 
// Digit enable (anodes, active low)
// Segment encodings (active low)
//
  
parameter ZERO = 7'b0000001;
parameter ONE = 7'b1001111;
parameter TWO = 7'b0010010;
parameter THREE = 7'b0000110;
parameter FOUR = 7'b1001100; 
parameter FIVE = 7'b0100100; 
parameter SIX = 7'b0100000; 
parameter SEVEN 7'b0001111; 
parameter EIGHT = 7'b0000000;
parameter NINE = 7'b0000100;


//
// Digit multiplexing control
//
reg [1:0] digit_select;
reg [16:0] digit_timer;
// Which digit is active // Refresh counter
  
always @(posedge clk_100MHz or posedge reset) 
  begin
    if (reset)
      begin
        digit_select <= 0;
      end
        digit_timer <= 0;
  end 
  else begin
if (digit_timer == 99999) begin
digit_timer <= 0;
digit_select <= digit_select + 1;
end else begin
digit_timer <= digit_timer + 1;
end
end
//
// Drive anode signals (active low)
//
