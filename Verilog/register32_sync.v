/*
 This module is one type of our registers.
 It trasfers his input when sync is high and store it when 
 sync is low.
 */
module register32_sync
(
input  [31:0] data_in, // Data input 
input          clk, clk_en,    // clock input 
input          reset,start,  // synchronous reset 
input          sync,    // synchronous 
output [31:0] data_out // output Q 
);

reg [31:0] Q;

// Design Hierarchy
//synchronous Sync( clk, reset,start, sync );

always @(posedge clk) 
begin
 if(reset)
  Q <= 32'h00000000; 
 else 
 if(clk_en)
 begin
 if(start)
 begin
 if(sync)
  Q <= data_in; 
  end
 end
end 

assign data_out = Q;

endmodule