interface counter_if;
//signals
    logic [7:0] data_in;
    logic [7:0] q;
    logic clk;
    logic ld;
    logic inc;
    logic rst;
    logic [7:0] q_behavioral;
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
        $monitor("rst:%0b, ld:%0b, inc:%0b, data_in:%0h, q:%0h, q_beh:%0h", rst, ld, inc, data_in, q, q_behavioral);
        repeat(3) @(negedge clk);
        rst = 1'b1;
    end
endinterface