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
        repeat(3) @(negedge clk);
        rst = 1'b1;
    end
//behavioral checking
    always @(posedge clk) begin
        if(~rst) begin
            q_behavioral<=0;
        end
        else if(ld) begin
            q_behavioral<=data_in;
        end
        else if(inc) begin
            q_behavioral<=q_behavioral+1;
        end
        #1;
        assert(q_behavioral == q);
    end  

endinterface