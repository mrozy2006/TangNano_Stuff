//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.9.03 Education (64-bit)
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Sat Aug 10 16:25:44 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	RAM_based_shift_reg_top your_instance_name(
		.clk(clk), //input clk
		.Reset(Reset), //input Reset
		.Din(Din), //input [5:0] Din
		.Q(Q) //output [5:0] Q
	);

//--------Copy end-------------------
