module MIPS
  #(parameter width32=32 ,width5=5,width26=26)
  ( input   wire                        CLK,
    input   wire                        RST,
    output  wire   [(width32/2)-1:0]    TEST_VALUE
  );
  
  
 
  wire  [width32-1:0]    PCPLUS4;
  wire  [width32-1:0]    PC;
  wire  [width32-1:0]    PC_IN;
  wire  [width32-1:0]    PC_B; 
  wire  [width32-1:0]    instr;
  wire  [width32-1:0]    SCRA;
  wire  [width32-1:0]    SCRB;
  wire                   ZERO_FLAG;
  wire  [width32-1:0]    ALU_RESULT;
  wire  [width32-1:0]    SIGNLMM;
  wire  [width32-1:0]    WRITEDATA;
  wire  [width32-1:0]    READDATA;
  wire  [width32-1:0]    RESULT;
  wire  [width5-1:0]     WRITEREG;
  wire  [1:0]            ALUOP; 
  wire  [5:0]            FUNC;
  wire                   MEMWRITE;
  wire                   REGWRITE;
  wire                   REGDEST;
  wire                   ALUSRC;
  wire                   MEMTOREG;
  wire                   BRANCH;
  wire                   JUMP;
  wire  [2:0]            ALU_CONTROL;
  wire                   PCSCR;
  wire  [width32-1:0]    SIGNLMM_SHIFT;
  wire  [width32-1:0]    PCBRANCH;
  wire  [width26-1:0]    INSTR_SHIFT;
  
  
  
Data_Memory b1
(.WD(WRITEDATA),
 .A(ALU_RESULT),
.clk(CLK),
.rst(RST),
.WE(MEMWRITE),
.RD(READDATA),
.TestValue(TEST_VALUE)
 );
 
Instruction_Memory b2
(.A(PC),
 .RD(instr)
 );
 
Register_File b3
( .WD3(RESULT), 
  .A1(instr[25:21]),
  .A2(instr[20:16]),
  .A3(WRITEREG),
  .clk(CLK),
  .rst(RST),
  .WE3(REGWRITE),
  .RD1(SCRA),
  .RD2(WRITEDATA)   
 ); 
 
 Program_Counter b4
(.pc_in(PC_IN), 
 .clk(CLK),
 .rst(RST),
 .pc(PC)
  );
  
Adder  b5  //of program counter
 (.in1(PC),
  .in2(32'd4),
  .out_adder(PCPLUS4) 
 );
 

mux #(.width(width32)) b6  //between alu  and reg file
(.select(ALUSRC),  
 .in1(WRITEDATA),
 .in2(SIGNLMM), 
 .out_mux(SCRB)
);
  
mux #(.width(width32)) b7 //between alu  and data memory
(.select(MEMTOREG), 
 .in1(ALU_RESULT),
 .in2(READDATA), 
 .out_mux(RESULT)
);
  
  
mux #(.width(width5)) b8 //at reg file
(.select(REGDEST), 
 .in1(instr[20:16]),
 .in2(instr[15:11]), 
 .out_mux(WRITEREG)
);
  
 
 ALU b9
 (.ScrA(SCRA), 
  .ScrB(SCRB),
.Alu_Control(ALU_CONTROL),
.Zero_flag(ZERO_FLAG),
.Alu_Result(ALU_RESULT)
 );
 
 
 AND b10   
  (.in1(BRANCH),
  .in2(ZERO_FLAG),
  .out(PCSCR)
 );
 
shift_left_twice #(.width(width32)) b11 
(.in(SIGNLMM),
 .out_shift(SIGNLMM_SHIFT)
 );
 
Adder  b12  //of program counter and sig
(.in1(SIGNLMM_SHIFT),
.in2(PCPLUS4),
.out_adder(PCBRANCH)
 );
 
 
mux #(.width(width32)) b13 //at pc "2"
(.select(PCSCR),
 .in1(PCPLUS4),
 .in2(PCBRANCH), 
 .out_mux(PC_B)
);
 
shift_left_twice #(.width(width26)) b14
(.in(instr[25:0]),
 .out_shift(INSTR_SHIFT)
 );

mux #(.width(width32)) b15 //at pc "1"
(.select(JUMP),
 .in1(PC_B),
 .in2({PCPLUS4[31:28],2'b00,INSTR_SHIFT}), 
 .out_mux(PC_IN)
);

 
Alu_Decoder b16
(.AluOP_AD(ALUOP),
 .Func(instr[5:0]),
 .Alu_Control(ALU_CONTROL)
);



MainDecoder b17
(.Opcode(instr[31:26]), 
 .AluOP_MD(ALUOP),
 .memWrite(MEMWRITE),
 .regWrite(REGWRITE),
 .regDest(REGDEST),
 .aluSrc(ALUSRC),
 .memtoReg(MEMTOREG),
 .Branch(BRANCH),
 .jump(JUMP)
);
 
 

 sign_extend b18 
(.instr(instr[15:0]),
 .signlmm(SIGNLMM)
 );
 
endmodule
