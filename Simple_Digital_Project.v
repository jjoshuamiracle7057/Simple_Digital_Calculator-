/*
 * Module: Simple_Digital_Calculator
 * Target: ZedBoard (Zynq-7000)
 * * DESCRIPTION:
 * A 2-bit Arithmetic Logic Unit (ALU).
 * Performs +, -, *, and / on two 2-bit inputs.
 * * INPUTS:
 * - switches[7:6]: Input A (a1, a0) -> Range 0-3
 * - switches[1:0]: Input B (b1, b0) -> Range 0-3
 * - switches[3:2]: OpCode (Operation Selection)
 * 00: Addition (+)
 * 01: Subtraction (-)
 * 10: Multiplication (*)
 * 11: Division (/)
 * * OUTPUTS:
 * - leds[3:0]: Binary Result
 * - leds[7]: Error Flag (Lights up for Division by Zero)
 */

module Simple_Digital_Calculator (
    input  wire [7:0] switches,   // 8 Sliding Switches
    output reg  [7:0] leds        // 8 Green LEDs
);

    // --- DATA PATH ---
    wire [1:0] a  = switches[7:6]; // Input A
    wire [1:0] b  = switches[1:0]; // Input B
    wire [1:0] op = switches[3:2]; // OpCode
    
    // Internal result registers
    reg [3:0] result;
    reg       div_zero_error;

    // --- COMBINATIONAL ALU LOGIC ---
    always @(*) begin
        // Default values
        result = 4'd0;
        div_zero_error = 1'b0;
        
        case (op)
            2'b00: begin // ADDITION
                result = a + b;
            end
            
            2'b01: begin // SUBTRACTION
                // Note: Simple unsigned subtraction. 
                // If b > a, it will wrap around (2's complement).
                result = a - b;
            end
            
            2'b10: begin // MULTIPLICATION
                result = a * b;
            end
            
            2'b11: begin // DIVISION
                if (b == 2'b00) begin
                    result = 4'd0;
                    div_zero_error = 1'b1; // Flag error
                end else begin
                    result = a / b;
                end
            end
            
            default: result = 4'd0;
        endcase
    end

    // --- LED OUTPUT MAPPING ---
    always @(*) begin
        leds = 8'b0000_0000;      // Clear all LEDs
        leds[3:0] = result;       // Display 4-bit result on LD3-LD0
        leds[7]   = div_zero_error; // LD7 indicates Error (Div by 0)
    end

endmodule
