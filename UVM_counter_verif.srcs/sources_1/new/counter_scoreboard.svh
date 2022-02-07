import uvm_pkg::*;
`include "uvm_macros.svh"
class counter_scoreboard extends uvm_agent;

    `uvm_component_utils(counter_scoreboard)
    
    virtual interface counter_if vif;
    my_dut_config dut_config_0;
    logic [7:0] q_beh = 0;
    
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
            repeat(5) @(negedge vif.clk);
            forever begin
                @(posedge vif.clk);
                if(~vif.rst) q_beh<=0;
                else if(vif.ld) q_beh<=vif.data_in;
                else if(vif.inc) q_beh<=q_beh+1;
                @(negedge vif.clk);
                `uvm_info("SCOREBOARD", $sformatf("q_beh:%0h", q_beh), UVM_MEDIUM)
                assert(q_beh==vif.q);
            end
    endtask
endclass
            
    