// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
// ------------------
parameter B = 0, C = 0, D = 0, E = 0, F = 0, G = 0;
localparam logic g1_out = 0, g2_out = 0, g4_out = 0, g5_out = 0, g6_out = 0, g7_out = 0, g8_out = 0;

OR2 #(.Tpdlh(D), .Tphl(E)) g1 (.Z(g1_out), .A(g4_out), .B(sel));
OR2 #(.Tpdlh(D), .Tphl(E)) g2 (.Z(g2_out), .A(g5_out), .B(g6_out));
OR2 #(.Tpdlh(D), .Tphl(E)) g3 (.Z(z), .A(g7_out), .B(g8_out));
NOT #(.Tpdlh(B), .Tphl(C)) g4 (.Z(g4_out), .A(d0));
NOT #(.Tpdlh(B), .Tphl(C)) g5 (.Z(g5_out), .A(d1));
NOT #(.Tpdlh(B), .Tphl(C)) g6 (.Z(g6_out), .A(sel));
NOT #(.Tpdlh(B), .Tphl(C)) g7 (.Z(g7_out), .A(g1_out));
NOT #(.Tpdlh(B), .Tphl(C)) g8 (.Z(g8_out), .A(g2_out));

// End of your code

endmodule
