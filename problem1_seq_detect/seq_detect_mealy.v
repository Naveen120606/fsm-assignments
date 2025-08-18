`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 19:18:12
// Design Name: 
// Module Name: seq_detect_mealy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_detect_mealy(
input wire clk,
input wire rst, // synchronous reset
input wire din, // input bit
output wire y // output high only when given sequence detected
    );
    
    parameter[1:0] s0=2'd0,s1=2'd1,s2=2'd2,s3=2'd3; // state declaration
    reg[1:0] current_state,next_state;
    reg y_reg;
    
    // sequential circuit logic
    always @(posedge clk) begin
        if(rst) current_state <= s0;
        else current_state <= next_state;
    end
    
    always @(posedge clk) begin
        if (rst) y_reg <= 0;
        else begin
            case(current_state)
                s0: y_reg <= 0;
                s1: y_reg <= 0;
                s2: y_reg <= 0;
                s3: y_reg <= (din ? 1'b1 : 1'b0);  // detect 1101, pulse for 1 cycle
                default: y_reg <= 0;
            endcase
        end
    end
    
    // combination circuit logic or state diagram logic
    always @(*) begin
        case(current_state)
            s0: next_state = din?s1:s0;
            s1: next_state = din?s2:s0;
            s2: next_state = din?s2:s3;
            s3: next_state = din?s1:s0;
            default: next_state = s0;
        endcase
    end
    
    assign y = y_reg;
endmodule
