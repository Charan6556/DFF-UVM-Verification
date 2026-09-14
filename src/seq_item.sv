class dff_seq_item extends uvm_sequence_item;

   bit rst;
  rand bit d;
       bit q;

  `uvm_object_utils_begin(dff_seq_item)
    `uvm_field_int(rst, UVM_ALL_ON)
    `uvm_field_int(d,   UVM_ALL_ON)
    `uvm_field_int(q,   UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "dff_seq_item");
    super.new(name);
  endfunction

endclass