module Register_File
  #(parameter width =32 )
  (
    input   wire   [width-1:0]     WD3,
    input   wire   [4:0]           A1,
    input   wire   [4:0]           A2,
    input   wire   [4:0]           A3,
    input   wire                   clk,
    input   wire                   rst,
    input   wire                   WE3,
    output  reg    [width-1:0]     RD1,
    output  reg    [width-1:0]     RD2);
   
  
reg [width-1:0] regsiter [99:0];
integer i;

always@(*)
begin
    RD1=regsiter[A1];
    RD2=regsiter[A2];
end

always@(posedge clk or negedge rst)
begin
 if(!rst)
   begin
    for(i=0;i<100;i=i+1)
    begin
    regsiter[i]<=32'b0;
    end
   end
 else if(WE3)
    begin
    regsiter[A3]<=WD3;
    end
end

endmodule
