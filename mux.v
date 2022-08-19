module mux
  #(parameter width=4)
  (input   wire                    select,
   input   wire    [width-1:0]     in1,
   input   wire    [width-1:0]     in2,
   output  reg     [width-1:0]     out_mux
  );
  
always@(*)
begin
  if(select)
    out_mux=in2;
  else
    out_mux=in1;
end
  
endmodule

