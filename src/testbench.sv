`timescale 1ns/1ns;

`include "uvm_macros.svh"
import uvm_pkg::*; // Provides the UVM base classes.
 `include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"
module top;
  logic clk;
  
  dff dut(
    .clk(intf.clk),
    .rst(intf.rst),
    .q(intf.q),
    .d(intf.d)
    );
  
 
  dff_intf intf(.clk(clk));
  // Share the interface handle with UVM components through the configuration DB.
  initial begin
    uvm_config_db#(virtual dff_intf)::set(null, "*", "vif", intf);
  run_test("dff_test");
  end
  
  initial 
    clk = 0;
    
    always #5 clk = ~clk;
  
  initial begin
    $monitor("%0t clk = %0d", $time, clk);

 
  end
       initial begin
  $dumpfile("dump.vcd");
         $dumpvars(0, dut);
end               
  endmodule
                     
