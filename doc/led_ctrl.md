# led_ctrl

## module diagram

![led_ctrl_module](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/led_ctrl_module.png)

## signals

|      name      | width(bit) |   type   |                         description                          |
| :------------: | :--------: | :------: | :----------------------------------------------------------: |
|    sys_clk     |     1      |  input   |                   system clock with 50Mhz                    |
|   sys_rst_n    |     1      |  input   |                         reset button                         |
|   repeat_en    |     1      |  input   |                    detect the repeat code                    |
|      led       |     1      |  output  |                     "0" dark; "1" light                      |
| repeat_en_dly  |     1      | internal |              delay repeat_en with 1 clock cycle              |
| repeat_en_rise |     1      | internal |               detect rising edge of repeat_en                |
|     cnt_en     |     1      | internal |           control when cnt signal begins to count            |
|      cnt       |     22     | internal | count from 0 ~ 2500000. When cnt_en = 1, then count. When cnt_en = 0, then cnt = 0. |

## waveform

![led_ctrl_waveform1](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/led_ctrl_waveform1.png)

![led_ctrl_waveform2](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/led_ctrl_waveform2.png)

![led_ctrl_waveform3](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/led_ctrl_waveform3.png)
