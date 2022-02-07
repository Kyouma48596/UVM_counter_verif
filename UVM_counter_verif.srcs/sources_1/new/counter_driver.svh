import uvm_pkg::*;
`include "uvm_macros.svh"
class counter_driver extends uvm_driver #(counter_req_txn);

    `uvm_component_utils(counter_driver)
    
    virtual interface counter_if vif;
    my_dut_config dut_config_0;
    counter_req_txn txn;
    
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
        forever begin 
            @(negedge vif.clk)
            seq_item_port.get_next_item(txn);
            vif.ld = txn.ld;
            vif.inc = txn.inc;
            vif.data_in = txn.data_in;
            seq_item_port.item_done();
            `uvm_info("DRIVER", $sformatf("Ran : %s",txn.convert2string()), UVM_MEDIUM);
        end
    endtask
    
endclass