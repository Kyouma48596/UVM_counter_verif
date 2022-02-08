import uvm_pkg::*;
`include "uvm_macros.svh"

class counter_test extends uvm_test;
    
    `uvm_component_utils(counter_test)
    counter_env environment;
    my_dut_config dut_config_0;
    my_counter_sequence seq;

    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        environment = counter_env::type_id::create("environment", this);
        dut_config_0 = my_dut_config::type_id::create("dut_config_0", this);
        uvm_config_db#(virtual counter_if)::get(this, "*", "dut_vi", dut_config_0.dut_vi);
        uvm_config_db#(my_dut_config)::set(this, "*", "dut_config_0", dut_config_0);
    endfunction
    
    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        seq = my_counter_sequence::type_id::create("seq", this);
        seq.start(environment.my_seq);
        phase.drop_objection(this);
    endtask : run_phase
endclass