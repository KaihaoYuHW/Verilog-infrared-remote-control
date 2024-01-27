# infrared_rcv

## module diagram

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\infrared_rcv_module.png)

## Signals

|      name       | width(bit) |   type   |                         description                          |
| :-------------: | :--------: | :------: | :----------------------------------------------------------: |
|     sys_clk     |     1      |  input   |                   system clock with 50Mhz                    |
|    sys_rst_n    |     1      |  input   |                         reset button                         |
|   infrared_in   |     1      |  input   |          infrared signal (reversed a frame of data)          |
|      data       |     20     |  output  |    show the value of infrared signal in 7-segment display    |
|    repeat_en    |     1      |  output  |                    detect the repeat code                    |
| infrared_in_dly |     1      | internal |             delay infrared_in with 1 clock cycle             |
|   ifr_in_fall   |     1      | internal | detect the falling edge of infrared_in, and send a pulse signal |
|   ifr_in_rise   |     1      | internal | detect the rising edge of infrared_in, and send a pulse signal |
|       cnt       |     19     | internal | When rising or falling edge comes, start to count and determine whether the time of high or low voltage is correct the data frame. |
|      state      |     5      | internal |                       the state of FSM                       |
|    data_cnt     |     6      | internal |     count 32 data (address code+data code) in data frame     |
|    data_tmp     |     32     | internal | store 32 bits of data (address code+data code) in data frame |

## state transition diagram

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\infrared_rcv_state_transition_diagram.png)