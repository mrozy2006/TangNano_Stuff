//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.9.03 Education (64-bit)
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Sun Aug 11 12:49:50 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    AddressMultiplicator your_instance_name(
        .dout(dout), //output [13:0] dout
        .a(a), //input [6:0] a
        .b(b), //input [6:0] b
        .ce(ce), //input ce
        .clk(clk), //input clk
        .reset(reset) //input reset
    );

//--------Copy end-------------------
