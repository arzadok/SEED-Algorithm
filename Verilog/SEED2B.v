/* 

At this module when the SEED is ready - 16 registers are loaded with the 16 bytes of the SEED 
and each clock enable the information continue to next register till all the bits had been transmitted. 

according to our experiments, the optimal pulse for the Raspberry Pi 3 load signal is 20ms, 
less than this it won't notice the pulse 

 */

module SEED2B(
    input clk,				// internal 100MHz clock
	input reset, 			// active high synchronous reset
	input start1,			// when high it means that now was the first block
	input in_en,			// High when there are blocks to send for encryption
	input [127:0] SEED,		// SEEDed message to transmit
	input out_en,			// when High start transmitting
	output [7:0] part_SEED,	// 8 bits of the 256 bits SEEDed message
	output reg load_rpi3, done	// High when needs to inform Rpi 3 to read the pins of 8 bits of SEEDed message
	);
	
reg [21:0] cnt22bit;	// counts the time load_rpi3 is high and low

wire clk_en;			// proceeding the SEEDed message on the 16 registers

reg level_out_en;		// High when the SEEDed message is ready.

reg start;
reg r3;
wire pulse_start;
always @(posedge clk) begin 
	if ( reset == 1'b1) 
		start <= 0;
	else if(in_en ==1'b1)
		start <= start1;

end

always @(posedge clk) begin 
	if ( reset == 1'b1) 
		r3 <= 0;
	else if(in_en ==1'b1)
		r3 <= start;

end

assign pulse_start = start & !r3;

//////////////////////////////////////////////////
// declaration of 16 registers of SEED message
reg [7:0] SEED_div0;
reg [7:0] SEED_div1;
reg [7:0] SEED_div2;
reg [7:0] SEED_div3;
reg [7:0] SEED_div4;
reg [7:0] SEED_div5;
reg [7:0] SEED_div6;
reg [7:0] SEED_div7;
reg [7:0] SEED_div8;
reg [7:0] SEED_div9;
reg [7:0] SEED_div10;
reg [7:0] SEED_div11;
reg [7:0] SEED_div12;
reg [7:0] SEED_div13;
reg [7:0] SEED_div14;
reg [7:0] SEED_div15;


// to facilitate writing the SEEDed message will be on two-dimensional array  16*8
wire [7:0] arr_SEED [0:15];


reg [6:0] cnt_h; // counts 32 pulses of clk_en

wire finish_transmitting;


// a small FSM to control the sending information process
parameter SIZE = 2;
parameter idle  = 2'b01,send_bytes = 2'b10;

//-------------Internal Variables---------------------------
reg   [SIZE-1:0]          state        ;// Seq part of the FSM
reg   [SIZE-1:0]          next_state   ;// combo part of FSM

always @ (*)
begin : FSM_COMBO_SEND
	next_state = 2'b00;
	case(state)
	
////////////////////////////////////////////////////////////////////////
	
		idle :  
		
		if (out_en == 1'b1)
			next_state = send_bytes;
		else
			next_state = idle;
			
////////////////////////////////////////////////////////////////////////	
 
		send_bytes : 
		
		if (finish_transmitting == 1'b0) 
			next_state = send_bytes;
		else 
			next_state = idle;
			
////////////////////////////////////////////////////////////////////////
				  
		default : next_state = idle;
		
	endcase
end



always @ (posedge clk)
begin : FSM_SEQ_SEND
  if (reset == 1'b1 || pulse_start == 1'b1) begin
    state <=  idle;
  end else begin
    state <=  next_state;
  end
end


// wiring the SEEDed message in two - dimensional array
genvar i;

for (i = 0; i < 16; i = i + 1) 
	assign arr_SEED[i] = SEED[127-8*i: 120 - 8*i];

	
// logic that generates a 22 bits counter, starting when the SEED is ready
always @ (posedge clk) begin

	if(reset == 1'b1 || pulse_start == 1'b1)
		cnt22bit <= 0;
	else if(level_out_en == 1'b1 && state == send_bytes)
		cnt22bit <= cnt22bit + 1;
end


//logic that generates a pulse when new 8 bits should load to the pins of Basys 3 (load_rpi3 will be high also)
assign clk_en = (cnt22bit == 22'h3fffff && cnt_h != 128/8) ? 1'b1 : 1'b0; 





// logic that creates a delayed pulse when the SEED is ready (one clock after it's ready)
reg r1;
wire r2;


always @ (posedge clk) begin
	if(reset == 1'b1 || pulse_start == 1'b1)
		r1 <= 1'b0;
	else
		r1 <= level_out_en ;
end

assign r2 = level_out_en  & !r1; // r2 will be High for one clock just after one clock the SEED is ready.


always @ (posedge clk) begin

 
	if (reset == 1'b1 || pulse_start == 1'b1) begin	// reset the 32 registers

		SEED_div0 	<= 8'h00;
		SEED_div1 	<= 8'h00;
		SEED_div2 	<= 8'h00;
		SEED_div3 	<= 8'h00;
		SEED_div4 	<= 8'h00;
		SEED_div5 	<= 8'h00;
		SEED_div6 	<= 8'h00;
		SEED_div7 	<= 8'h00;
		SEED_div8 	<= 8'h00;
		SEED_div9 	<= 8'h00;
		SEED_div10 	<= 8'h00;
		SEED_div11 	<= 8'h00;
		SEED_div12 	<= 8'h00;
		SEED_div13 	<= 8'h00;
		SEED_div14 	<= 8'h00;
		SEED_div15 	<= 8'h00;
		


	end		
	else if(out_en == 1'b1 || r2 == 1'b1)	begin	// initialize them with the SEED
	
		SEED_div0 	<= 	arr_SEED[0];
		SEED_div1 	<=  arr_SEED[1];
		SEED_div2 	<=  arr_SEED[2];
		SEED_div3 	<=  arr_SEED[3];
		SEED_div4 	<=  arr_SEED[4];
		SEED_div5 	<=  arr_SEED[5];
		SEED_div6 	<=  arr_SEED[6];
		SEED_div7 	<=  arr_SEED[7];
		SEED_div8 	<=  arr_SEED[8];
		SEED_div9 	<=  arr_SEED[9];
		SEED_div10 	<=  arr_SEED[10];
		SEED_div11 	<=  arr_SEED[11];
		SEED_div12 	<=  arr_SEED[12];
		SEED_div13 	<=  arr_SEED[13];
		SEED_div14 	<=  arr_SEED[14];
		SEED_div15 	<=  arr_SEED[15];


	end			
	else if(clk_en == 1'b1 && state == send_bytes && (cnt_h < 128/8 -1)) 	begin	// move content to next reg when clk_en has pulse
	
		SEED_div0 	<=  SEED_div1;
		SEED_div1 	<=  SEED_div2;
		SEED_div2 	<=  SEED_div3;
		SEED_div3 	<=  SEED_div4;
		SEED_div4 	<=  SEED_div5;
		SEED_div5 	<=  SEED_div6;
		SEED_div6 	<=  SEED_div7;
		SEED_div7 	<=  SEED_div8;
		SEED_div8 	<=  SEED_div9;
		SEED_div9 	<=  SEED_div10;
		SEED_div10 	<=  SEED_div11;
		SEED_div11 	<=  SEED_div12;
		SEED_div12 	<=  SEED_div13;
		SEED_div13 	<=  SEED_div14;
		SEED_div14 	<=  SEED_div15;
	end

		
end
		
		
assign part_SEED = SEED_div0;	// the 8 bits that need to be transmitted are always on the last register.	
		
	
// logic that generates a pulse when the data is ready to be transmitted with 50% duty cycle.

always @ (posedge clk) begin

	if(reset == 1'b1 || pulse_start == 1'b1)
		load_rpi3 <= 0;
	else if(cnt22bit <= 22'h1fffff && state == send_bytes) //change
		load_rpi3 <= 1'b1;
	else
		load_rpi3 <= 1'b0;
end

/////////////////////////////////////////////////////////// 

// logic that counts 32 bytes of SEED
always @ (posedge clk) begin

	if(reset == 1'b1 || pulse_start == 1'b1)
		cnt_h <= 0;
	else if(clk_en == 1'b1 && state == send_bytes)
		cnt_h <= cnt_h + 1;
end	

// a flag that inform the FSM that all the data had been transmitted
assign finish_transmitting = (cnt22bit == 22'h3fffff && cnt_h == 128/8 - 1 ) ? 1'b1 : 1'b0; 



/////////////////////////////////////////////////////////////////

always @ (posedge clk) begin
	if(reset == 1'b1 || pulse_start == 1'b1)
		level_out_en <= 1'b0;
	else
		level_out_en <= out_en | level_out_en;
end


always @(posedge clk)
if(reset)
  done <= 0;
else
if(out_en)
   done <= 1'b1;


endmodule
