/************************************************************************
 * Example testbench: instantiates 4 basic logic gates and applies      *
 * stimulus to the gate inputs.                                         *
 ************************************************************************/
module fas_test;
    // Signal declarations
    // Gate output wires
    logic cout;
    logic cin;
    logic s;
    logic a_ns;

    // Gate inputs
    logic a;
    logic b;

    // The testbench: try different input combinations at different points
    // of time - change values every 10 time units.
    initial begin
        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
        a_ns=0;

        #10;
        a = 1'b1;

        #10;
        b = 1'b1;

        #10
        a = 1'b0;

        #20
        a = 1'b0;
        b = 1'b0;
        a_ns=1;

        #10;
        a = 1'b1;

        #10;
        b = 1'b1;

        #10
        a = 1'b0;        
        $stop;
    end

    // Gate instantiations
    // For this gate we override the default delays with: Tpdlh=5 and Tpdhl=7
    fas FAS(
        .cout(cout),
        .cin(cin),
        .a_ns(a_ns),
        .s(s),
        .a(a),
        .b(b)
    );



endmodule
