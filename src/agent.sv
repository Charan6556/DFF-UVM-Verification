class dff_agent extends uvm_agent;
  `uvm_component_utils(dff_agent)
  
  dff_driver drv;
  dff_sequencer seqr;
  dff_monitor mon;
  
  //constructor (standard)
  function new (string name="dff_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("agent class", "constructor", UVM_MEDIUM)
      endfunction
      
   //build phase
      function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      drv  = dff_driver::type_id::create("drv", this);
      mon  = dff_monitor::type_id::create("mon", this);
      seqr = dff_sequencer::type_id::create("seqr", this);
      endfunction
    
        //connect phase
      function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info ("agent class", "constructor", UVM_MEDIUM)
          //using TLM ports driver and sequencer are connected
          drv.seq_item_port.connect(seqr.seq_item_export);
          
          endfunction
        endclass
          
          
          
    