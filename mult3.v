// Model a combinational circuit that determines
// if BCD input is divisible by 3

module mult_3(
  in,
  out
);

  input [15:0] in;
  output reg out;

  reg [5:0] dig_sum;
  reg [1:0] odd_sum;
  reg [1:0] even_sum;

  always @*
    begin
      dig_sum = in[15:12] + in[11:8] + in[7:4] + in[3:0];
      odd_sum = dig_sum[5] + dig_sum[3] + dig_sum[1];
      even_sum = dig_sum[4]+ dig_sum[2] + dig_sum[0];

      out = (odd_sum - even_sum) === 0;
    end

endmodule

