module Seven_Segment_Display(
  input clk_100MHz,             // 100 MHz Basys-3 clock 
  input reset,                  // Active high reset 
  input [3:0] ones,             // Ones digit input 
  input [3:0] tens,             // Tens digit input 
  input [3:0] hundreds,         // Hundreds digit input 
  input [3:0] thousands,        // Thousands digit input
  output reg [6:0] seg,         // Segment output a-g (active low) 
  output reg [3:0] digit        // Digit enable (anodes, active low) 
);


  // Segment encodings (active low) //
  
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
        digit_timer <= 0;
      end 
  else 
    begin
        if (digit_timer == 99999) 
          begin
            digit_timer <= 0;
            digit_select <= digit_select + 1;
          end 
        else 
          begin
            digit_timer <= digit_timer + 1;
          end
    end
  end

//
// Drive anode signals (active low)
//

  always @(*) 
    begin
      case(digit_select)
        2'b00: digit = 4'b1110; // Ones
        2'b01: digit = 4'b1101; // Tens
        2'b10: digit = 4'b1011; // Hundreds
        2'b11: digit = 4'b0111; // Thousands
      endcase
    end

  //
// Drive segment signals
//

  always @(*) 
    begin
      case (digit_select)
          2'b00: 
            case (ones) 
              4'd0: seg = ZERO;  4'd1: seg = ONE;  4'd2: seg = TWO; 4'd3: seg = THREE;
              4'd4: seg = FOUR;  4'd5: seg = FIVE; 4'd6: seg = SIX; 4'd7: seg = SEVEN; 
              4'd8: seg = EIGHT; 4'd9: seg = NINE; default: seg = 7'b1111111;
            endcase

          2'b01: 
            case (tens)
                4'd0: seg = ZERO;  4'd1: seg = ONE;  4'd2: seg = TWO; 4'd3: seg = THREE;
                4'd4: seg = FOUR;  4'd5: seg = FIVE; 4'd6: seg = SIX; 4'd7: seg = SEVEN; 
                4'd8: seg = EIGHT; 4'd9: seg = NINE; default: seg = 7'b1111111;
            endcase

        2'b10: 
          case (hundreds)
                4'd0: seg = ZERO;  4'd1: seg = ONE;  4'd2: seg = TWO; 4'd3: seg = THREE;
                4'd4: seg = FOUR;  4'd5: seg = FIVE; 4'd6: seg = SIX; 4'd7: seg = SEVEN; 
                4'd8: seg = EIGHT; 4'd9: seg = NINE; default: seg = 7'b1111111;
            endcase

        2'b11: 
            case (thousands)
                4'd0: seg = ZERO;  4'd1: seg = ONE;  4'd2: seg = TWO; 4'd3: seg = THREE;
                4'd4: seg = FOUR;  4'd5: seg = FIVE; 4'd6: seg = SIX; 4'd7: seg = SEVEN; 
                4'd8: seg = EIGHT; 4'd9: seg = NINE; default: seg = 7'b1111111;
            endcase
      endcase
    end
endmodule
        

