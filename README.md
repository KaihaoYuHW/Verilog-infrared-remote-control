# infrared remote control
## project structure
- "doc": the information for each module (see .md)

- "rtl": the implementation of all modules (see .v)

- "sim": all testbenches of each module

***
## an Infrared Remote Control System

![Infrared Remote Control System](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/Infrared%20Remote%20Control%20System.png)

Finally, the demodulated signal will be put into the FPGA for decoding.

***The receiver reverses the input signal and then output it.***

## NEC protocol

NEC protocol is the most popular in infrared remote control encoding protocols, and my FPGA board employs it. NEC protocol uses Pulse Position Modulation(PPM) to encode. 

When a button is pressed on the remote control, it emits a frame of data, consisting of a lead code, address code, complement of the address code, data code, and complement of the data code.

When address code is 00000000, and data code is 10101101, the frame of data seems like following: 

![a frame of data](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/a%20frame%20of%20data.png)

The function of the lead code is to send a repeat code at regular intervals when the button is pressed continuously.

![a repeat code](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/a%20repeat%20code.png)

## Experiment Goals

Use the FPGA board with a infrared remote control to transmit infrared signals. When the integrated receiver unit on the FPGA board receives the infrared signal, it will pass it to the FPGA. The FPGA will then decode the signal and display the value on the seven-segment display. If a repeat code is detected, the LED will flash once per repeat code.

## Design

The integrated receiver unit passes the infrared information, which is sent by the infrared remote control, into the FPGA for decoding using the infrared receiver module (infrared_rcv). If the received information matches the protocol, it will be transmitted to the seven-segment display module for display. If a repeat code is detected, the repeat code enable signal will be sent into the LED control module to make the LED flash.

![top_module](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/top_module.png)

## Implementation

![infrared_rcv_waveform1](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/infrared_rcv_waveform1.png)

![infrared_rcv_waveform2](https://github.com/KaihaoYuHW/Verilog_infrared-remote-control/blob/main/doc/infrared_rcv_waveform2.png)
