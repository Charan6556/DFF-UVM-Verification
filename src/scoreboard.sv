class dff_scoreboard extends uvm_scoreboard;
  // Register this scoreboard component with the UVM factory.
  `uvm_component_utils(dff_scoreboard)
  uvm_analysis_imp#(dff_seq_item, dff_scoreboard) item_collected_export;
  dff_seq_item tx_q[$];
  //constructor (standard)
  function new (string name="dff_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("scoreboard class", "constructor", UVM_MEDIUM)
      endfunction
   //build phase
      function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      item_collected_export = new("item_collected_export",this);
      endfunction
      
      // Receive observed transactions from the monitor and store them.
      // This learning version does not perform scoreboard comparisons.
      virtual function void write(dff_seq_item tx);
        tx_q.push_back(tx);
      endfunction
   
      endclass
