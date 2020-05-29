// 64-bit ALU test bench template
module alu64bit_test;
    logic [63:0] a;
    logic [63:0] b;
    logic cin;
    logic [1:0] op;
    logic [63:0] s;
    logic cout;

    localparam B=10, C=6, D=6, E=3, F=1, G=8;

    initial begin
        op = 2'b11;
        cin = 1'b0;
        a = {64{1'b0}};
        b = {64{1'b0}};

        #2000;
        cin = 1'b1;

        #2000;
        cin = 1'b0;

        #2000;
    end

    alu64bit #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) alu (
        .a(a),
        .b(b),
        .cin(cin),
        .op(op),
        .s(s),
        .cout(cout)
    );

endmodule
