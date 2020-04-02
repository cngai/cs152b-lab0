`timescale 1ns / 1ns
module bcdCounter_tb();

reg[3:0] D;
reg CLK, CLR, ENABLE, UP, LOAD;
wire[3:0] Q;
wire CO;

bcdCounter dut (D, CLK, CLR, ENABLE, LOAD, UP, Q, CO);

initial // Clock generator
  begin
    CLK = 0;
    forever #1 CLK = !CLK;
  end

/*
Test starts by couting up, then after #30, enable goes low and the counter stops.
After #20, enable is high again, but now UP is 0, so the counter counts down for #30.
Next the value 1'b0101 is loaded and the counter continues to count down.
After additional #40, the counter is cleared and UP is set to 1 so the counter continues from 0.
*/

initial	// Test stimulus
  begin
    D = 4'b0101;    
    ENABLE = 1;
    UP = 1;
    CLR = 1;
    LOAD = 0;
    #30
    ENABLE = 0;
    #20
    ENABLE = 1;
    UP = 0;
    #30
    LOAD = 1;
    #2
    LOAD = 0;
    #40
    CLR = 0;
    #2
    CLR = 1;
    UP = 1;
  end

endmodule