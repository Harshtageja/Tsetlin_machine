module clause_formed(clk,rst,positive_feedback,negative_feedback,clause_output,x1,x2,clause1);
input clk,rst,positive_feedback,negative_feedback,x1,x2;
output clause_output;
input[1:0]clause1;
wire[3:0] include_or_not;
tsetlin_automaton t1(clk,rst,positive_feedback,negative_feedback,include_or_not[0],clause1[1]);//x1
tsetlin_automaton t2(clk,rst,positive_feedback,negative_feedback,include_or_not[1],clause1[0]);//x2
tsetlin_automaton	t3(clk,rst,positive_feedback,negative_feedback,include_or_not[2],~clause1[1]);//~x1
tsetlin_automaton	t4(clk,rst,positive_feedback,negative_feedback,include_or_not[3],~clause1[0]);//~x2

assign clause_output=(~include_or_not[0]|x1)&(~include_or_not[1]|x2)&(~include_or_not[2]|~x1)&
(~include_or_not[3]|~x2);

endmodule
