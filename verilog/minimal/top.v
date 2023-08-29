//**************************************************************************
//
//    Copyright (C) 2020  John Winans
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public
//    License as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//    Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public
//    License along with this library; if not, write to the Free Software
//    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
//    USA
//
//**************************************************************************




/**
* This will turn on led1 when btn1 is pressed.
**************************************************************************/
module top (
    input wire btn1,		// a single-bit input signal called btn1
    output wire led1		// a single-bit output signal called led1
	);


    // Configure the button with the internal pullup.
    // Floating inputs are very confusing.
    wire button;
    SB_IO #(
        .PIN_TYPE(6'b 0000_01),
        .PULLUP(1'b 1)
    ) button_input(
        .PACKAGE_PIN(btn1),
        .D_IN_0(button)
    );

	assign led1 = button;		// connect the internal button input to the led1 output

endmodule
