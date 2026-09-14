class dff_sequence extends uvm_sequence #(dff_seq_item);
  // Register this sequence object with the UVM factory.
  `uvm_object_utils(dff_sequence)
  dff_seq_item tx; 
  
  function new (string name="dff_sequence");
    super.new(name);
    `uvm_info ("sequence class", "constructor", UVM_MEDIUM)
      endfunction
      // Sequences execute their stimulus in body(); they do not use component phases.
      task body();
        repeat(10)
        begin
          
          tx = dff_seq_item::type_id::create("tx");
          
          wait_for_grant();
          if (!tx.randomize())
            `uvm_error("DFF_SEQ", "Transaction randomization failed")
          send_request(tx);
          wait_for_item_done();
        end
      endtask
      endclass
