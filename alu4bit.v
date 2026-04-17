module alu4bit(
    input [3:0] a,b,
    input [1:0] sel,
    input clk, reset,
    output reg [3:0] sum,
    output reg carryout
);
reg [3:0] tempsum;
reg tempcarryout;
always@(*) begin
    case(sel)
        2'b00:{tempcarryout,tempsum}=a+b; //add
        2'b01:
            if(a>=b) begin
                {tempcarryout,tempsum}=a-b;//sub
            end
            else begin
                {tempcarryout,tempsum}=b-a;//sub
            end
            2'b10:{tempcarryout,tempsum}=a&b;//and
            2'b11:{tempcarryout,tempsum}=a|b;//or
            default: begin
                tempsum=4'b0000;
                tempcarryout = 1'b0;
            end
        endcase
    end
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            sum <= 4'b0000;
            carryout <= 1'b0;
        end
        else begin
            sum <= tempsum;
            carryout <= tempcarryout;
        end
    end
    endmodule

