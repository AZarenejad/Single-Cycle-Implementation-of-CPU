`timescale 1ns / 1ps
 
module register_file( input clk , rst , reg_write ,
                      input [1:0] window , Ri , Rj ,
                      input [15:0] write_data ,
                      output [15:0] read_data1 , read_data2);
 
                     
  reg [15 : 0] R0, R1, R2, R3, R4, R5, R6, R7;
  wire [15 : 0] o0, o1, o2, o3 ;
	
	assign o0 = (window == 2'b00) ? R0 : (window  == 2'b01) ? R2 : (window  == 2'b10) ? R4
              : (window  == 2'b11) ? R6 : 16'bz ;
  assign o1 = (window  == 2'b00) ? R1 : (window  == 2'b01) ? R3 : (window  == 2'b10) ? R5 
              : (window  == 2'b11) ? R7 : 16'bz ;
  assign o2 = (window  == 2'b00) ? R2 : (window  == 2'b01) ? R4 : (window  == 2'b10) ? R6 
              : (window  == 2'b11) ? R0 : 16'bz ;
  assign o3 = (window  == 2'b00) ? R3 : (window  == 2'b01) ? R5 : (window  == 2'b10) ? R7 
              : (window  == 2'b11) ? R1 : 16'bz ;
	assign read_data1 = (Ri == 2'b00) ? o0 : (Ri == 2'b01) ? o1 : (Ri == 2'b10) ? o2 : (Ri == 2'b11 ) ? o3 : 16'bz ;
	assign read_data2 = (Rj == 2'b00) ? o0 : (Rj == 2'b01) ? o1 : (Rj == 2'b10) ? o2 : (Rj == 2'b11 ) ? o3 : 16'bz ;
	
	always @(posedge clk) begin
	  if (rst)begin
	    R0 <= 16'b0 ;
	    R1 <= 16'b0 ;
	    R2 <= 16'b0 ;
	    R3 <= 16'b0 ;
	    R4 <= 16'b0 ;
	    R5 <= 16'b0 ;
	    R6 <= 16'b0 ;
	    R7 <= 16'b0 ;
	  end
	    
	  else if(reg_write)begin
	    R0 <= ((window == 2'b00 & Ri == 2'b00 ) | ( window == 2'b11 & Ri == 2'b10 ) )? write_data : R0;
	    R1 <= ((window == 2'b00 & Ri == 2'b01 ) | (window == 2'b11 & Ri == 2'b11 ) ) ? write_data : R1 ;
	    R2 <= ( (window == 2'b00 & Ri == 2'b10 ) | ( window == 2'b01 & Ri == 2'b00 ) ) ? write_data : R2 ;
	    R3 <= ( (window == 2'b00 & Ri == 2'b11 ) | ( window == 2'b01 & Ri == 2'b01 ) ) ? write_data : R3 ;
	    R4 <= ( (window == 2'b01 & Ri == 2'b10 ) | ( window == 2'b10 & Ri == 2'b00 ) ) ? write_data : R4 ;
	    R5 <= ((window == 2'b01 & Ri == 2'b11 ) | ( window == 2'b10 & Ri == 2'b01 ) )? write_data : R5 ;
	    R6 <= ( (window == 2'b10 & Ri == 2'b10 ) | (window == 2'b11 & Ri == 2'b00 ) ) ? write_data : R6 ;
	    R7 <= ( (window == 2'b10 & Ri == 2'b11 ) | (window == 2'b11 & Ri == 2'b01 ) )? write_data : R7 ;
   end	   
 end              
endmodule