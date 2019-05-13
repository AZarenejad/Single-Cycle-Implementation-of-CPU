`timescale 1ns/1ns

                                                                
module test_controller();
  reg [3:0] opcode;
  reg [7:0] func ;
  wire [2:0] alu_operation ;
  wire ld_window , next_sel , R_sel , imm_sel ;
  wire mem_sel , alu_sel ;
  wire reg_write , branch , jump_sel ;
  wire memread , memwrite , ld_pc ;
  
  cu c (opcode ,func ,zero_flag , alu_operation , next_sel , ld_window , branch_sel , jump_sel ,
                  R_sel , imm_sel , mem_sel , alu_sel , reg_write , mem_read , mem_write);
  
  initial begin
    /*
    test alu_controller
    opcode = 4'b1100 ;
    #200;
    opcode = 4'b1101 ;
    #200 ;
    opcode = 4'b1110 ;
    #200 ;
    opcode = 4'b1111 ;
    #200 ;
    opcode = 4'b0100 ;
    #200;
    opcode = 4'b1000 ;
    func = 8'b1 ;
    #200 ;
    func = 8'b10 ;
    #200 ;
    func =8'b100 ;
    #200 ;
    func =8'b1000 ;
    #200 ;
    func=8'b10000 ;
    #200 ;
    func =8'b100000;
    #200 ;
    func = 8'b100000 ;
    #200 ;
    func = 8'b1000000 ;
    #200 ;
    func =8'b10000000 ;
    #200 ;
    opcode = 4'b1010 ;
    #200 ; */
    
    //test alu_sel and mem_sel and reg_write and branch and jump_sel and memread and memwrite and ld_window and next_sel and ld_pc
    // test R_sel and imm_sel
    opcode = 4'b0000;
    #100 ;
    opcode = 4'b0001 ;
    #100 ;
    opcode = 4'b0010 ;
    #100 ;
    opcode = 4'b0100 ;
    #100 ;
    opcode = 4'b1100 ;
    #100 ;
    opcode = 4'b1101 ;
    #100 ;
    opcode = 4'b1110 ;
    #100 ;
    opcode = 4'b1111 ;
    #100 ;
    opcode =4'b1000;
    func=8'b0;
    #100 ;
    func=8'b10000000;
    #100 ;
    func=8'b01000000 ;
    #100 ;
    $stop;
  end
endmodule


