`timescale 1ns/1ns
module test_alu();
  
reg [2:0] alu_operation ;
reg [15:0] in1 , in2 ;
wire [15:0] result;
wire zero_flag ;
  
  
alu c(alu_operation , in1 , in2 , result ,zero_flag);
  
  initial begin
    in1=16'd10;
    in2=16'd6;
    alu_operation = 3'b000;   //move  result=6
    #100 ;
    alu_operation = 3'b001 ;  //add  result = 16
    #100 ;
    alu_operation = 3'b010;  //sub  result = 4
    #100 ;
    alu_operation = 3'b011;  //and  result = ??
    #100 ;
    alu_operation = 3'b101 ;  //not  result = ??
    #100 ;
    alu_operation = 3'b110 ;  //nop result = 10
    #100 ;
    in2=16'd10 ;
    alu_operation = 3'b010 ;  //sub  result = 0   zero_flag=1
    #100 ;
  end
endmodule
  

