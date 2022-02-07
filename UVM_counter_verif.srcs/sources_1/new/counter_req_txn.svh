class counter_req_txn extends uvm_transaction;

/*-------------------------------------------------------------------------------
-- Interface, port, fields
-------------------------------------------------------------------------------*/
	rand logic ld;
	rand logic inc;
	rand logic rst;
	rand logic [7:0] data_in;

/*-------------------------------------------------------------------------------
-- UVM Factory register
-------------------------------------------------------------------------------*/
	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_object_utils(counter_req_txn)

/*-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------*/
	// Constructor
	function new(string name = "counter_req_txn");
		super.new(name);
	endfunction : new

	function string convert2string();
		return $sformatf("ld:%0h, inc:%0h, rst:%0h, data_in:%0h",ld, inc, rst, data_in);
	endfunction : convert2string

	function void do_copy(uvm_object rhs);
		counter_req_txn RHS;
		super.do_copy(rhs);
		$cast(RHS, rhs);
		ld = RHS.ld;
		inc = RHS.inc;
		rst = RHS.rst;
		data_in = RHS.data_in;
	endfunction : do_copy

	function void load_data(logic l, logic i, logic r, logic [7:0] d);
		ld=l;
		inc=i;
		rst=r;
		data_in=d;
	endfunction : load_data

endclass : counter_req_txn