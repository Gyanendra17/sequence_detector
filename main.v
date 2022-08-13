`timescale 1ns / 1ps

module main(
    input clk,rst,din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    parameter s2=3;
        
    reg[1:0]state=idle;
    
    always@(posedge clk)
    begin
        case(state)
        
        idle:begin
             if(rst)begin
             state<=idle;
             dout<=1'b0;
             end
             else begin
             state<=s0;
             dout<=1'b0;
             end
             end
        
        s0:begin
           if(din)begin
           state<=s1;
           dout<=1'b0;
           end
           else begin
           state<=s0;
           dout<=1'b0;
           end
           end
           
        s1:begin
           if(~din)begin
           state<=s2;
           dout<=1'b0;
           end
           else begin
           state<=s1;
           dout<=1'b0;
           end
           end
        
        s2:begin
           if(din)begin
           state<=s1;
           dout<=1'b1;
           end
           else begin
           state<=s0;
           dout<=1'b0;
           end
           end
        
        default:begin
                state<=idle;
                dout<=1'b0;
                end
           
        endcase
          
    end
endmodule
