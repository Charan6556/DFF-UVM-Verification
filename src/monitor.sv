class dff_monitor extends uvm_monitor;
  // Register this monitor component with the UVM factory.
  `uvm_component_utils(dff_monitor)
  
  virtual dff_intf intf;
  uvm_analysis_port #(dff_seq_item) item_collected_port;
  dff_seq_item tx;
  
  function new (string name="dff_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("monitor class", "constructor", UVM_MEDIUM)
      endfunction
      
      // Create the analysis port and obtain the virtual interface.
      function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      item_collected_port = new("item_collected_port",this);                    
        `uvm_info ("monitor class", "constructor", UVM_MEDIUM)
          if(!uvm_config_db#(virtual dff_intf)::get(this,"","vif", intf))
            `uvm_fatal("NO_INTF_MON", "Virtual interface get failed in monitor")
          endfunction
      // Continuously sample DUT activity and publish observed transactions.
              task run_phase(uvm_phase phase);
                forever begin
                tx = dff_seq_item::type_id::create("tx");
                wait(!intf.rst);
                
                // Sample DFF input and output on the active clock edge.
                @(posedge intf.clk);
                tx.rst = intf.rst;
                tx.q = intf.q;
                tx.d = intf.d;
                item_collected_port.write(tx);

                end
              endtask
      
      endclass
