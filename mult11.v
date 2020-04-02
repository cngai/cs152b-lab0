// Model a combinational circuit that determines
// if BCD input is divisible by 11

module mult_11(
  in,
  out
);

  input [15:0] in;
  output reg out;

  reg [4:0] odd_sum;
  reg [4:0] even_sum;
  reg [4:0] diff;

  initial
    begin
      assign odd_sum = in[15:12] + in[7:4];
      assign even_sum = in[11:8] + in[3:0];
      assign diff = odd_sum - even_sum;

      assign out = diff === 0 || diff === 5'b01011;
    end

endmodule
