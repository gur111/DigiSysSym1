// 4->1 multiplexer test bench template
module mux4_test;
    logic d0;
    logic d1;
    logic d2;
    logic d3;
    logic [1:0] sel;
    logic z;
    
    localparam B=10,C=6,D=6,E=3,F=1,G=8;

    initial begin
        d0 = 1'b0;
        d1 = 1'b0;
        d2 = 1'b0;
        d3 = 1'b0;
        sel[0] = 1'b0;
        sel[1] = 1'b0;
        
        #100;
        d0 = 1'b1;
        #100;
        d0 = 1'b0;
        #100;

    end

    mux4 #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) mux (
        .z(z), 
        .sel(sel), 
        .d0(d0),  
        .d1(d1),
        .d2(d2),
        .d3(d3)
    );



endmodule
