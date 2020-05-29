/************************************************************************
 * Example testbench: instantiates 4 basic logic gates and applies      *
 * stimulus to the gate inputs.                                         *
 ************************************************************************/
module fas_test_custom;
    
    logic cin;
    logic a;
    logic b;
    logic a_ns;

    logic s;
    logic cout;

    localparam MAX_TPD = 50;
    localparam DELIM_DELAY = 100;
    int last = 0;

    parameter B=10,C=6,D=6,E=3,F=1,G=8;

    task wait_a_change();
        @(!cout);
        $display("Cout changed after %0t", ($time)-last);
    endtask

    task make_cin_changes();
        #MAX_TPD;
        last = $time;
        cin = 1'b1;;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        cin = 1'b0;
        wait_a_change();
    endtask


    // The testbench: try different input combinations at different points
    // of time - change values every 10 time units.
    initial begin
        $display("C_in Changes 0000->1000 %0t", $time);
        cin = 1'b0;
        a = 1'b0;
        b = 1'b0;
        a_ns=0;

        make_cin_changes();

        $display("C_in Changes 0101->1101 %0t", $time);
        cin = 1'b0;
        a = 1'b1;
        b = 1'b0;
        a_ns=1;
        
        make_cin_changes();

        $display("C_in Changes 0011->1011 %0t", $time);
        cin = 1'b0;
        a = 1'b0;
        b = 1'b1;
        a_ns=1;
        
        make_cin_changes();

        
        $display("C_in Changes 0110->1110 %0t", $time);
        cin = 1'b0;
        a = 1'b1;
        b = 1'b1;
        a_ns=0;
        
        make_cin_changes();

        #MAX_TPD;
    end

    // Gate instantiations
    // For this gate we override the default delays with: Tpdlh=5 and Tpdhl=7
    fas #(.B(B), .C(C), .D(D), .E(E), .F(F), .G(G)) FAS(
        .cout(cout),
        .cin(cin),
        .a_ns(a_ns),
        .s(s),
        .a(a),
        .b(b)
    );



endmodule
