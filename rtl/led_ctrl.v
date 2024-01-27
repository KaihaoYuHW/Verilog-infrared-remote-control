module led_ctrl (
    input wire repeat_en,
    input wire sys_clk,
    input wire sys_rst_n,
    output reg led
);

    parameter CNT_MAX = 250_0000;   // 50ms count from 0~250_0000

    reg repeat_en_dly;
    wire repeat_en_rise;
    reg cnt_en;
    reg [21:0] cnt;

    // repeat_en_dly: repeat_en 1 clk cycle delay
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            repeat_en_dly <= 1'b0;
        else 
            repeat_en_dly <= repeat_en;
    end

    // repeat_en_rise: flag signal, detect the posedge of repeat_en 
    assign repeat_en_rise = (repeat_en_dly == 1'b0 && repeat_en == 1'b1) ? 1'b1 : 1'b0;

    // cnt_en
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt_en <= 1'b0;
        else if (repeat_en_rise == 1'b1)
            cnt_en <= 1'b1;
        else if (cnt == CNT_MAX - 1'b1)
            cnt_en <= 1'b0;
    end

    // cnt
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt <= 22'd0;
        else if (cnt_en == 1'b1)
            cnt <= cnt + 1'b1;
        else 
            cnt <= 22'd0;
    end

    // led
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            led <= 1'b0;
        else if (cnt > 22'd0)
            led <= 1'b1;
        else 
            led <= 1'b0;
    end
    
endmodule