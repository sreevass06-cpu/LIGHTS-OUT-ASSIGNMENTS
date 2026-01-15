`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 10:04:48
// Design Name: 
// Module Name: Grid_counter
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


module Grid_counter (
    input Left, input Right, input Up, input Down, input Toggle, input clk,input reset,
    output reg [5:0] Position);//Represents position

always @(posedge clk) begin
    if (reset) begin
        Position <= 6'b0;  
    end else begin
        
    if (Left && Position[2:0] != 0) Position[2:0] <= Position[2:0] - 1;
    else if (Right && Position[2:0] != 7) Position[2:0] <= Position[2:0] + 1;
    else if (Up && Position[5:3] != 0) Position[5:3] <= Position[5:3] - 1;
    else if (Down && Position[5:3] != 7) Position[5:3] <= Position[5:3] + 1;
        
    end
end
endmodule









