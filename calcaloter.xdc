# ----------------------------------------------------------------------------
# ALU 2-Bit Calculator Constraints for ZedBoard
# ----------------------------------------------------------------------------

# --- INPUT A (SW7 and SW6) ---
set_property PACKAGE_PIN M15 [get_ports {a[1]}]
set_property PACKAGE_PIN H17 [get_ports {a[0]}]

# --- OP CODE (SW3 and SW2) ---
set_property PACKAGE_PIN F21 [get_ports {op[1]}]
set_property PACKAGE_PIN H22 [get_ports {op[0]}]

# --- INPUT B (SW1 and SW0) ---
set_property PACKAGE_PIN G22 [get_ports {b[1]}]
set_property PACKAGE_PIN F22 [get_ports {b[0]}]

# Set I/O Standard for all switches to 2.5V
set_property IOSTANDARD LVCMOS25 [get_ports {a[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {op[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {b[*]}]

# --- OUTPUT RESULT (LD3 to LD0) ---
set_property PACKAGE_PIN U21 [get_ports {result[3]}]
set_property PACKAGE_PIN U22 [get_ports {result[2]}]
set_property PACKAGE_PIN T21 [get_ports {result[1]}]
set_property PACKAGE_PIN T22 [get_ports {result[0]}]

# --- ERROR FLAG (LD7) ---
set_property PACKAGE_PIN U14 [get_ports {error}]

# Set I/O Standard for all LEDs to 3.3V
set_property IOSTANDARD LVCMOS33 [get_ports {result[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {error}]
