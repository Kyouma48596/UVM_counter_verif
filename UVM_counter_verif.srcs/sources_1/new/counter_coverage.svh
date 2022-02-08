class counter_coverage extends uvm_agent;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	uvm_tlm_analysis_fifo #(counter_req_txn) req_fifo;
	counter_req_txn txn;
	typedef enum{ld_, inc_, rst_} counter_operations;
	counter_operations counter_op;
	logic ld, inc, rst;
	logic [7:0] data_in;
/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_component_utils(counter_coverage)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	covergroup counter_ops();
	   	coverpoint counter_op{
	   		bins actions[] = {ld_, inc_, rst_};
	   	}
	   	coverpoint data_in {
			bins zeros = {0};
		    bins others = {[1 : 16'hFFFE]};
		    bins ones  = {16'hFFFF};
	   	}
	endgroup : counter_ops
	// Constructor
	function new(string name = "counter_coverage", uvm_component parent=null);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		req_fifo = new("req_fifo", this);
	endfunction : build_phase

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever begin 
			req_fifo.get(txn);
			ld=txn.ld;
			inc=txn.inc;
			rst=txn.rst;
			data_in=txn.data_in;
			if(rst) counter_op=rst_;
			else if(ld) counter_op=ld_;
			else if(inc) counter_op=inc_;
			counter_ops.sample();
			`uvm_info("COVERAGE", "Covergroup sampled", UVM_MEDIUM)
		end
	endtask : run_phase

endclass : counter_coverage