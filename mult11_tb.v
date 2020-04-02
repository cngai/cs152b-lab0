module mult_11_tb;
  reg [15:0] in;
  wire out;

  mult_11 m11_test (
    .in (in),
    .out (out)
  );

  initial
    begin
      assign in = 16'h0000;		// 1
      #100 assign in = 16'h0005;	// 0
      #100 assign in = 16'h0055;	// 1
      #100 assign in = 16'h0013;	// 0
      #100 assign in = 16'h0242;	// 1
      #100 assign in = 16'h0364;	// 0
      #100 assign in = 16'h8096;	// 1
      #100 assign in = 16'h7295;	// 0
      #100 assign in = 16'h9999;	// 1
      #100
      $stop;
    end

endmodule
