module counter(counter_if.cntr_mp cif);

    always @(posedge cif.clk) begin
        if(~cif.rst) cif.q<=0;
        else if(cif.ld) cif.q<=cif.data_in;
        else if(cif.inc) cif.q<=cif.q+1;
    end

endmodule