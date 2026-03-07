//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.9.03 Education (64-bit)
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Tue Aug 20 19:06:22 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_RAM16SDP your_instance_name(
        .dout(dout), //output [2:0] dout
        .wre(wre), //input wre
        .wad(wad), //input [13:0] wad
        .di(di), //input [2:0] di
        .rad(rad), //input [13:0] rad
        .clk(clk) //input clk
    );

//--------Copy end-------------------
