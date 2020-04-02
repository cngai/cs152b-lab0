// Model a combinational circuit that determines
// if BCD input is divisible by 11

module mult_11(
  in,
  out
);

  input [15:0] in;
  output out;

  // Wires that hold total sums
  wire [5:0] odd_sum;
  wire [5:0] even_sum;

  // Wires that hold intermediate sums
  wire [5:0] dig_3;
  wire [5:0] dig_2;
  wire [5:0] dig_1;
  wire [5:0] dig_0;
  assign dig_3 = in[15:12];
  assign dig_2 = in[11:8];
  assign dig_1 = in[7:4];
  assign dig_0 = in[3:0];

  // Temporary wire to hold carries
  wire c_temp;

  // Add odd digits
  six_bit_adder sba0(.a(dig_3), .b(dig_1), .sum(odd_sum), .carry(c_temp));
  // Add even digits
  six_bit_adder sba1(.a(dig_2), .b(dig_0), .sum(even_sum), .carry(c_temp));

  // Check if diff = 0
  wire diff_zero;
  assign diff_zero = (~ (odd_sum[5]^even_sum[5])) && (~ (odd_sum[4]^even_sum[4])) && (~ (odd_sum[3]^even_sum[3])) && (~ (odd_sum[2]^even_sum[2])) && (~ (odd_sum[1]^even_sum[1])) && (~ (odd_sum[0]^even_sum[0]));

  // Check if diff = 11 using subtraction
  // Two's complement - flip bits
  wire [5:0] inv_even_sum;
  assign inv_even_sum[5] = ~ even_sum[5];
  assign inv_even_sum[4] = ~ even_sum[4];
  assign inv_even_sum[3] = ~ even_sum[3];
  assign inv_even_sum[2] = ~ even_sum[2];
  assign inv_even_sum[1] = ~ even_sum[1];
  assign inv_even_sum[0] = ~ even_sum[0];

  wire [5:0] temp_diff;
  wire [5:0] neg_even_sum;
  wire [5:0] add_bit;
  assign add_bit = 6'b000001;

  six_bit_adder sba2(.a(odd_sum), .b(inv_even_sum), .sum(temp_diff), .carry(c_temp));
  // Add 1
  six_bit_adder sba3(.a(temp_diff), .b(add_bit), .sum(neg_even_sum), .carry(c_temp));
  
  wire diff_eleven;
  wire [5:0] eleven;
  assign eleven = 6'b001011;

  assign diff_eleven = (~ (neg_even_sum[5]^eleven[5])) && (~ (neg_even_sum[4]^eleven[4])) && (~ (neg_even_sum[3]^eleven[3])) && (~ (neg_even_sum[2]^eleven[2])) && (~ (neg_even_sum[1]^eleven[1])) && (~ (neg_even_sum[0]^eleven[0]));

  assign out = diff_zero || diff_eleven;

endmodule
