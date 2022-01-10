module counter(counter_if.cntr_mp cif);
    
    logic [7:0] counter_reg = 0;
    
    always @(posedge cif.clk) begin
        if(~cif.rst) counter_reg<=0;
        else if(cif.ld) counter_reg<=cif.data_in;
        else if(cif.inc) counter_reg<=counter_reg+1;
    end
    
    assign cif.q = counter_reg;

endmodule