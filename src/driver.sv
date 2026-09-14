class dff_driver extends uvm_driver #(dff_seq_item);
  // Register this driver component with the UVM factory.
  `uvm_component_utils(dff_driver)
  
  virtual dff_intf intf;
  dff_seq_item tx;
  
  function new (string name="dff_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("driver class", "constructor", UVM_MEDIUM)
      endfunction
      
      // Obtain the virtual interface before run_phase starts.
      function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info ("driver class", "connect phase", UVM_MEDIUM)
          if(!uvm_config_db#(virtual dff_intf)::get(this,"","vif", intf))
            `uvm_fatal("no_intf in driver","virtual interface get failed from config db");
          endfunction
        // Repeatedly receive sequence items and drive them onto the interface.
        task run_phase(uvm_phase phase);
          forever begin
            `uvm_info ("driver class", "run phase", UVM_MEDIUM)
            seq_item_port.get_next_item(tx);
            drive(tx);
            seq_item_port.item_done();
          end
        endtask
        // Drive on the falling edge so the DUT can sample stable inputs at posedge.
        task drive(dff_seq_item tx);
          @(negedge intf.clk)
          intf.rst<= tx.rst;
          intf.d<= tx.d;
         
        endtask
        
        
      endclass
