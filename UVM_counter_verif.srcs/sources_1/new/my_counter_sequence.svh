class my_counter_sequence extends uvm_sequence #(counter_req_txn);

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	counter_req_txn pkt;

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_object_utils(my_counter_sequence)
	`uvm_declare_p_sequencer(uvm_sequencer #(counter_req_txn))
/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "my_counter_sequence");
		super.new(name);
	endfunction : new

	task body();
		pkt = counter_req_txn::type_id::create("pkt");
		repeat(20) begin 
			start_item(pkt);
			assert(pkt.randomize());
			finish_item(pkt);
		end
	endtask : body

endclass : my_counter_sequence