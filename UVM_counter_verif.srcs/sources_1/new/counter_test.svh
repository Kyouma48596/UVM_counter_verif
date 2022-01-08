import uvm_pkg::*;
`include "uvm_macros.svh";

class counter_test extends uvm_test;

    `uvm_component_utils(counter_test);
    
    virtual interface counter_if vif;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        vif = global_cif;
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        integer iters = 10;
        //testing the design
        phase.raise_objection(this);
            repeat(5) @(negedge vif.clk);
            repeat(iters) begin
                @(negedge vif.clk) begin
                    vif.ld = $random;
                    vif.inc = $random;
                    vif.data_in = $random;
                end
            end
        phase.drop_objection(this);
    endtask

endclass