/*
 This module generates pulse every 2 clock cycles, basiclly generates clock with lower frequency.
*/
module clk_en
(
     input  clk,                   //internal 100MHz clock
     input  reset,                 // active high synchronous reset
     input  start,           // when high - you can start encrypting 
     output   clk_en         // clk_en to lower the frequency
);

reg [2:0] counter;
reg reg_clk;


//counter - count and reseting every 2 clock cycles
always@(posedge clk)
if(reset)
begin
 counter <= 3'd0;
 reg_clk <= 0;
end
else 
if (start)
begin
   counter <= counter + 1;
   if(counter == 3'd3)
   begin
      reg_clk <= 1'd1;
	  counter <= 3'd0;
   end
   else
      reg_clk <= 1'd0;
end

assign clk_en = reg_clk;

endmodule