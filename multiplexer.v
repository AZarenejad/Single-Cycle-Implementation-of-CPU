`timescale 1ns/1ns


module multiplexer_3( input[9:0] in1 , in2 , in3 , input sel1 , sel2 , sel3 , output [9:0] out);
  assign out = sel1? in1:
              sel2 ? in2 : 
              sel3 ? in3 : 16'bz ;
endmodule
  
  
module multiplexer_2 ( input sel1 , sel2 , input [15:0] in1 ,in2 ,output [15:0] out );
  assign out =  sel1 ?  in1 :
                sel2 ? in2 :
                16'bz ;
endmodule



