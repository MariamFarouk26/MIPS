module Alu_Decoder
  (
    input   wire   [1:0]         AluOP_AD,
    input   wire   [5:0]         Func,
    output  reg    [2:0]         Alu_Control
    );
   

always@(*)
begin
  Alu_Control=3'b010;
  case(AluOP_AD)
   2'b00 :  begin
            Alu_Control=3'b010;
            end
   2'b01 :  begin
            Alu_Control=3'b100;
            end
   2'b10 :  begin 
            case(Func)
             6'b100000 :  begin
                          Alu_Control=3'b010;
                          end
             6'b100010 :  begin
                          Alu_Control=3'b100;
                          end
             6'b101010 :  begin
                          Alu_Control=3'b110;
                          end           
             6'b011100 :  begin
                          Alu_Control=3'b101;
                          end 
             default   :  begin
                          Alu_Control=3'b010;
                          end
            endcase  
            end                                     
    default     : begin
                  Alu_Control=3'b010;
                  end
endcase
end
 

endmodule



