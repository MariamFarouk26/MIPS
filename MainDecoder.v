module MainDecoder 
  ( input   wire    [5:0]     Opcode,
    output  reg     [1:0]     AluOP_MD,
    output  reg               memWrite,
    output  reg               regWrite,
    output  reg               regDest,
    output  reg               aluSrc,
    output  reg               memtoReg,
    output  reg               Branch,
    output  reg               jump
  );
  
always@(*)
begin
  case(Opcode)
  6'b100011 :  begin
                jump=1'b0;
                AluOP_MD=2'b00;
                memWrite=1'b0;
                regWrite=1'b1;
                regDest=1'b0;
                aluSrc=1'b1;
                memtoReg=1'b1;
                Branch=1'b0;
                end
   6'b101011 :  begin
                jump=1'b0;
                AluOP_MD=2'b00;
                memWrite=1'b1;
                regWrite=1'b0;
                regDest=1'b0;
                aluSrc=1'b1;
                memtoReg=1'b1;
                Branch=1'b0;
                end
   6'b000000 :  begin
                jump=1'b0;
                AluOP_MD=2'b10;
                memWrite=1'b0;
                regWrite=1'b1;
                regDest=1'b1;
                aluSrc=1'b0;
                memtoReg=1'b0;
                Branch=1'b0;
                end
    6'b001000 :  begin
                jump=1'b0;
                AluOP_MD=2'b00;
                memWrite=1'b0;
                regWrite=1'b1;
                regDest=1'b0;
                aluSrc=1'b1;
                memtoReg=1'b0;
                Branch=1'b0;
                end
    6'b000100:  begin
                jump=1'b0;
                AluOP_MD=2'b01;
                memWrite=1'b0;
                regWrite=1'b0;
                regDest=1'b0;
                aluSrc=1'b0;
                memtoReg=1'b0;
                Branch=1'b1;
                end
    6'b000010 :  begin
                jump=1'b1;
                AluOP_MD=2'b00;
                memWrite=1'b0;
                regWrite=1'b0;
                regDest=1'b0;
                aluSrc=1'b0;
                memtoReg=1'b0;
                Branch=1'b0;
                end                         
    default   : begin
                jump=1'b0;
                AluOP_MD=2'b00;
                memWrite=1'b0;
                regWrite=1'b0;
                regDest=1'b0;
                aluSrc=1'b0;
                memtoReg=1'b0;
                Branch=1'b0;
                end
  endcase
end
 
  
endmodule
