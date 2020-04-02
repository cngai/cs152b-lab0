module mult_3_tb;
  reg [15:0] in;
  wire out;

  mult_3 m3_test (
    .in (in),
    .out (out)
  );

  initial
    begin
      assign in = 16'h0000;		// 1
      #100 assign in = 16'h0002;	// 0
      #100 assign in = 16'h0006;	// 1
      #100 assign in = 16'h0025;	// 0
      #100 assign in = 16'h0036;	// 1
      #100 assign in = 16'h0397;	// 0
      #100 assign in = 16'h0936;	// 1
      #100 assign in = 16'h8643;	// 0
      #100 assign in = 16'h4524;	// 1
      #100 assign in = 16'h9999;	// 1
      #100
      $stop;
    end

endmodule