`timescale 1ns/1ns



module sign_extend_8_to_16 (input [7:0] in , output [15:0] out );
  assign out = { in[7] , in[7] , in[7] , in[7] ,in[7] , in[7] , in[7] ,in[7] , in };
endmodule
  
module sign_extend_10_to_16 (input [9:0] in , output [15:0] out);
  assign out ={ in[9] , in[9] ,in[9] , in[9] , in[9] ,in[9] , in };
endmodule



