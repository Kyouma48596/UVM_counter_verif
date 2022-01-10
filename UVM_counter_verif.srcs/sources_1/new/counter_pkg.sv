package counter_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "counter_scoreboard.svh"
    `include "counter_driver.svh"
    `include "counter_monitor.svh"
    `include "counter_env.svh"
    `include "counter_test.svh"
    
    virtual interface counter_if global_cif;
    
endpackage