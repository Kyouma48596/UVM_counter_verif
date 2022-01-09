import uvm_pkg::*;
`include "uvm_macros.svh"

class counter_env extends uvm_env;
    
    `uvm_component_utils(counter_env)
    
    counter_driver driver;
    counter_scoreboard scoreboard;
    counter_monitor monitor;
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function build_phase(uvm_phase phase);
        super.build_phase(phase);
        driver = counter_driver::type_id::create("driver", this);
        monitor = counter_monitor::type_id::create("monitor", this);
        scoreboard = counter_scoreboard::type_id::create("scoreboard", this);
    endfunction
    
    function connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction
endclass