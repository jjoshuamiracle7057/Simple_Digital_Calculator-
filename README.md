# Simple_Digital_Calculator
The design and implementation of this 2-bit Multi-Function Arithmetic Logic Unit (ALU) represents a specialized hardware-based approach to digital computation, utilizing the Xilinx ZedBoard Zynq-7000 SoC as the target platform.

📌 Project Overview
This project involves the design and implementation of a 2-bit Multi-Function Arithmetic Logic Unit (ALU) targeted for the Xilinx ZedBoard (Zynq-7000 SoC). Using Verilog HDL, the system performs real-time arithmetic operations by mapping physical sliding switches to data inputs and operation codes.
The project demonstrates fundamental VLSI design principles, including combinational logic data paths, hardware-level exception handling, and physical FPGA pin mapping.

🚀 Features
* Arithmetic Suite: Supports Addition (+), Subtraction (-), Multiplication (*), and Division (/).
* Error Detection: Integrated logic to detect Division by Zero, triggering a high-priority alarm on LED LD7.
* Real-time Interface: Zero-latency execution with direct feedback via the ZedBoard's onboard LED array.
* Optimized Constraints: Custom XDC file utilizing LVCMOS25 and LVCMOS33 standards for hardware compatibility.

🛠 Technical Specifications
* FPGA Part: XC7Z020-CLG484-1
* Language: Verilog HDL (IEEE 1364-2001)
* Simulation Tool: Vivado Simulator
* Synthesis Tool: Xilinx Vivado Design Suite 2026

Hardware Mapping
To operate the calculator, use the switches as follows:
Control TypeSwitchesDescriptionInput ASW7, SW62-bit Operand A (Value 0-3)OpCodeSW3, SW200 (+), 01 (-), 10 (*), 11 (/)Input BSW1, SW02-bit Operand B (Value 0-3)ResultLD3 - LD04-bit Binary OutputError FlagLD7Lights up if dividing by zero

Detailed Project ElaborationThe design and implementation of this 2-bit Multi-Function Arithmetic Logic Unit (ALU) represents a specialized hardware-based approach to digital computation, utilizing the Xilinx ZedBoard Zynq-7000 SoC as the target platform. At its core, the project demonstrates the translation of high-level mathematical concepts into Register Transfer Level (RTL) logic using Verilog HDL. The system is architected to process two 2-bit binary operands, designated as Input A (a_1, a_0) and Input B (b_1, b_0), which are sourced directly from the board’s physical sliding switches (SW7-SW6 and SW1-SW0). 

A separate 2-bit control vector, known as the OpCode (SW3-SW2), acts as the primary instruction set for the ALU, allowing the user to switch dynamically between four fundamental operations: Addition, Subtraction, Multiplication, and Division.

Architecturally, the ALU utilizes concurrent combinational logic to ensure high-speed, zero-latency execution of arithmetic tasks. While addition and subtraction provide basic numerical processing, the multiplication module expands the 2-bit inputs into a 4-bit product (LD3-LD0) to accommodate values up to decimal 9 (binary 1001). 

Furthermore, the design incorporates advanced exception handling by monitoring the status of the divisor during division operations. If a "Division by Zero" state is detected—specifically when the divisor bits are set to $00$ while the OpCode is $11$—the logic asserts a high-priority interrupt signal, illuminating LED LD7 to provide the user with immediate diagnostic feedback. This prevents the hardware from entering an undefined mathematical state and demonstrates a professional approach to digital system reliability.The hardware implementation is strictly governed by a meticulously defined Xilinx Design Constraints (XDC) file, which bridges the internal RTL signals to the physical hardware pins of the Zynq-7000 chip. 

This mapping respects the ZedBoard’s specific voltage requirements, utilizing the LVCMOS25 standard for the switch bank to match the VADJ power rail and the LVCMOS33 standard for the LED array. By successfully synthesizing, implementing, and deploying this bitstream, the project proves the efficiency of FPGA-based combinational logic in replacing fixed-function integrated circuits. This modular design serves as a scalable foundation for future enhancements, such as N-bit expansion or integration into larger System-on-Chip (SoC) architectures via AXI4-Lite interconnect ports for hardware acceleration in more complex embedded applications.


