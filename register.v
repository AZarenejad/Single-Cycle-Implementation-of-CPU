`timescale 1ns/1ns

module pc_register(input clk , rst, input [9:0] in ,output reg [9:0] out);
  always @ (posedge clk) begin
    if(rst)
      out <= 10'b0 ;
    else
     out <= in ;
  end
endmodule
      
      
module window_register( input clk , rst , ld ,input [1:0] in , output reg [1:0] out);
  always @ (posedge clk) begin
    if(rst)
      out <= 2'b0 ;
    else if (ld)
      out <= in ;
    else
     out <= out ;
  end
endmodule
      

