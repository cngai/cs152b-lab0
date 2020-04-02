module full_adder (
  a,
  b,
  cin,
  sum,
  cout
);

  input a, b, cin;
  output sum, cout;

  wire w1, w2, w3;
  and(w1, a, b);
  and(w2, a, cin);
  and(w3, b, cin);
  or(cout, w1, w2, w3);
  xor(sum, a, b, cin);

endmodule
  