/*
This module oversees the synchronous of the system,
it sends signal (sync) that change every clock enable. 
Each time sync is changing different registers are executing.
This helps control the data and synchronize the whole system.
*/
module synchronous
(
input          clk, clk_en,    // clock input 
input          reset,start,//start_sys,  // synchronous reset 
output         sync     // output synchronous 
);

reg  r_sync;
reg [1:0] cntr;

always @(posedge clk) 
 if(reset)
  cntr <= 2'b01;
 else 
 if(clk_en)
  begin
 if(start)
  begin
    cntr <= cntr + 1;
	if (cntr == 2'b11)
	   cntr <= 2'b00;
   end
end

always @(posedge clk)
begin
  if(reset)
    r_sync <= 1'b0;
  else 
  if(clk_en)
  begin
   if(start)
	 r_sync <= cntr[0];
  end
end

assign sync = r_sync;

endmodule