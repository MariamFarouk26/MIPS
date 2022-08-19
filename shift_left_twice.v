module shift_left_twice
  #(parameter width=4)
  (input   wire    [width-1:0]     in,
   output  reg     [width-1:0]     out_shift
  );
  
always@(*)
begin
out_shift=in<<2;  
end
  
endmodule
