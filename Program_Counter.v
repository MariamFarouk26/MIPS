module Program_Counter
  #(parameter width = 32)
  (
  input  wire  [width-1:0]     pc_in,
  input  wire                  clk,
  output wire                  rst,
  output reg   [width-1:0]     pc
  );
  
always@(posedge clk or negedge rst)
begin
  if(!rst)
    begin
     pc<=32'b0;
     end
   else
     begin
     //pc<=pc+4;
     pc<=pc_in;
     end
end


endmodule