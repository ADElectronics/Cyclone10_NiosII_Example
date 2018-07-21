module C10LP_TOP
(
	// Тактирование
	input SYS_CLK50M,
	
	// Пользовательское управление
	input [3:0] USER_PB,
	output [3:0] USER_LED
);

wire reset;

//assign USER_LED = USER_PB;

debouncer db
(
	.in(USER_PB[0]),
	.clock(SYS_CLK50M),
	.out(reset)
);

nios2 nios
(
	.clk_clk(SYS_CLK50M),
	.reset_reset_n(!reset),
	.gpio_export(USER_LED)
);

endmodule
