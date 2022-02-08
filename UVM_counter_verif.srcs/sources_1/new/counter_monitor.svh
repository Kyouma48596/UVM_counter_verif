import uvm_pkg::*;
`include "uvm_macros.svh"
class counter_monitor extends uvm_agent;

    `uvm_component_utils(counter_monitor);
    
    virtual interface counter_if vif;
    my_dut_config dut_config_0;
    uvm_analysis_port #(counter_req_txn) mon_port;
    counter_req_txn txn=new(), cln;
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        dut_config_0 = my_dut_config::type_id::create("dut_config_0", this);
        uvm_config_db#(my_dut_config)::get(this, "", "dut_config_0", dut_config_0);
        vif = dut_config_0.dut_vi;
        mon_port = new("mon_port", this);
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
        @(posedge vif.clk); #2;
        txn.load_data(vif.ld, vif.inc, vif.rst, vif.data_in);
        $cast(cln, txn.clone());
        mon_port.write(cln);
        `uvm_info("MONITOR", $sformatf("rst:%0b, ld:%0b, inc:%0b, data_in:%0h, q:%0h", vif.rst, vif.ld, vif.inc, vif.data_in, vif.q), UVM_MEDIUM)
        end
    endtask
    
endclass