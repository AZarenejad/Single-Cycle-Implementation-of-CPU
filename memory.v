`timescale 1ns/1ns

module memory(clk , pc_adr ,data_adr , instruction , data_mem_out , write_data ,mem_read ,mem_write);
  input clk ;
  input [9:0] pc_adr ,data_adr ;
  input [15:0] write_data ;
  input mem_read ,mem_write ;
  output [15:0] instruction , data_mem_out ;
  
  
  reg [15:0] mem [1023:0];
  initial begin
    //Code
mem[0] = 16'b1100010100010001;
mem[1] = 16'b0001010111110100;
mem[2] = 16'b0000000111110100;
mem[3] = 16'b1000000000000010;
mem[4] = 16'b0001000111111110;
mem[5] = 16'b0010110000000111;
mem[6] = 16'b0000000111110100;
mem[7] = 16'b1100101000010001;
mem[8] = 16'b0100100100001010;
mem[9] = 16'b1100000000000100;
mem[10] = 16'b1000110000000010;
mem[11] = 16'b1000011110000001;
mem[12] = 16'b1100010100000011;
mem[13] = 16'b1100101000010100;
mem[14] = 16'b1101101000001101;
mem[15] = 16'b1000011000001000;
mem[16] = 16'b1000100100000100;
mem[17] = 16'b1101010100000010;
mem[18] = 16'b1110010100010010;
mem[19] = 16'b1111010100011000;
mem[20] = 16'b0001010111110100;
mem[21] = 16'b1000110100000010;
mem[22] = 16'b1000100110000010;
mem[23] = 16'b1000100100000001;
mem[24] = 16'b1000101110000011;
mem[25] = 16'b1000110000000010;
    //Numbers in Array
    mem[500] = 16'd1;
    mem[501] = 16'd2;
    mem[502] = 16'd3;
    mem[503] = 16'd4;
    mem[504] = 16'd5;
    mem[505] = 16'd6;
    mem[506] = 16'd7;
    mem[507] = 16'd8;
    mem[508] = 16'd9;
    mem[509] = 16'd10;
  end
  

  assign instruction = mem[pc_adr] ;
  assign data_mem_out = mem_read ? mem[data_adr] : 16'bz ;
  
  always @(mem_write)begin
    mem[data_adr] <= mem[data_adr] ;
    if ( mem_write )
       mem[data_adr] <= write_data ;
  end
      
    
    
  
  /*always @( posedge clk) begin
    if (mem_write)
      mem[data_adr] <= write_data ;
  end*/
  
endmodule