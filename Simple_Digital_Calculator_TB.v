/*
 * File: Simple_Digital_Calculator_TB.v
 * Description: Testbench for the 2-bit Multi-Function ALU.
 * This TB verifies Addition, Subtraction, Multiplication, and Division
 * across various input combinations.
 */

`timescale 1ns / 1ps

module Simple_Digital_Calculator_TB();

    // Inputs
    reg [7:0] switches;

    // Outputs
    wire [7:0] leds;

    // Instantiate the Unit Under Test (UUT)
    Simple_Digital_Calculator uut (
        .switches(switches),
        .leds(leds)
    );

    // Initial block for stimulus
    initial begin
        // Initialize Inputs
        switches = 8'h00;
        #100;

        // --- TEST 1: ADDITION (OpCode 00) ---
        // A=3 (11), B=2 (10), Op=00 -> Switches = 11_00_00_10 (0xC2)
        switches = 8'b11_00_00_10; 
        #50;
        $display("ADD: 3 + 2 = %d (Expected: 5, LEDs[3:0]: 0101)", leds[3:0]);

        // --- TEST 2: SUBTRACTION (OpCode 01) ---
        // A=3 (11), B=1 (01), Op=01 -> Switches = 11_00_01_01 (0xC5)
        switches = 8'b11_00_01_01;
        #50;
        $display("SUB: 3 - 1 = %d (Expected: 2, LEDs[3:0]: 0010)", leds[3:0]);

        // --- TEST 3: MULTIPLICATION (OpCode 10) ---
        // A=3 (11), B=3 (11), Op=10 -> Switches = 11_00_10_11 (0xCB)
        switches = 8'b11_00_10_11;
        #50;
        $display("MUL: 3 * 3 = %d (Expected: 9, LEDs[3:0]: 1001)", leds[3:0]);

        // --- TEST 4: DIVISION (OpCode 11) ---
        // A=3 (11), B=1 (01), Op=11 -> Switches = 11_00_11_01 (0xCD)
        switches = 8'b11_00_11_01;
        #50;
        $display("DIV: 3 / 1 = %d (Expected: 3, LEDs[3:0]: 0011)", leds[3:0]);

        // --- TEST 5: DIVISION BY ZERO (Error Check) ---
        // A=2 (10), B=0 (00), Op=11 -> Switches = 10_00_11_00 (0x8C)
        switches = 8'b10_00_11_00;
        #50;
        if (leds[7] == 1'b1)
            $display("DIV0: Detected Division by Zero successfully (LEDs[7] is HIGH)");
        else
            $display("DIV0: FAILED to detect Division by Zero");

        #100;
        $display("Simulation Finished.");
        $finish;
    end

endmodule
