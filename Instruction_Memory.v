module Instruction_Memory
  #(parameter width = 32)
  ( input  wire  [width-1:0]     A,
    output reg   [width-1:0]     RD);
   
  
reg [width-1:0] memory [99:0];

initial
 begin
 $readmemh("Program 2_Machine Code.txt",memory);
 end

always@(*)
  begin
  RD=memory[A>>2];
  end


endmodule