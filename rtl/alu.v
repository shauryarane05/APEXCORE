
module alu(

input [31:0] v1,
input [31:0] v2,
input [15:0] instructions,
output reg [63:0] ALUoutput
);
initial begin
  ALUoutput <= 0;
end	
	
always@(*) begin

  case(instructions) 
      16'd1: ALUoutput <= v1 + v2;        //add  //AMOADD.W                               
      16'd2: ALUoutput <= v1 - v2;        //sub                      
      16'd4: ALUoutput <= v1 ^ v2;        //xor  //AMOXOR.W                    
      16'd8: ALUoutput <= v1 | v2;        //or    //AMOOR.W                           
      16'd16: ALUoutput <= v1 & v2;       //and   //AMOAND.W                       
      16'd32: ALUoutput <= v1 << v2[4:0]; //sll                            
      16'd64: ALUoutput <= v1 >> v2[4:0]; //srl                            
      16'd128: ALUoutput <= v1 >>> v2[4:0];  //sra                           
      16'd256: ALUoutput <= (v1 < v2);    //slt                              
      16'd512: ALUoutput <= (v1 < v2);    //sltu
      16'd1024: ALUoutput <= (v1 * v2);   //mul
      16'd2048: ALUoutput <= (v1 / v2);     //div
      16'd4096: ALUoutput <= (v1 % v2);   //rem 
      16'd8192: ALUoutput <= v2;  //AMOSWAP.W
      16'd16384:ALUoutput <= (v1 > v2) ? v1 : v2; //AMOMAX.W
      16'd32768: ALUoutput <= (v1 < v2) ? v1 : v2; //AMOMIN.W
      default : ALUoutput <= 0;
endcase  
end	
endmodule 
