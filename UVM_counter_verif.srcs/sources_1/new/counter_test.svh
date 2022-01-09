import uvm_pkg::*;
`include "uvm_macros.svh"

class counter_test extends uvm_test;
    
    `uvm_component_utils(counter_test)
    
    counter_env environment;
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        environment = counter_env::type_id::create("environment", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction
endclass