module top;

    import uvm_pkg::*;
    import counter_pkg::*;
    `include "uvm_macros.svh";
    
    counter_if cif();
    counter DUT(cif.cntr_mp);
    initial begin
        uvm_config_db#(virtual counter_if)::set(uvm_root::get(), "*", "dut_vi", cif);
        run_test("counter_test");
    end
    
endmodule