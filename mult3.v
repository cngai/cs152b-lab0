// Model a combinational circuit that determines
// if BCD input is divisible by 3

module mult_3(
  in,
  out
);

  input [15:0] in;
  output out;

  // Wires to hold intermediate sums
  wire [5:0] dig_sum_upper;
  wire [5:0] dig_sum_lower;
  wire [1:0] odd_sum_initial;
  wire [1:0] even_sum_initial;

  // Wires to hold total sums
  wire [5:0] dig_sum_total;
  wire [1:0] odd_sum;
  wire [1:0] even_sum;

  // Temporary wire to hold carries
  wire c_temp;

  // Convert digits to 6 bits for 6-bit adder
  wire [5:0] dig_3;
  wire [5:0] dig_2;
  wire [5:0] dig_1;
  wire [5:0] dig_0;
  assign dig_3 = in[15:12];
  assign dig_2 = in[11:8];
  assign dig_1 = in[7:4];
  assign dig_0 = in[3:0];

  // Add all 4 digits together
  six_bit_adder sba0(.a(dig_3), .b(dig_2), .sum(dig_sum_upper), .carry(c_temp));
  six_bit_adder sba1(.a(dig_1), .b(dig_0), .sum(dig_sum_lower), .carry(c_temp));
  six_bit_adder sba2(.a(dig_sum_upper), .b(dig_sum_lower), .sum(dig_sum_total), .carry(c_temp));

  // Convert digits to 2 bits for 2-bit adder
  wire [1:0] odd_2;
  wire [1:0] odd_1;
  wire [1:0] odd_0;
  wire [1:0] even_2;
  wire [1:0] even_1;
  wire [1:0] even_0;
  assign odd_2 = dig_sum_total[5];
  assign odd_1 = dig_sum_total[3];
  assign odd_0 = dig_sum_total[1];
  assign even_2 = dig_sum_total[4];
  assign even_1 = dig_sum_total[2];
  assign even_0 = dig_sum_total[0];

  // Add odd digits together
  two_bit_adder tb0(.a(odd_2), .b(odd_1), .sum(odd_sum_initial), .carry(c_temp));
  two_bit_adder tb1(.a(odd_sum_initial), .b(odd_0), .sum(odd_sum), .carry(c_temp));
  
  // Add even digits together
  two_bit_adder tb2(.a(even_2), .b(even_1), .sum(even_sum_initial), .carry(c_temp));
  two_bit_adder tb3(.a(even_sum_initial), .b(even_0), .sum(even_sum), .carry(c_temp));

  // Make sure odd_sum and even_sum are equal
  assign out = (~ (odd_sum[1]^even_sum[1])) && (~ (odd_sum[0]^even_sum[0]));

endmodule

