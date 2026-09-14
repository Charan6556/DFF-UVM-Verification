class dff_env extends uvm_env;
  // Register this environment component with the UVM factory.
  `uvm_component_utils(dff_env)
  dff_agent agent;
dff_scoreboard scoreboard;
  function new (string name="dff_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info ("environment class", "constructor", UVM_MEDIUM)
      endfunction
      
     //build phase
      function void build_phase(uvm_phase phase);
      super.build_phase (phase);
      // Create the agent and scoreboard as children of the environment.
      agent = dff_agent::type_id::create("agent", this);
      scoreboard = dff_scoreboard::type_id::create("scoreboard",this);
      endfunction

      //connect phase
      function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info ("environment class", "constructor", UVM_MEDIUM)
        agent.mon.item_collected_port.connect(scoreboard.item_collected_export);
          endfunction
        endclass
      
      
     
