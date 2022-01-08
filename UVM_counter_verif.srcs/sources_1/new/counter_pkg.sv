package counter_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "memory_test.svh"
    `include "memory_scoreboard.svh"
    `include "memory_driver.svh"
    `include "memory_monitor.svh"
    `include "memory_test_env.svh"
    
    virtual interface counter_if global_cif;
    
endpackage