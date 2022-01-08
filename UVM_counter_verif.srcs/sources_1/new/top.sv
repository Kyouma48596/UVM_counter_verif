module top;

    import uvm_pkg::*;
    import counter_pkg::*;
    `include "uvm_macros.svh";
    
    counter_if cif();
    counter DUT(cif.cntr_mp);
    initial begin
        counter_pkg::global_cif = cif;
        run_test("counter_test");
    end
    
endmodule