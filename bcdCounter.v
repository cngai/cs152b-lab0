// CS152B - Lab0 - Part1
module bcdCounter(D, CLK, CLR, ENABLE, LOAD, UP, Q, CO);

input[3:0] D;
input CLK, CLR, ENABLE, UP, LOAD;
output reg[3:0] Q;
output CO;
reg ctemp;

initial begin
  Q <= 4'b0000;
  ctemp <= 0;  
end

always @(posedge CLK, negedge CLR)
begin
  if(CLR == 0) begin
    Q <= 0;
    ctemp <= 0;
  end
  else begin
    if(LOAD == 1 && ENABLE == 1)
      Q <= D;
    else if(ENABLE == 1 && UP == 0) begin
      if(Q == 0) begin
        Q <= 4'b1001;
        ctemp <= 1;
      end
      else begin
        Q <= Q - 1;
        ctemp <= 0;
      end
    end
    else if(ENABLE == 1 && UP == 1) begin
      if(Q == 4'b1001) begin
        Q <= 0;
        ctemp <= 1;
      end
      else begin
        Q <= Q + 1;
        ctemp <= 0;
      end
    end
  end
end
assign CO = ctemp;
endmodule