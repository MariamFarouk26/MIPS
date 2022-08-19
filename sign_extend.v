module sign_extend
  #(parameter width = 16)
  (
  input wire [width-1:0]           instr,
  output reg [2*width-1:0]         signlmm
  );
  

  reg  [width-1:0] reslut;
  reg signal;
  
  always@(*)
  begin
    reslut=instr&16'd65535;
    signal=reslut>>15;
    if(signal==1)
      signlmm={16'd65535,reslut};
    else
      signlmm={16'd0,reslut};
  end
endmodule