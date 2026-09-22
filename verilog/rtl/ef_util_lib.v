`default_nettype none
/*
 * CF_SPI v2.0.1 still instantiates the pre-rename eFabless cells
 * (ef_util_*). UART / I2C / TMR32 already use cf_util_* from CF_IP_UTIL.
 * Wrap every cf_util_* cell so synthesis does not die one name at a time.
 */
module ef_util_sync #(parameter NUM_STAGES = 2) (
    input  wire clk,
    input  wire in,
    output wire out
);
    cf_util_sync #(.NUM_STAGES(NUM_STAGES)) u_i (
        .clk(clk),
        .in(in),
        .out(out)
    );
endmodule

module ef_util_ped (
    input  wire clk,
    input  wire in,
    output wire out
);
    cf_util_ped u_i (
        .clk(clk),
        .in(in),
        .out(out)
    );
endmodule

module ef_util_ned (
    input  wire clk,
    input  wire in,
    output wire out
);
    cf_util_ned u_i (
        .clk(clk),
        .in(in),
        .out(out)
    );
endmodule

module ef_util_ticker #(parameter W = 8) (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         en,
    input  wire [W-1:0] clk_div,
    output wire         tick
);
    cf_util_ticker #(.W(W)) u_i (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clk_div(clk_div),
        .tick(tick)
    );
endmodule

module ef_util_glitch_filter #(parameter N = 8, CLKDIV = 8'd1) (
    input  wire clk,
    input  wire rst_n,
    input  wire in,
    input  wire en,
    output wire out
);
    cf_util_glitch_filter #(.N(N), .CLKDIV(CLKDIV)) u_i (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .en(en),
        .out(out)
    );
endmodule

module ef_util_fifo #(parameter DW = 8, AW = 4) (
    input  wire          clk,
    input  wire          rst_n,
    input  wire          rd,
    input  wire          wr,
    input  wire          flush,
    input  wire [DW-1:0] wdata,
    output wire          empty,
    output wire          full,
    output wire [DW-1:0] rdata,
    output wire [AW-1:0] level
);
    cf_util_fifo #(.DW(DW), .AW(AW)) u_i (
        .clk(clk),
        .rst_n(rst_n),
        .rd(rd),
        .wr(wr),
        .flush(flush),
        .wdata(wdata),
        .empty(empty),
        .full(full),
        .rdata(rdata),
        .level(level)
    );
endmodule

module ef_util_clkmux_2x1 (
    input  wire rst_n,
    input  wire clk0,
    input  wire clk1,
    input  wire sel,
    output wire clko
);
    cf_util_clkmux_2x1 u_i (
        .rst_n(rst_n),
        .clk0(clk0),
        .clk1(clk1),
        .sel(sel),
        .clko(clko)
    );
endmodule

module ef_util_clkmux_4x1 (
    input  wire       rst_n,
    input  wire       clk0,
    input  wire       clk1,
    input  wire       clk2,
    input  wire       clk3,
    input  wire [1:0] sel,
    output wire       clko
);
    cf_util_clkmux_4x1 u_i (
        .rst_n(rst_n),
        .clk0(clk0),
        .clk1(clk1),
        .clk2(clk2),
        .clk3(clk3),
        .sel(sel),
        .clko(clko)
    );
endmodule

module ef_util_gating_cell (
`ifdef USE_POWER_PINS
    input  wire vpwr,
    input  wire vgnd,
`endif
    input  wire clk,
    input  wire rst_n,
    input  wire clk_en,
    output wire clk_o
);
    cf_util_gating_cell u_i (
`ifdef USE_POWER_PINS
        .vpwr(vpwr),
        .vgnd(vgnd),
`endif
        .clk(clk),
        .rst_n(rst_n),
        .clk_en(clk_en),
        .clk_o(clk_o)
    );
endmodule
`default_nettype wire
