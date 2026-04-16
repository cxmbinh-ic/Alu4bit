module alu4bit_tb();
reg [3:0] a,b;
reg clk,reset;
reg [1:0] sel;
wire [3:0] sum;
wire carryout;
alu4bit test(.a(a),.b(b),.sel(sel),.sum(sum),.carryout(carryout),.clk(clk),.reset(reset));
initial clk = 0;
always #50 clk =~clk;
initial begin
    $dumpfile("alu4bit_test.vcd");
    $dumpvars(0,alu4bit_tb);
    a=0;b=0; reset = 1; #100;
    
    reset = 0; a = 4'b0011; b= 4'b1010;#100;
    sel = 2'b00;#100;
    sel = 2'b01;#100;
    sel = 2'b10;#100;
    sel = 2'b11;#100;
    $finish;
end
endmodule
