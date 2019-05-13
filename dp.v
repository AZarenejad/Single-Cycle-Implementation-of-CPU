`timescale 1ns/1ns

module dp( input clk , rst ,
  input next_sel , jump_sel ,branch_sel , ld_window , R_sel , imm_sel , mem_sel ,
  input mem_read , mem_write , alu_sel , reg_write ,
  input [2:0] alu_operation , output[3:0] opcode , output [7:0] func , output zero_flag);
  
 

  wire [9:0] pc_out , pc_in ;
  wire [9:0] cnt_out_pc , jump_out_pc , branch_out_pc ;
  wire [9:0] data_address ;
  wire [15:0] imm_data ;
  wire [15:0] data_mem_out ;
  wire [15:0] read_data1 , read_data2;
  wire [15:0] in1_alu , in2_alu , data_in_register_file ;
  wire [15:0] alu_result ;
  wire [15:0]  instruction ;
  wire [1:0] window ;
  

  assign branch_out_pc = {2'b0 ,instruction[7:0]} ;
  assign jump_out_pc = instruction[9:0] ;
  assign  cnt_out_pc = pc_out + 1 ;
  
  assign opcode = instruction[15:12] ;
  assign func = instruction[7:0] ;
  
  assign data_address = instruction[9:0] ;
  
  sign_extend_8_to_16 imm_sign_extend ( instruction[7:0] , imm_data ) ;
  
  
  pc_register pc_reg(clk , rst , pc_in , pc_out );
  window_register window_reg( clk , rst , ld_window , instruction[1:0] , window );
  
  
  alu alu(alu_operation , in1_alu , in2_alu , alu_result ,zero_flag);
  

  memory memory(clk , pc_out , data_address  , instruction , data_mem_out , read_data1 , mem_read , mem_write) ;
  
  multiplexer_2  mux1 ( R_sel , imm_sel , read_data1 , read_data2 , in1_alu );
  multiplexer_2  mux2( R_sel , imm_sel , read_data2 , imm_data , in2_alu ); 
  multiplexer_2 mux3 ( mem_sel ,alu_sel , data_mem_out , alu_result ,  data_in_register_file ) ; 
  multiplexer_3 pc_mux( cnt_out_pc ,jump_out_pc , branch_out_pc , next_sel , jump_sel ,branch_sel , pc_in);
  
  
  register_file register_file(clk, rst, reg_write, window, instruction[11:10], instruction[9:8], 
                              data_in_register_file, read_data1, read_data2);

endmodule