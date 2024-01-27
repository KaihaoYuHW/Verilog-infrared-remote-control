# infrared remote control

## an Infrared Remote Control System

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\Infrared Remote Control System.png)

Finally, the demodulated signal will be put into the FPGA for decoding.

***The receiver reverses the input signal and then output it.***

## NEC protocol

NEC protocol is the most popular in infrared remote control encoding protocols, and my FPGA board employs it. NEC protocol uses Pulse Position Modulation(PPM) to encode. 

When a button is pressed on the remote control, it emits a frame of data, consisting of a lead code, address code, complement of the address code, data code, and complement of the data code.

When address code is 00000000, and data code is 10101101, the frame of data seems like following: 

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\a frame of data.png)

The function of the lead code is to send a repeat code at regular intervals when the button is pressed continuously.

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\a repeat code.png)

## Experiment Goals

Use the FPGA board with a infrared remote control to transmit infrared signals. When the integrated receiver unit on the FPGA board receives the infrared signal, it will pass it to the FPGA. The FPGA will then decode the signal and display the value on the seven-segment display. If a repeat code is detected, the LED will flash once per repeat code.

## Design

The integrated receiver unit passes the infrared information, which is sent by the infrared remote control, into the FPGA for decoding using the infrared receiver module (infrared_rcv). If the received information matches the protocol, it will be transmitted to the seven-segment display module for display. If a repeat code is detected, the repeat code enable signal will be sent into the LED control module to make the LED flash.

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\top_module.png)

## Implementation

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\infrared_rcv_waveform1.png)

![](E:\IC_design\Verilog\FPGA_S6\infrared_rcv\doc\infrared_rcv_waveform2.png)