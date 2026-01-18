module binary_to_bcd (
  input wire [7:0] bin,
  output reg [3:0] thousands, 
  output reg [3:0] hundreds,
  output reg [3:0] tens,
  output reg [3:0] ones
);

integer i;
reg [23:0] shift;
  
always@(*) 
  begin
    shift = 24'd0; 
    shift[7:0] = bin;
    
    for (i = 0; i < 8; i = i + 1)
      begin
        if (shift [23:20] >= 5) shift [23:20] = shift [23:20] + 3;
        if (shift [19:16] >= 5) shift [19:16] shift [19:16] + 3;
        if (shift [15:12] >= 5) shift [15:12] = shift [15:12] + 3;
        if (shift [11:8] >= 5) shift [11:8] shift [11:8] + 3; 
        shift = shift << 1;
      end
  
    thousands = shift[23:20]; 
    hundreds = shift[19:16];
    tens = shift [15:12];
    ones = shift [11:8];

  end
endmodule
