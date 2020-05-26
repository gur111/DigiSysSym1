// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);
    parameter B=10,C=6,D=6,E=3,F=1,G=8;
    logic g1_out, g3_out, g4_out, g5_out, g6_out;
    logic g8_out, g9_out, g10_out, g11_out;

    // Sum operation
    XOR2 #(.Tpdlh(F), .Tpdhl(G)) g1 (.Z(g1_out), .A(a), .B(b));
    XOR2 #(.Tpdlh(F), .Tpdhl(G)) g2 (.Z(s), .A(cin), .B(g1_out));

    // Cout operation
    XOR2 #(.Tpdlh(F), .Tpdhl(G)) g5 (.Z(g5_out), .A(a), .B(a_ns));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g10 (.Z(g10_out), .A(cin));
    OR2 #(.Tpdlh(D), .Tpdhl(E)) g6 (.Z(g6_out), .A(g10_out), .B(g5_out));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g9 (.Z(g9_out), .A(g6_out));


    XOR2 #(.Tpdlh(F), .Tpdhl(G)) g4 (.Z(g4_out), .A(g1_out), .B(a_ns));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g8 (.Z(g8_out), .A(cin));
    OR2 #(.Tpdlh(D), .Tpdhl(E)) g3 (.Z(g3_out), .A(g8_out), .B(g4_out));
    NOT #(.Tpdlh(B), .Tpdhl(C)) g11 (.Z(g11_out), .A(g3_out));

    OR2 #(.Tpdlh(D), .Tpdhl(E)) g7 (.Z(cout), .A(g9_out), .B(g11_out));


endmodule



