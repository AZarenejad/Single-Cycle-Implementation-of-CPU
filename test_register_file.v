`timescale 1ns/1ns
module test_register_file();
  
  
  reg [1:0] window ,Ri ,Rj ;
  reg [15:0] writedata ;
  wire [15:0] read_data1 , read_data2 ;
  reg clk , reg_write , rst ;
  always #100 clk = ~clk;

  register_file c(clk , rst , reg_write , window , Ri , Rj ,writedata ,read_data1 , read_data2);
  
  

  
  initial begin
    clk=0;
    reg_write =0 ;
    rst =0 ;
    #100;
    rst =1 ;
    #100 ;
    rst =0 ;
    
    
    //R2=10 ;
    reg_write=0 ;
    writedata = 16'd10;
    window = 2'd0 ;
    Ri = 2'd2 ; 
    Rj = 2'd1 ;    //readdata1=10    readdata2=0
    reg_write= 1; 
    #500;
  
    reg_write=0;
    #500 ;
    
    writedata = 16'd5;
    reg_write=1 ;
    window = 2'd1 ;
    Ri = 2'd3 ;   //R5=5  R2=10
    Rj = 2'd0 ;  //readdata1=5  //readdata2=10
    #500;
    
    reg_write=0;
    #500 ;
    
    writedata = 16'd8 ;
    window = 2'd2 ;
    Ri=2'd2 ;   //R6=8  R5=5
    Rj=2'd1 ;    //readdata1=8   readdata2=5
    reg_write=1 ;
    #500 ;
    
    
    reg_write=0;
    #500 ;
    
    writedata = 16'd4 ;
    window = 2'd3;
    Ri=2'd2 ;   //R6=8  R0=4
    Rj=2'd0 ;  //readdata1=4   readdata2=6
    reg_write=1;
    #500 ;

   reg_write=0;
    #500 ;
    
    writedata = 16'd6 ;
    window = 2'd0;
    Ri=2'd0 ;   //R0=4  R2=10   6 not write in R0
    Rj=2'd2 ;    //readdata1=4   readdata2=10
    reg_write =1 ;
    #500;
    
    reg_write=0;
    #500 ;
    $stop;

      
  end
  
endmodule
  


