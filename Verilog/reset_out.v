/* 
I made tests and I found out that if I want that a signal will pass through
the jumper wires and the Raspberry Pi 3 will notice them,
they should be stable for relatively long time.
At this module we send this kind of signal when RESET button is pressed,
send a stable signal and ignore bouncing
 */


module reset_out (
input clk,				// internal 100MHz clock
input reset,			// active high synchronous reset
output level_fall_reset	// stable pulse of RESET
);





reg [12:0] cntr_fall; // large counter for sufficient time

always @(posedge clk) begin

	if (reset == 1'b1)
		cntr_fall <= 0;
	else if(cntr_fall < 13'h1fff)
		cntr_fall <= cntr_fall + 1;

end

assign level_fall_reset = (cntr_fall != 13'h1fff) ? 1'b1 : 1'b0; // High till the counter achieves is Max value.

endmodule