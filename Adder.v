module Adder
  #(parameter width=32)
  (
   input   wire    [width-1:0]     in1,
   input   wire    [width-1:0]     in2,
   output  wire    [width-1:0]     out_adder
  );
  
  
  
assign out_adder=in1+in2;
  
endmodule



