module BI2BCD (
  input [8:0]BI,
  output reg [3:0]ones,
  output reg [3:0]tens,
  output reg [3:0]hundreds
  );
  integer i;
  always@(BI)
  begin
    ones=4'b0;
    tens=4'b0;
    hundreds=4'b0;
    for(i=8;i>=0;i=i-1)
    begin
      if(ones>=5)
        ones = ones+3;
       if(tens>=5)
        tens = tens+3;
      if(hundreds>=5)
        hundreds = hundreds+3;
      hundreds = hundreds <<1;
      hundreds[0] = tens[3];
      tens = tens <<1;
      tens[0] = ones[3];
      ones = ones <<1;
      ones[0] = BI[i];
    end
  end
endmodule