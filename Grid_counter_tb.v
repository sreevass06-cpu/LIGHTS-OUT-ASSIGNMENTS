`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2026 09:15:46
// Design Name: 
// Module Name: Grid_counter_tb
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

module Grid_counter_tb;  // Fixed name casing consistency
reg Left, Right, Up, Down, Toggle, clk, reset;
wire [5:0] Position;
    
Grid_counter dut (  // Assuming your DUT is named Grid_Counter
    .Left(Left), .Right(Right), .Up(Up), .Down(Down),
    .Toggle(Toggle), .clk(clk), .reset(reset),
    .Position(Position)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    reset = 1; Left=0; Right=0; Up=0; Down=0; Toggle=0;
    #10 reset = 0;
    repeat(10) @(posedge clk) Right = 1; #1 Right = 0;
    @(posedge clk);  
    repeat(10) @(posedge clk) Left = 1; #1 Left = 0;
    repeat(10) @(posedge clk) Down = 1; #1 Down = 0;
    repeat(10) @(posedge clk) Up = 1; #1 Up = 0;
    Right = 1; Down = 1;  
    #10 Right = 0; Down = 0;
    #20 $finish;
end

endmodule 
