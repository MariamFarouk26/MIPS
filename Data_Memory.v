module Data_Memory
  #(parameter width =32 )
  (
    input   wire   [width-1:0]         WD,
    input   wire   [width-1:0]         A,
    input   wire                       clk,
     input   wire                      rst,
    input   wire                       WE,
    output  reg    [width-1:0]         RD,
    output  reg    [(width/2)-1:0]     TestValue);
   
  
reg [width-1:0] DataMemory [99:0];
integer i;

always@(*)
begin
    RD=DataMemory[A];
    TestValue=DataMemory[0];
end

always@(posedge clk or negedge rst)
begin
 if(!rst)
   begin
    for(i=0;i<100;i=i+1)
    begin
    DataMemory[i]<=32'b0;
    end
   end
 else if(WE)
    begin
    DataMemory[A]<=WD;
    end
end

endmodule

