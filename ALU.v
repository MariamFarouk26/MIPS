module ALU
  #(parameter width = 32)
  (
  input  wire  [width-1:0]    ScrA,
  input  wire  [width-1:0]    ScrB,
  input  wire  [2:0]          Alu_Control,
  output wire                 Zero_flag,
  output reg   [width-1:0]    Alu_Result
  );
  
  

  //here we dont need the default case
always@(*)
  begin
  case(Alu_Control)
    3'b000  : begin
              Alu_Result=ScrA&ScrB;
              end
    3'b001  : begin
              Alu_Result=ScrA|ScrB; 
              end
    3'b010  : begin
              Alu_Result=ScrA+ScrB;
              end
    3'b100  : begin
              Alu_Result=ScrA-ScrB;
              end
    3'b101  : begin
              Alu_Result=ScrA*ScrB;
              end
    3'b110  : begin 
              if(ScrA<ScrB)
               Alu_Result=32'b1;
              else
               Alu_Result=32'b0;
              end
   default  : begin
              Alu_Result=32'b0;
              end
  endcase 
end
 
assign Zero_flag=(Alu_Result==0);
 
endmodule

