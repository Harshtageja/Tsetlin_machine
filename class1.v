module class1(clk,rst,positive_feedback,negative_feedback,x1,x2,votes,clause1,clause2,clause3,clause4);
input clk,rst,positive_feedback,negative_feedback,x1,x2;
input[1:0]clause1,clause2,clause3,clause4;
wire[3:0]clause_output;
output[1:0] votes;
clause_formed c1(clk,rst,positive_feedback,negative_feedback,clause_output[0],x1,x2,clause1);//positive clause
clause_formed c2(clk,rst,positive_feedback,negative_feedback,clause_output[1],x1,x2,clause2);
clause_formed c3(clk,rst,positive_feedback,negative_feedback,clause_output[2],x1,x2,clause3);//negative clause
clause_formed c4(clk,rst,positive_feedback,negative_feedback,clause_output[3],x1,x2,clause4);
assign votes=(clause_output[0]+clause_output[1]-(clause_output[2]+clause_output[3]));


endmodule
