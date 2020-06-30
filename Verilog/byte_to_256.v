/* 
This module receives 32 times 8 bits from input pins and concatenate it to 
256 block to do encryption.

when it finishes receiving, transmit a pulse (done) that confirm that the block is ready to encrypt
 */

module byte_to_256(
	input  reset,			// active high synchronous reset
	input  in_en,			// High when there are more blocks to send for encryption
	input  clk,				// internal 100MHz clock
	input  start1,						// when high it means that now was the first block
	input  [7:0] part_msg1,	// 8 bits as part of a block
	input  load1,			// when high- new 8 bits had been loaded to pins
	output [127:0] plaintext,key,//concatenated 32 - 8 bits
	output done		     	// pulse when all 32 bytes of block arrived
	);
	
reg [4:0] adrs;
reg [4:0] adrs1;

reg [255:0] tmp_msg;
reg [255:0] reg_msg;
reg reg_done;

reg tc;
wire load_en, load_msg;
reg r1, r2, r3 ,r4;

wire done_en;

reg [7:0] part_msg;
reg load;


reg start;
reg r5;
wire pulse_start;
always @(posedge clk) begin 
	if ( reset == 1'b1) 
		start <= 0;
	else if(in_en ==1'b1)
		start <= start1;

end

always @(posedge clk) begin 
	if ( reset == 1'b1) 
		r5 <= 0;
	else if(in_en ==1'b1)
		r5 <= start;

end

assign pulse_start = start & !r5;

/* 
Because the Raspberry Pi 3 pulses are not exact with their length and not reliable,
we made logic that detects positive edges and do an internal - clock width - pulse and reliable.

 */

	
always @(posedge clk) begin // logic that avoids Z state on  inputs.
	if ( reset == 1'b1 || pulse_start == 1'b1)
		load <= 0;
	else if(in_en == 1'b1)
		load <= load1;
end	
	
always @(posedge clk) begin // logic that does a copy of load delayed one and 2 cycles
	if ( reset == 1'b1 || pulse_start == 1'b1) begin
		r3 <= 1'b0;
		r4 <= 1'b0;
	end
	else if(in_en == 1'b1) begin
		r3 <= load;
		r4 <= r3;
	end
end
	
assign load_en = load & !r3; // pulse of load

always @(posedge clk) begin  // load registers when the pins are loaded with the information.
	if ( reset == 1'b1 || pulse_start == 1'b1)
		part_msg <= 0;
	else if(load_en == 1'b1)
		part_msg <= part_msg1;
end


assign load_msg = r3 & !r4; // delayed pulse of load

always @ (posedge clk) begin

	if (reset == 1'b1 || pulse_start == 1'b1) begin // logic that concatenates 32 - 8 bits to a 32 bytes block array
		adrs <= 6'h00;
		tmp_msg <= {255{1'b0}};
	end
	else if (load_msg == 1'b1) begin
		tmp_msg[248 - 8*adrs+:8] <= part_msg;
		adrs <= adrs +1; 					// each new 8 bits the address proceed in one 
	end
end	

	
always @(posedge clk) begin	// logic that send the new block when the whole block arrived
	if (reset == 1'b1 || pulse_start == 1'b1)
		reg_msg <= {255{1'b0}};
	else if(done_en ==1'b1)
		reg_msg <= tmp_msg;	
	end
	
// below there is a logic that sends the done signal a clock delayed after it enters to registers 
always @(posedge clk) begin
	if (reset == 1'b1 || pulse_start == 1'b1)
		adrs1 <= 5'h00;
	else if(load_en == 1'b1)
			adrs1 <= adrs;
end
	
always @(*) begin
	if (adrs1 == 5'b11111)
		tc = 1'b1;
	else
		tc = 1'b0;
end	
	
always @(posedge clk) begin 
	if (reset == 1'b1 || pulse_start == 1'b1) begin
		r1 <= 1'b0;
		r2 <= 1'b0;
	end
	else begin
		r1 <=tc;
		r2<=r1;
	end
end

	
assign done_en = r1 && !r2;



always @ (posedge clk) // sends done signal to other blocks
begin
	if(reset == 1'b1 || pulse_start == 1'b1)
		reg_done <= 1'b0;
	else begin
		reg_done <= done_en;
	end
end

assign done = reg_done;
assign key  = reg_msg[127:0]; //128'h28DBC3BC49FFD87DCFA509B11D422BE7;//4706480851E61BE85D74BFB3FD956185; //
assign plaintext  = reg_msg[255:128]; //128'hB41E6BE2EBA84A148E2EED84593C5EC7;//83A2F8A288641FB9A4E9A5CC2F131C7D; //


endmodule 


