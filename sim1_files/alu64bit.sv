// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
parameter B=10,C=6,D=6,E=3,F=1,G=8;

logic alu_cin[64:0];

assign alu_cin[0] = cin;
assign cout = alu_cin[64];

genvar i;
generate
    for (i = 0; i<64; i++)
    begin
        alu1bit #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) ALU (
            .a(a[i]),
            .b(b[i]), 
            .cin(alu_cin[i]), 
            .cout(alu_cin[i+1]), 
            .op(op), 
            .s(s[i])
        );
    end

endgenerate

// End of your code

endmodule
