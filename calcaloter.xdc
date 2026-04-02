----------------------------------------------------------------------------

ALU 2-Bit Multi-Function Constraints (.xdc)

Target Device: xc7z020clg484-1 (ZedBoard)

----------------------------------------------------------------------------

--- INPUT A: a1, a0 (switches

$$7:6$$

) ---

SW7 is M15, SW6 is H17 per Table 13

set_property PACKAGE_PIN M15 

$$get_ports {switches\[7$$

}]
set_property PACKAGE_PIN H17 

$$get_ports {switches\[6$$

}]

--- UNUSED SWITCHES (switches

$$5:4$$

) ---

Mapping to prevent floating input warnings

set_property PACKAGE_PIN H18 

$$get_ports {switches\[5$$

}]
set_property PACKAGE_PIN H19 

$$get_ports {switches\[4$$

}]

--- OP CODE: op1, op0 (switches

$$3:2$$

) ---

Mapping to SW3 (F21) and SW2 (H22)

set_property PACKAGE_PIN F21 

$$get_ports {switches\[3$$

}]
set_property PACKAGE_PIN H22 

$$get_ports {switches\[2$$

}]

--- INPUT B: b1, b0 (switches

$$1:0$$

) ---

Mapping to SW1 (G22) and SW0 (F22)

set_property PACKAGE_PIN G22 

$$get_ports {switches\[1$$

}]
set_property PACKAGE_PIN F22 

$$get_ports {switches\[0$$

}]

Set all switches to 2.5V bank standard (VADJ)

set_property IOSTANDARD LVCMOS25 

$$get_ports {switches\[\*$$

}]

--- OUTPUT RESULT (leds

$$3:0$$

) ---

Mapping Result to LD3, LD2, LD1, LD0 (U21 to T22)

set_property PACKAGE_PIN U21 

$$get_ports {leds\[3$$

}]
set_property PACKAGE_PIN U22 

$$get_ports {leds\[2$$

}]
set_property PACKAGE_PIN T21 

$$get_ports {leds\[1$$

}]
set_property PACKAGE_PIN T22 

$$get_ports {leds\[0$$

}]

--- UNUSED LEDS (leds

$$6:4$$

) ---

set_property PACKAGE_PIN U19 

$$get_ports {leds\[6$$

}]
set_property PACKAGE_PIN W22 

$$get_ports {leds\[5$$

}]
set_property PACKAGE_PIN V22 

$$get_ports {leds\[4$$

}]

--- ERROR FLAG: Div by Zero (leds

$$7$$

) ---

Mapping Error to LD7 (U14)

set_property PACKAGE_PIN U14 

$$get_ports {leds\[7$$

}]

Set all LEDs to 3.3V bank standard

set_property IOSTANDARD LVCMOS33 

$$get_ports {leds\[\*$$

}]
