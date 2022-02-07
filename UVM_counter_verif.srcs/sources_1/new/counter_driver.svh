import uvm_pkg::*;
`include "uvm_macros.svh"
class counter_driver extends uvm_agent;

    `uvm_component_utils(counter_driver);
    
    virtual interface counter_if vif;
    integer iters = 10;
    my_dut_config dut_config_0;
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        dut_config_0 = my_dut_config::type_id::create("dut_config_0", this);
        uvm_config_db#(my_dut_config)::get(this, "", "dut_config_0", dut_config_0);
        vif = dut_config_0.dut_vi;
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
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