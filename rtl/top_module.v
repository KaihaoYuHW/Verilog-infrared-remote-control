module top_module (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire infrared_in,
    output wire [5:0] sel,
    output wire [7:0] seg,
    output wire led
);

    wire repeat_en;
    wire [19:0] data;
    
    infrared_rcv infrared_rcv_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .infrared_in(infrared_in),
        .repeat_en(repeat_en),
        .data(data)
    );

    led_ctrl led_ctrl_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .repeat_en(repeat_en),
        .led(led)
    );

    seg_dynamic seg_dynamic_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .data(data),
        .point(6'd0),
        .seg_en(1'b1),
        .sign(1'b0),
        .sel(sel),
        .seg(seg)
    );
    
endmodule