interface counter_if;
//signals
    logic [7:0] data_in;
    logic [7:0] q;
    logic clk;
    logic ld;
    logic inc;
    logic rst;
//counter modport
    modport cntr_mp(
        input data_in,
        input clk,
        input ld,
        input rst,
        input inc,
        output q
    );
//clocking 
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
//reset
    initial begin
        rst = 1'b0;
        repeat(3) @(negedge clk);
        rst = 1'b1;
    end
endinterface