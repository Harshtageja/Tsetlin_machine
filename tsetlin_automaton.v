module tsetlin_automaton(clk,rst,positive_feedback,negative_feedback,include_or_not,state);

input clk,rst,positive_feedback,negative_feedback,state;
reg[2:0] ps,ns;
output include_or_not;
always@(posedge clk)begin
	if(rst)
		ps<=3'd4;
	else
		ps<=ns;
end

always@(*)begin
	ns<=ps;
	case(ps)
		0:	if(positive_feedback)
				ns<=0;
			else if(negative_feedback)
				ns<=1;
			
		1,2,3:if(positive_feedback)
					ns<=ps-3'd1;
				else if(negative_feedback)
					ns<=ps+3'd1;	
		4,5,6:if(positive_feedback)
					ns<=ps+3'd1;
				else if(negative_feedback)
					ns<=ps-3'd1;
		7:	if(positive_feedback)
				ns<=3'd7;
			else if(negative_feedback)
				ns<=ps-3'd1;
					
	
	endcase



end
assign include_or_not=state;

endmodule
