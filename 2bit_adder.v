module two_bit_adder (
  a,
  b,
  sum,
  carry
);

  input [1:0] a, b;
  output [1:0] sum;
  output carry;

  wire cin;
  assign cin = 0;

  full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c0));
  full_adder fa1(.a(a[1]), .b(b[1]), .cin(c0), .sum(sum[1]), .cout(carry));

endmodule
