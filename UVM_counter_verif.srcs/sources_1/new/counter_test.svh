import uvm_pkg::*;
`include "uvm_macros.svh";

class counter_test extends uvm_test;

    `uvm_component_utils(counter_test);
    
    virtual interface memory_if vif;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        //global interface
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase)
        //testing the counter
    endtask

endclass