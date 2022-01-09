import uvm_pkg::*;
`include "uvm_macros.svh"
class counter_scoreboard extends uvm_agent;

    `uvm_component_utils(counter_scoreboard)
    
    virtual interface counter_if vif;
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        vif = global_cif;
    endfunction
    
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        logic [7:0] q_beh;
        phase.raise_objection(this);
            repeat(5) @(negedge vif.clk);
            always @(posedge vif.clk) begin
                if(~vif.rst) vif.q<=0;
                else if(vif.ld) vif.q<=vif.data_in;
                else if(vif.inc) vif.q<=vif.q+1;
                #1;
                assert(q_beh==vif.q);
            end
        phase.drop_objection(this);
    endtask
endclass
            
    