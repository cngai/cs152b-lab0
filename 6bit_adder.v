module six_bit_adder (
  a,
  b,
  sum,
  carry
);

  input [5:0] a, b;
  output [5:0] sum;
  output carry;

  wire cin;
  assign cin = 0;

  full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c0));
  full_adder fa1(.a(a[1]), .b(b[1]), .cin(c0), .sum(sum[1]), .cout(c1));
  full_adder fa2(.a(a[2]), .b(b[2]), .cin(c1), .sum(sum[2]), .cout(c2));
  full_adder fa3(.a(a[3]), .b(b[3]), .cin(c2), .sum(sum[3]), .cout(c3));
  full_adder fa4(.a(a[4]), .b(b[4]), .cin(c3), .sum(sum[4]), .cout(c4));
  full_adder fa5(.a(a[5]), .b(b[5]), .cin(c4), .sum(sum[5]), .cout(carry));

endmodule
