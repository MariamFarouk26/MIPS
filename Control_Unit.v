module Control_Unit
  ( input   wire   [1:0]         AlLUOP_AD,
    input   wire   [5:0]         FUNC,
    input   wire   [5:0]         OPCODE,
    output  wire   [1:0]         ALUOP_MD,
    output  wire                 MEMWRITE,
    output  wire                 REGWRITE,
    output  wire                 REGDEST,
    output  wire                 ALUSRC,
    output  wire                 MEMTOREG,
    output  wire                 BRANCH,
    output  wire                 JUMP,
    output  wire     [2:0]       ALU_CONTROL);
   
 wire  [1:0]  ALUOP_CONTROL  

MainDecoder  b1 
( 
 .Opcode(OPCODE), 
 .AluOP_MD(AlLUOP_MD),
 .memWrite(MEMWRITE),
 .regWrite(REGWRITE),
 .regDest(REGDEST),
 .aluSrc(ALUSRC),
 .memtoReg(MEMTOREG),
 .Branch(BRANCH),
 .jump(JUMP)
);


Alu_Decoder  b2  
(
 .AluOP_AD(AlLUOP_AD),
 .Func(FUNC),
 .Alu_Control(ALU_CONTROL)
);


endmodule


