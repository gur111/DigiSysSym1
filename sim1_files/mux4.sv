// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

// Put your code here
// ------------------
parameter B = 10, C = 6, D = 6, E = 3, F = 1, G = 8;
logic g1_out, g2_out;
mux2 #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) g1 (.z(g1_out), .sel(sel[1]), .d0(d0), .d1(d1));
mux2 #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) g2 (.z(g2_out), .sel(sel[0]), .d0(d2), .d1(d3));
mux2 #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) g3 (.z(z), .sel(sel[1]), .d0(g1_out),  .d1(g2_out));

// End of your code

endmodule
