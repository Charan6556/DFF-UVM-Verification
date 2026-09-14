class dff_test extends uvm_test;
  // Register this test component with the UVM factory.
  `uvm_component_utils(dff_test)
  dff_env env;
  dff_sequence seq;
  function new (string name="dff_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("Test class", "constructor", UVM_MEDIUM)
      endfunction
      
  // build phase
      
      function void build_phase(uvm_phase phase);
      super.build_phase (phase);
      // Create the reusable environment below the test.
      env = dff_env::type_id::create("env", this);
      endfunction
      
   //connect phase
      function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info ("Test class", "connect phase", UVM_MEDIUM)
          endfunction
          
   //end of elobaration phase
          function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  `uvm_info("Test class", "end of elaboration phase", UVM_MEDIUM)
  uvm_top.print_topology();
endfunction 
              
   //run phase
              task run_phase(uvm_phase phase);
                `uvm_info ("Test class", "run phase", UVM_MEDIUM)
                  
                  // Keep run_phase alive until the sequence finishes.
                  phase.raise_objection(this);
                seq = dff_sequence::type_id::create("seq");  
                seq.start(env.agent.seqr);
                  phase.drop_objection(this);
                  endtask
                endclass
