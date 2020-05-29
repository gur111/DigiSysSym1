// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
parameter B=10,C=6,D=6,E=3,F=1,G=8;
logic fas_sum, g1_out;
logic g2_out, g3_out, g4_out, mux_out;

fas #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) FAS (
        .cout(cout),
        .cin(cin),
        .a_ns(g1_out),
        .s(fas_sum),
        .a(a),
        .b(b)
);

NOT #(.Tpdlh(B), .Tpdhl(C)) g1 (.Z(g1_out), .A(op[0]));
OR2 #(.Tpdlh(D), .Tpdhl(E)) g2 (.Z(g2_out), .A(a), .B(b));
XOR2 #(.Tpdlh(F), .Tpdhl(G)) g3 (.Z(g3_out), .A(a), .B(b));
NOT #(.Tpdlh(B), .Tpdhl(C)) g4 (.Z(g4_out), .A(g2_out));
mux4 #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) MUX (
    .z(s),
    .sel(op),
    .d0(g4_out),
    .d1(g3_out),
    .d2(fas_sum),
    .d3(fas_sum)
);

// End of your code

endmodule
