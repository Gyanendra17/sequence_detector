`timescale 1ns / 1ps

module tb();

reg clk=0,rst=0,din=0;
wire dout;

main dut (clk,rst,din,dout);

initial begin
rst=1'b0;
#50
rst=~rst;
end

always #10 clk=~clk;

initial begin
#50
repeat(15)@(posedge clk)
din=$urandom;
end

initial begin
#300
$finish();
end

endmodule
