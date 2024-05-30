module top_lvl(CLOCK_50,SW,LEDR);
input CLOCK_50;
wire clk;
wire rst,x1,x2;
input [17:0] SW;
output [17:0] LEDR;
wire[1:0] positive_feedback;
wire[1:0] negative_feedback;
wire[1:0]votes[0:1];
reg prediction;
assign clk=CLOCK_50;
assign rst=SW[0];
assign {x1,x2}=SW[2:1];
assign LEDR[0]=prediction;
class1 c1(clk,rst,positive_feedback[0],negative_feedback[1],x1,x2,votes[0],2'b00,2'b11,2'b01,2'b10);//supporting 0 clause is as x1x2
class1 c2(clk,rst,positive_feedback[0],negative_feedback[1],x1,x2,votes[1],2'b10,2'b01,2'b00,2'b11);//supporting 1
always@(*)begin
	if(votes[1][1]&&~votes[0][1])begin
		prediction<=1'b0;
	end
	else if(~votes[1][1]&&votes[0][1])
		prediction<=1'b1;
	else if(votes[1]>votes[0])
		prediction<=1'b1;
	else
		prediction<=1'b0;
		

end

endmodule
