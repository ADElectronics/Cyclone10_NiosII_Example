module debouncer 
(
	input wire	in,
	input wire 	clock,
	output reg 	out
);

reg [7:0] shiftreg;

initial begin
	shiftreg=8'hFF;
	out=1'b0;
end

always @ (posedge clock) 
begin
	shiftreg[7:0] <= {shiftreg[6:0], in};
	if (shiftreg[7:0] == 8'b00000000) 
	begin
		out <= 1'b1;
	end 
	else if (shiftreg[7:0] == 8'b11111111) 
	begin
		out <= 1'b0;
	end 
	else 
	begin
		out <= out;
	end
end

endmodule
