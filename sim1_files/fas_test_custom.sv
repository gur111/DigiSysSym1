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


        
        /*
        // A Changes 0010->0110
        $display("A Changes 0010->0110 %0t", $time);
        cin = 1'b0;
        a = 1'b0;
        b = 1'b1;
        a_ns=0;

        #MAX_TPD;
        last = $time;
        a = 1'b1;
        wait_a_change();


        #MAX_TPD;
        last = $time;
        a = 1'b0;
        wait_a_change();
        // $stop;

        // A Changes 0011->0111
        #DELIM_DELAY;
        $display("A Changes 0011->0111 %0t", $time);
        cin = 1'b0;
        a = 1'b0;
        b = 1'b1;
        a_ns=1;

        #MAX_TPD;
        last = $time;
        a = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        a = 1'b0;
        wait_a_change();
        // $stop;

        // A Changes 1000->1100
        #DELIM_DELAY;
        $display("A Changes 1000->1100 %0t", $time);
        cin = 1'b1;
        a = 1'b0;
        b = 1'b0;
        a_ns=0;

        #MAX_TPD;
        last = $time;
        a = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        a = 1'b0;
        wait_a_change();
        // $stop;

        // A Changes 1001->1101
        #DELIM_DELAY;
        $display("A Changes 1001->1101 %0t", $time);
        cin = 1'b1;
        a = 1'b0;
        b = 1'b0;
        a_ns=1;

        #MAX_TPD;
        last = $time;
        a = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        a = 1'b0;
        wait_a_change();
        // $stop;

        // B Changes 1001->1011
        #DELIM_DELAY;
        $display("B Changes 1001->1011 %0t", $time);
        cin = 1'b1;
        a = 1'b0;
        b = 1'b0;
        a_ns=1;

        #MAX_TPD;
        last = $time;
        b = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        b = 1'b0;
        wait_a_change();

        // B Changes 0101->0111
        #DELIM_DELAY;
        $display("B Changes 0101->0111 %0t", $time);
        cin = 1'b0;
        a = 1'b1;
        b = 1'b0;
        a_ns=1;

        #MAX_TPD;
        last = $time;
        b = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        b = 1'b0;
        wait_a_change();
        // $stop;

        // B Changes 1100->1110
        #DELIM_DELAY;
        $display("B Changes 1100->1110 %0t", $time);
        cin = 1'b1;
        a = 1'b1;
        b = 1'b0;
        a_ns=0;

        #MAX_TPD;
        last = $time;
        b = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        b = 1'b0;
        wait_a_change();
        // $stop;

        // B Changes 0000->0010
        #DELIM_DELAY;
        $display("B Changes 0000->0010 %0t", $time);
        cin = 1'b0;
        a = 1'b0;
        b = 1'b0;
        a_ns=0;

        #MAX_TPD;
        last = $time;
        b = 1'b1;
        wait_a_change();

        #MAX_TPD;
        last = $time;
        b = 1'b0;
        wait_a_change();
        // $stop;

        // END
        #DELIM_DELAY;
        */
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
